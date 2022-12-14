import 'package:apiapp/layout/news_app/cubit/cubit.dart';
import 'package:apiapp/layout/news_app/cubit/states.dart';

import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

import '../../shared/componts/cmponts.dart';

class scienceScreen extends StatelessWidget {
  const scienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return articaleBuilder(list);
      },
    );
  }
}
