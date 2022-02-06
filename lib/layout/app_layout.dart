import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Weather App',
            ),
            actions: [
              IconButton(
                onPressed: () {  },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body:  Column(
            children: [

            ],
          ),
        );
      },
    );
  }
}




