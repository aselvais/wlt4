import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/widgets/GameElement.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';

class ListGames extends StatelessWidget {
  ///
  /// Generic containing with list of elements inside (passed as param)
  ///
  Widget getContent(BuildContext context, Widget wl) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Themedata.greyBackground,
        child: wl);
  }

  ///
  ///
  ///
  Widget getEmptyContent(BuildContext context, String txt) {
    return InkWell(
      child: getContent(
          context,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                  size: 40,
                ),
                Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          )),
      onTap: () => ActionsComposite.selectDate(context),
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<GamesModel>(context);
    if (ActionsComposite.isLoading(context) == true) {
      return Center(child: CircularProgressIndicator());
    } else {
      if (_list.list.length == 0) {
        return getEmptyContent(context, '\nNo matches...\n\nClick on the calendar to chose another date.');
      } else {
        return RefreshIndicator(
          child:ListView(
            children: _list.list.map<Widget>((Game f) => GameElement(game: f)).toList(),
          ),
        onRefresh: () => ActionsComposite.reloadGames(context),
        );
      }
    }
  }
  
}
