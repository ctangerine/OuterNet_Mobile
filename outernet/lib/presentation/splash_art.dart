import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/data/data_sources/local_datasouces/secure_storage.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_bloc.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_events.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_state.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_events.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_state.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/account_screen/login_screen.dart';
import 'package:outernet/presentation/screens/home_screen/page_selector.dart';
import 'package:outernet/presentation/screens/notifications/noti_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final Color color = const Color.fromARGB(255, 0, 109, 95);
  final AppDatabase _db = dbProvider.database;
  late AuthorizationBloc _authBloc;
  late UserBloc _userBloc;
  late String token;

  @override
  void initState() {
    super.initState();
    _invokeNotificationService(1);
    _authBloc = sl<AuthorizationBloc>();
    _userBloc = sl<UserBloc>();
    _initialize();
  }

  Future<void> _initialize() async {
    final loginInfor = await _db.getLogin();
    if (loginInfor != null) {
      _authBloc.add(LoginRequested(loginInfor[0], loginInfor[1], true));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthorizationBloc, AuthState>(
          bloc: _authBloc,
          listener: (context, state) {
            if (state is Authenticated) {
              _userBloc.add(GetUserDetailEvent());
            } else if (state is AuthFailed) {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }
          },
        ),
        BlocListener<UserBloc, UserState>(
          bloc: _userBloc,
          listener: (context, state) {
            if (state is UserLogedIn) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: _userBloc,
                    child: PageSelector(userId: state.user.id!, token: token),
                  ),
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'T',
                  style: GoogleFonts.frederickaTheGreat(
                    fontSize: 60, // Bigger font size for the first letter
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'ravel ',
                  style: GoogleFonts.frederickaTheGreat(
                    fontSize: 40,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'B',
                  style: GoogleFonts.frederickaTheGreat(
                    fontSize: 60, // Bigger font size for the letter B
                    color: color, // Change color of the letter B
                  ),
                ),
                TextSpan(
                  text: 'uddy',
                  style: GoogleFonts.frederickaTheGreat(
                    fontSize: 40,
                    color: color,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _invokeNotificationService(int id) async {
    token = await SecureStorage.getToken();
  }
}