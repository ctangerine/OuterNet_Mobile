import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/env/config.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_bloc.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/current_coding_page.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/helper_widgets/back_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String env = String.fromEnvironment('env', defaultValue: 'dev');
  final config = await ConfigLoader.load(env);

  ConfigManager().init(config);
  await initInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthorizationBloc>()),
        BlocProvider(create: (_) => sl<UserBloc>()),
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
