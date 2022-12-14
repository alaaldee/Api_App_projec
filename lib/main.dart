
import 'package:apiapp/layout/news_app/cubit/cubit.dart';
import 'package:apiapp/layout/news_app/cubit/states.dart';
import 'package:apiapp/shared/network/local/cache_helper.dart';
import 'package:apiapp/shared/network/remode/dio_helpeer.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hexcolor/hexcolor.dart';

import 'layout/news_app/news_layout.dart';

void main() async {
  //بتاكد انو كل الميثودات خلصت بعدين بعمل رن للاب
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer;
  DioHelpeer.init();
  await CacheHelper.init();

  bool? isd = CacheHelper.getBolean(key: 'is');
  runApp(MyApp(isd!));
}

class MyApp extends StatelessWidget {
  late final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..changisDarek(formDarek: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                backgroundColor: Colors.white,
                elevation: 0,
                backwardsCompatibility: false, //عشان اغير اللي فوق appBar
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                actionsIconTheme: IconThemeData(color: Colors.black),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepOrange,
                elevation: 0,
              ),
              textTheme: const TextTheme(
                headline6: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('0C090A'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backgroundColor: HexColor('0C090A'),
                elevation: 0,
                backwardsCompatibility: false, //عشان اغير اللي فوق appBar
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('0C090A'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                actionsIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('0C090A'),
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepOrange,
                elevation: 0,
              ),
              textTheme: TextTheme(
                headline6: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDarek
                ? ThemeMode.light
                : ThemeMode.dark,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
