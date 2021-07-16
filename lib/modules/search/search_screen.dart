import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SerachScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value){
                      AppCubit.get(context).getSearch(value);
                    },
                    validate: (String? value)
                    {
                      if(value!.isEmpty)
                        return 'search must not be empty';
                      else
                        return null;
                    },
                    label: 'Search',
                    prefix: Icons.search
                ),
              ),
              Expanded(child: articleBuilder(list,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
