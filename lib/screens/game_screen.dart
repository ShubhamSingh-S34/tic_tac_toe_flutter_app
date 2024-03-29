import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/views/scoreboard.dart';
import 'package:tic_tac_toe/views/waiting_lobby_widget.dart';
import 'package:tic_tac_toe/widgets/tictactoe_board.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.updatePlayersStateListner(context);
    _socketMethods.updateRoomListner(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    String text = Provider.of<RoomDataProvider>(context).roomData.toString();
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScoreBoard(),
                const TicTacToeBoard(),
                Text(
                    '${roomDataProvider.roomData['turn']['nickname']}\'s turn'),
              ],
            )),
    );
  }
}
