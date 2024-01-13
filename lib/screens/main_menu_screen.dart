import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/create_room_screen.dart';
import 'package:tic_tac_toe/screens/join_room_screen.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-screen';
  const MainMenuScreen({super.key});

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomButton(
          onTap: () {
            createRoom(context);
          },
          label: 'Create New Room',
        ),
        const SizedBox(
          height: 10.0,
        ),
        CustomButton(
          onTap: () {
            joinRoom(context);
          },
          label: 'Join New Room',
        ),
      ]),
    );
  }
}
