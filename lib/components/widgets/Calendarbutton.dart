import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/FormaterElem.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/GamesModel.dart';

///
///
///
class Calendarbutton extends StatelessWidget {
  ///
  ///
  ///
  onTapDate(BuildContext context) {
    ActionsComposite.selectDate(context);
  }

  ///
  ///
  ///
  getNavButton(BuildContext context, bool right) {
    return Expanded(
        flex: 1,
        child: Container(
            alignment: Alignment(0.0, 0.0),
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(5.0),
            color: Themedata.white,
            child: InkWell(
              child: Icon(right ? Icons.chevron_right : Icons.chevron_left),
              onTap: () async => await ActionsComposite.loadClosestGamesToDate(context, right, false),
            )));
  }

  ///
  ///
  ///
  getCalendarButton(BuildContext context) {
    final GamesModel games = Provider.of<GamesModel>(context);

    return Expanded(
        flex: 8,
        child: Container(
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(5.0),
            color: Themedata.white,
            alignment: Alignment(0.0, 0.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon( Icons.calendar_today, color: Colors.black, size: 20,),
                  SizedBox(width: 5),
                  Text(
                    FormaterElem.getDateFormated(games.selectedDate.toString(), false), 
                    style: TextStyle(color: Colors.black,),
                  ),
                ],
              ),
              onTap: () => onTapDate(context),
            )));
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          getNavButton(context, false),
          getCalendarButton(context),
          getNavButton(context, true),
        ],
      ),
    );
  }
}
