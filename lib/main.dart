import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toing_clone/core/app_router/app_router.dart';
import 'package:toing_clone/core/constent/app_string.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        ScreenUtil.init(context);
        return MaterialApp.router(
          title: AppString.appName,
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
            fontFamily: AppString.font,
          ),
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
