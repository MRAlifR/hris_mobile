// Package imports:
import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  SimpleLogPrinter(this.className);
  final String className;

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level]!;
    var emoji = PrettyPrinter.levelEmojis[event.level];
    if (event.level == Level.error) {
      return [
        color('$emoji $className - ${event.message} - ${event.stackTrace}')
      ];
    }
    return [color('$emoji $className - ${event.message}')];
  }
}

Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}
