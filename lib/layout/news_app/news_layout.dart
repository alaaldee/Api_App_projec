import 'package:apiapp/layout/news_app/cubit/cubit.dart';
import 'package:apiapp/layout/news_app/cubit/states.dart';
import 'package:apiapp/modules/search/search_screen.dart';
import 'package:apiapp/shared/componts/cmponts.dart';

import 'package:cubit_form/cubit_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: ((context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  navigatorTo(
                    context,
                    searchScreen(),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).changisDarek();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currintIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currintIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      }),
    );
  }
}
