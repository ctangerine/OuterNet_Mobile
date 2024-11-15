import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/data_sources/database_datasources.dart';
import 'package:outernet/presentation/module_provider/authorization_module_provider.dart';
import 'package:outernet/presentation/module_provider/user_module_provider.dart';
import 'package:outernet/presentation/screens/current_coding_page.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/helper_widgets/back_button.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<PostgreSQLDatasource>(
          create: (_) => PostgreSQLDatasource(),
        ),
        ...authProviders(),
        ...userProviders()
        //BlocProvider(create: (context) => AuthorizationBloc(authorizationUsecase),)
      ],
      child: MaterialApp(
        routes: {
          '/home': (context) => const BackButtonCustom(),
        },
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      // Thiết lập màu nền trắng cho màn hình chính
      backgroundColor: Colors.white,
      body: CurrentCodingPage(),
    );
  }
}
