import 'package:intl/intl.dart';

class AppUtils {
  static String getCreateAtStr(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('HH:mm:ss dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }

  static String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }
}
