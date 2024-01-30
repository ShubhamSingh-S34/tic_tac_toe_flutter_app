import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://192.168.31.118:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket?.connect();
    socket?.on('connect', (_) {
      print('Connected to server');
    });
    socket?.on('connect_error', (error) {
      print('Connection ERRRRORRRRRRR: $error');
    });
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
