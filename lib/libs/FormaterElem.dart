import 'package:intl/intl.dart';

class FormaterElem {
  ///
  ///
  ///
  static String getDateFormated(String dtstr, bool showTime) {
    DateTime dt = DateTime.parse(dtstr);
    String fftoday =
        new DateFormat("EEE MMM d, yyyy", "en_US").format(DateTime.now());
    String ff = new DateFormat("EEE MMM d, yyyy", "en_US").format(dt);
    if (ff == fftoday) ff = "Today";
    String ff2 = new DateFormat.jm().format(dt);
    if (showTime == true)
      return ff + "\n" + ff2;
    else
      return ff;
  }
}
