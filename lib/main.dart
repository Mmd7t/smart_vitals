import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitans/pages/splash_screen.dart';
import 'package:smart_vitans/providers/navbar_provider.dart';
import 'package:smart_vitans/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavBarProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'medical Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: AppColors.cDarkblue,
            accentColor: AppColors.clightGreen,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'lato',
            buttonTheme: ButtonThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0))),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}



/*

add in my scans (upload photos, notes, date, symtopms)

 */