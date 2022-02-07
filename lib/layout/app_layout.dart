import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/modules/search_screen.dart';
import 'package:weather_app/shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        WeatherModel? weather = AppCubit.get(context).weatherData;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppCubit.get(context).getThemeColor(),
            elevation: 0.0,
            title: Text(
              'Weather App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          backgroundColor: AppCubit.get(context).getThemeColor(),
          body:  AppCubit.get(context).weatherData == null ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('There is no wether',style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
                Text('search for weather now',textAlign: TextAlign.center,style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
              ],
            ),
          ): Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [
          AppCubit.get(context).getThemeColor()!,
          AppCubit.get(context).getThemeColor()!.shade50,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        ),
        ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3,),
                Text('${AppCubit.get(context).cityName}',style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
                Text('Update at ${weather!.date?.hour} : ${weather.date?.minute}',style: TextStyle(fontSize: 23),),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('${AppCubit.get(context).getImage(weather.weather_state_name)}',height: 70,width: 70,),
                    Text('${weather.the_temp?.round()}',style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
                    Column(
                      children: [
                        Text('max: ${weather.max_temp?.round()}',style: TextStyle(fontSize: 23),),
                        Text('min: ${weather.min_temp?.round()}',style: TextStyle(fontSize: 23),),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Text('${weather.weather_state_name}',style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
                Spacer(flex: 3,),
              ],
            ),
          ),
        );
      },
    );
  }
}




