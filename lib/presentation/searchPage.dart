import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';
import 'widgets/Mysprator.dart';
import 'widgets/itemSerarch.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          var list2 = WeatherCubit.get(context).search;

          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: const Color(0xff2D3741),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                    right: 10
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: cubit.searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      cubit.getSearch(value);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: list2.isNotEmpty,
              fallback: (BuildContext context) {
                return Center(child: const CircularProgressIndicator());
              },
              builder: (BuildContext context) {
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                  const separator(),
                  itemCount: list2.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ItemSearch(list: list2[index]),
                );
              },

            ),
          );
        }
    );
  }
}
