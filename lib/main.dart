import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/core/app_router.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as DI;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DI.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BanglaSagar',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
      //  primarySwatch: Colors.blue,
        iconTheme: IconThemeData(color: kHiglightedColor )
        
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}

