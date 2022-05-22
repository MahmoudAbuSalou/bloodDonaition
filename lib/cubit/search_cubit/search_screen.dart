import 'package:blood_donation_project/cubit/search_cubit/cubit/search_cubit.dart';
import 'package:blood_donation_project/cubit/search_cubit/cubit/search_states.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      autofocus: true,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        labelText: 'بـحــث',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                        prefixIcon: Icon(IconBroken.Search),
                        suffixIcon: IconButton(
                          icon: Icon(IconBroken.Send),
                          onPressed: () {
                            SearchCubit.get(context)
                                .search(searchController.text);
                          },
                        ),
                      ),
                      onChanged: (String value){
                        print(value);
                      },
                      validator: (String? value){
                        if(value!.isEmpty){
                          return 'Must not be Empty!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    SizedBox(
                      height: 30.0,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => Container(
                            child: Image.asset(
                              'assets/images/blood.png',
                              height: 180.0,
                              width: 180.0,
                            ),
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: 1,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
