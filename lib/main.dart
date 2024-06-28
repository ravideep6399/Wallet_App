import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/Utils/routes/routes.dart';
import 'package:wallet_app/Utils/routes/routes_name.dart';
import 'package:wallet_app/res/colors.dart';
import 'package:wallet_app/viewmodel/airdrop_view_model.dart';
import 'package:wallet_app/viewmodel/auth_view_model.dart';
import 'package:wallet_app/viewmodel/create_wallet_view_model.dart';
import 'package:wallet_app/viewmodel/fund_transfer_view_model.dart';
import 'package:wallet_app/viewmodel/services/splash_services.dart';
import 'package:wallet_app/viewmodel/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => CreateWalletViewModel()),
        ChangeNotifierProvider(create: (_) => TransferFundViewModel()),
        ChangeNotifierProvider(create: (_) => AirdropViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}

// SPLASHSCREEN...

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final service = SplashServices();
  @override
  void initState() {
    super.initState();
    service.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/splashscreen.png"), fit: BoxFit.cover),
      ),
      child: const Center(child: DefaultTextStyle(style: TextStyle(fontSize: 150,color: ColorsApp.splash,fontWeight: FontWeight.bold),
      child: Text("V",)),),
    );
  }
}
