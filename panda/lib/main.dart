import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pandamedical/blocs/base_bloc.dart';
import 'package:pandamedical/helpers/storage/storage.helper.dart';
import 'package:pandamedical/helpers/storage/storage.keys.dart';
import 'package:pandamedical/router.dart' as router;
import 'helpers/storage/storage.helper.dart';
import 'views/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

Future<bool> isFirstLaunch() async {
  var check = await StorageHelper.get(StorageKeys.firstUser);
  if (check == null) {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'), // English
          Locale('th', 'TH'), // Thai
        ],
        title: 'Panda Medical',
        onGenerateRoute: router.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home:
            SplashScreen(), // MyVitalsView DashboardView(), //DoctorDetailView  AddVitalView MyVitalsView
      ),
    );
  }
}
