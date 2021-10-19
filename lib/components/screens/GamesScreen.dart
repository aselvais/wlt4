import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListGames.dart';
import 'package:wlt3/components/widgets/Buttonlist.dart';
import 'package:wlt3/components/widgets/Calendarbutton.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';

class GamesScreen extends StatelessWidget {
  ///
  ///
  ///
  onTapSeasons(BuildContext context) {
    Navigator.popUntil(context, (route) {
      ActionsComposite.lastRouteName = route.settings.name;
      return true;
    });
    Navigator.pushNamed(context, '/seasons');
  }

  ///
  ///
  ///
  onTapDivisions(BuildContext context) {
    Navigator.popUntil(context, (route) {
      ActionsComposite.lastRouteName = route.settings.name;
      return true;
    });
    Navigator.pushNamed(context, '/divisions');
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final Season? season = Provider.of<SeasonsModel>(context).selectedModel;
    final Division? division =
        Provider.of<DivisionsModel>(context).selectedModel;

    return Scaffold(
        backgroundColor: Themedata.greyBackground,
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      child: Buttonlist(
                          title: 'Season', subtitle: season?.name ?? ''),
                      onTap: () => onTapSeasons(context),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Buttonlist(
                          title: 'Division', subtitle: division?.name ?? ''),
                      onTap: () => onTapDivisions(context),
                    ),
                  )
                ],
              ),
            ),
            Calendarbutton(),
            Expanded(
              flex: 9,
              child: ListGames(),
            ),
          ],
        ));
  }
}
