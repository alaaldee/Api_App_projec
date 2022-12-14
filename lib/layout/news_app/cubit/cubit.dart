// import 'package:bar/layout/news_app/cubit/states.dart';
// import 'package:bar/modules/science/science.dart';
// import 'package:bar/modules/settings/settings.dart';
// import 'package:bar/modules/sports/sports.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../modules/business/business.dart';
// import '../../../shared/network/remode/dio_helpeer.dart';

// class NewsCubit extends Cubit<NewsStats> {
//   NewsCubit() : super(NewsInitialState());
//   static NewsCubit get(context) => BlocProvider.of(context); //oop
//   List<Widget> Screens = [
//     BusinessScreen(),
//     SportsScreen(),
//     ScienceScreen(),
//     SettingsScreen(),
//   ];
//   int currentIndex = 0;
//   List<BottomNavigationBarItem> bottomItems = [
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.business,
//       ),
//       label: 'Business',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.sports,
//       ),
//       label: 'Sports',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.science,
//       ),
//       label: 'Science',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.settings,
//       ),
//       label: 'Settings',
//     ),
//   ];
//   void changeBottomnNavBar(index) {
//     currentIndex = index;
//     if (index == 1) getSports();
//     if (index == 2) getScience();
//     emit(NewsBottomNavStat());
//   }

//   List<dynamic> business = [];
//   void getBusiness() {
//     emit(LogininBudineesStats());
//     DioHelpeer.getData(
//       Url: 'v2/top-headlines',
//       query: {
//         'country': 'us',
//         'category': 'business',
//         'apiKey': '865b7c0b8f594302b856386f7b2d9a5a'
//       },
//     ).then((value) {
//       business = value.data['articles'];

//       emit(NewsGetBudineesStats());
//     }).catchError((error) {
//       print(
//           "************************************error********************************");
//       emit(errorBudineesStats(error));
//       print(error.toString());
//       print('**********************************eror**************************');
//     });
//   }

//   List<dynamic> sports = [];
//   void getSports() {
//     emit(NewsLoginSportsStats());
//     DioHelpeer.getData(
//       Url: 'v2/top-headlines',
//       query: {
//         'country': 'us',
//         'category': 'sport',
//         'apiKey': '865b7c0b8f594302b856386f7b2d9a5a'
//       },
//     ).then((value) {
//       sports = value.data['articles'];

//       emit(NewsGetSportsStats());
//     }).catchError((error) {
//       print(
//           "************************************error********************************");
//       emit(errorSportsStats(error));
//       print(error.toString());
//       print('**********************************eror**************************');
//     });
//   }

//   List<dynamic> science = [];
//   void getScience() {
//     emit(NewsLoginScienceStats());
//     DioHelpeer.getData(
//       Url: 'v2/top-headlines',
//       query: {
//         'country': 'us',
//         'category': 'science',
//         'apiKey': '865b7c0b8f594302b856386f7b2d9a5a'
//       },
//     ).then((value) {
//       science = value.data['articles'];

//       emit(NewsGetScienceStats());
//     }).catchError((error) {
//       print(
//           "************************************error********************************");
//       emit(errorScienceStats(error));
//       print(error.toString());
//       print('**********************************eror**************************');
//     });
//   }
// }

import 'package:apiapp/layout/news_app/cubit/states.dart';
import 'package:apiapp/modules/business/business.dart';
import 'package:apiapp/modules/science/science.dart';

import 'package:apiapp/modules/sports/sports.dart';
import 'package:apiapp/shared/network/local/cache_helper.dart';

import 'package:cubit_form/cubit_form.dart';

import 'package:flutter/material.dart';

import '../../../shared/network/remode/dio_helpeer.dart';

class AppCubit extends Cubit<AppStatss> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
}

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStats());
  //oop من NewsCubit
  // static NewsCubit get(context) => BlocProvider.of(context);
  // static NewsCubit get(context) => BlocProvider.of(context);
  static NewsCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const businessScreen(),
    const sportsScreen(),
    const scienceScreen(),
  ];
  int currintIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business_sharp,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];
  void changeBottomNavBar(int index) {
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    currintIndex = index;
    emit(NewsButtomNavStats());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsLoginBusinessStats());
    DioHelpeer.getData(
      url: 'v2/top-headlines',
      query: {
        'country=': 'eg',
        'category': 'business',
        'apiKey': '865b7c0b8f594302b856386f7b2d9a5a',
      },
    ).then((value) {
      business = value.data['articles'];
      print(value.data['articles'][0]["title"]);
      emit(NewsGetBusinessStats());
    }).catchError((Error) {
      print(Error.toString());
      emit(errorBusinessStatas(Error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    if (sports.length == 0) {
      emit(NewsLoginSportsStats());
      DioHelpeer.getData(
        url: 'v2/top-headlines',
        query: {
          'country=': 'eg',
          'category': 'sports',
          'apiKey': '865b7c0b8f594302b856386f7b2d9a5a',
        },
      ).then((value) {
        sports = value.data['articles'];
        print('***********************************************');
        print(value.data['articles'][0]['title']);
        print('****************************************');

        emit(NewsGetSportsStats());
      }).catchError((Error) {
        print(Error.toString());
        print('***********************************************');
        emit(

          errorSportsStatas(Error.toString()),


        );
        print('***********************************************');
      });
    } else {
      emit(NewsGetSportsStats());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    if (science.length == 0) {
      emit(NewsLoginScienceStats());
      DioHelpeer.getData(
        url: 'v2/top-headlines',
        query: {
          'country=': 'eg',
          'category': 'science',
          'apiKey': '865b7c0b8f594302b856386f7b2d9a5a',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceStats());
      }).catchError((Error) {
        print(Error.toString());
        emit(errorScienceStatas(Error.toString()));
      });
    } else {
      emit(NewsGetScienceStats());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsLoginSearchStats());
    DioHelpeer.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '865b7c0b8f594302b856386f7b2d9a5a',
      },
    ).then((value) {
      search = value.data['articles'];
      print(value.data['articles'][0]["title"]);
      emit(NewsGetSearchStats());
    }).catchError((Error) {
      print(Error.toString());
      emit(errorSearchStatas(Error.toString()));
    });
  }

  bool isDarek = true;
  void changisDarek({bool? formDarek}) {
    if (formDarek != null) {
      isDarek = formDarek;
      emit(darek());
    } else {
      isDarek = !isDarek;
      CacheHelper.potBolean(key: 'is', value: isDarek)
          .then((value) => emit(darek()));
    }
  }
}
