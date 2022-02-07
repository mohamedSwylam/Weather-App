import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/cubit.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/shared/network/remote/web_services.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Search',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
              onSubmitted: (value){
                AppCubit.get(context).getWeather(value);
                AppCubit.get(context).cityName=value;
                Navigator.pop(context);
              },
              onChanged: (value){},
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Search',
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){},
                ),
              ),
          ),
            ),
            ],
          ),
        );
      },
    );
  }
}




