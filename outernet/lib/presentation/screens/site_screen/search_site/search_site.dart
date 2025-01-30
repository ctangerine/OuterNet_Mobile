import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/site_screen/site_detail/site_detail_screen.dart';
import 'package:outernet/presentation/ui_component_resused/site_card.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  late SiteBloc _siteBloc;

  @override
  void initState() {
    _siteBloc = sl<SiteBloc>();
    super.initState();
    logger.f('call init state');
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    logger.f('call dispose');
    super.dispose();
  }

  void _onSearchChanged(BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      final SearchParams params = SearchParams(q: searchController.text, page: 1);
      _siteBloc.add(SearchSites(params));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SiteBloc>.value(
      value: _siteBloc,
      child: Builder(
        builder: (context) {
          return _buildContent(context);
        }
      ),
    );
  }

  Scaffold _buildContent(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nhập tên địa điểm...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: searchController,
                onChanged: (value) => _onSearchChanged(context),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<SiteBloc, SiteState>(
                  builder: (context, state) {
                    if (state is LoadListSiteSuccess) {
                      if (state.isSearchedSites == true) {
                        final locations = state.siteByLoc;
        
                        return ListView.separated(
                          itemCount: locations.length,
                          separatorBuilder: (context, index) => SizedBox(height: 40),
                          itemBuilder: (context, index) {
                            final location = locations[index];
                            return GestureDetector(
                              onTap: () {
                                final bloc = BlocProvider.of<SiteBloc>(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider.value(
                                      value: bloc,
                                      child: SiteDetailScreen(siteId: location.siteId!),
                                    ),
                                  ),
                                ).then((_) {
                                  logger.e('back from detail');
                                  setState(() {
                                    _siteBloc.close();
                                    _siteBloc = sl<SiteBloc>();
                                    searchController.clear();
                                  });
                                });
                              },
                              child: SiteCard(
                                site: location,
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('Không tìm thấy kết quả'));
                      }
                    } else if (state is LoadListSiteFailed) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}