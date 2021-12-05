import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

import 'core/constants/app_constants.dart';
import 'core/route_generator.dart';
import 'core/utils/dev_utils.dart';
import 'core/utils/sizeConfig/size_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) async {
    final exception = details.exception;
    final stackTrace = details.stack;
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(exception, stackTrace!);
    }
  };

  runZonedGuarded<Future<void>>(()async {
    runApp(
        DevicePreview(
            enabled: false,
            builder: (context) =>

                     const MyApp()

        )

    );

  }, (error, stackTrace) async{


  });


}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(
        builder: (context, constraints){
          return  OrientationBuilder(builder: (context, orientation){
            SizeConfig().init(constraints, orientation);
            return  OverlaySupport(
                child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Squamobi',
                theme: ThemeData(
                  fontFamily: 'DMSans',
                  textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Colors.grey
                  ),
                  brightness: Brightness.light,
                  primaryColor: const Color(0xFF17181f),
                ),
                  initialRoute: '/',

                  onGenerateRoute: (settings) => RouteRegenerator.generateRoute(settings),
            ));
          });
        });



  }
}


