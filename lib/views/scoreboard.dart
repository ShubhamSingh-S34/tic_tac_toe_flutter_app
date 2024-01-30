import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                roomDataProvider.player1.nickname,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                roomDataProvider.player1.points.toInt().toString(),
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                roomDataProvider.player2.nickname,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                roomDataProvider.player2.points.toInt().toString(),
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
