// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text.dart';
import 'package:tic_tac_toe/widgets/custom_text_feild.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListner(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 200,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: 'Create Room',
              shadows: [Shadow(blurRadius: 40.0, color: Colors.blue)],
              fontSize: 50.0,
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            CustomTextFeild(
              controller: _nameController,
              hintText: 'Enter Your Nick Name .',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(
                onTap: () {
                  print("Insode onTap ");
                  print(_nameController.text);
                  _socketMethods.CreateRoom(_nameController.text);
                },
                label: 'Create')
          ],
        ),
      ),
    );
  }
}
