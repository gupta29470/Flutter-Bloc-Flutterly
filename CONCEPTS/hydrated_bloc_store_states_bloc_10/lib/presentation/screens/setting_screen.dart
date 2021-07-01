import 'package:bloc_tutorial_1/logic/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting Screen",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: BlocListener<SettingCubit, SettingState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            duration: Duration(milliseconds: 700),
            content: Text(
              'App ' +
                  state.appNotification.toString().toUpperCase() +
                  ', Email ' +
                  state.emailNotification.toString().toUpperCase(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
        },
        child: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    value: state.appNotification,
                    onChanged: (newValue) {
                      context
                          .read<SettingCubit>()
                          .toggleAppNotification(newValue);
                    },
                    title: Text('App Notifications'),
                  ),
                  SwitchListTile(
                    value: state.emailNotification,
                    onChanged: (newValue) {
                      context
                          .read<SettingCubit>()
                          .toggleEmailNotification(newValue);
                    },
                    title: Text('Email Notifications'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
