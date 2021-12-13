import 'dart:async';
import 'dart:io';

import 'package:pokedex/services/app_log/log.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;
import 'package:pokedex/helpers/extensions.dart';

abstract class AppLog {
  static StreamController<Log> _logController = StreamController();
  static Sink get logs => _logController.sink;
  static late File _logFile;

  static Future<void> initAppLog() async {
    final date = DateTime.now();
    final year = date.year.toString();
    final month = date.month.getFormattedField();
    final day = date.day.getFormattedField();
    final dir = await PathProvider.getTemporaryDirectory();
    final logFileName = '${dir.path}/bamboleio_log_$year$month$day.txt';
    _logFile = File(logFileName);
    _logController.stream.listen((event) {
      _logFile.writeAsStringSync(event.toString(), mode: FileMode.append);
      print('Logged $event to ${_logFile.path}');
    });
  }
}
