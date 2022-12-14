import 'package:apiapp/layout/news_app/cubit/cubit.dart';
import 'package:apiapp/layout/news_app/cubit/states.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

import '../../shared/componts/cmponts.dart';

class searchScreen extends StatelessWidget {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, stats) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: search,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'serch must not be empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text(
                      "Sarach",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    prefix: const Icon(Icons.search),
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20.0),
                    filled: true,
                  ),
                ),
              ),
              Expanded(
                child: articaleBuilder(NewsCubit.get(context).search,
                    issearch: true),
              )
            ],
          ),
        );
      },
    );
  }
}
