import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/TeamModel.dart';

///
///
///
class TeamElement extends StatelessWidget {
  final Team? team;

  ///
  ///
  ///
  TeamElement({Key? key, @required this.team}) : super(key: key);

  ///
  ///
  ///
  onTapElement(BuildContext context) {
    ActionsComposite.goToTeamDetailScreen(context, team.teamId);
  }

  ///
  ///
  ///
  Widget getTheIcon(BuildContext context) {
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    return (favorites.isInTeamsFavorite(team?.teamId) == true)
        ? Icon(
            Icons.star,
            color: Colors.yellow,
          )
        : Icon(
            Icons.star_border,
            color: Colors.grey,
          );
  }

  ///
  ///
  ///
  Widget getButton(BuildContext context) {
    Image img01;
    try {
      img01 = Image.network(team.imageUrl, width: 30, height: 30);
    } catch (eee) {}
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: InkWell(child: img01, onTap: () => onTapElement(context)),
        ),
        Expanded(
          flex: 8,
          child: InkWell(
              child: Column(children: [
                Text(team.teamName.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Themedata.blue,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold)),
                Text(team.divisionName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.0)),
              ]),
              onTap: () => onTapElement(context)),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
              child: this.getTheIcon(context),
              onTap: () =>
                  ActionsComposite.onTapTeamFavorite(context, team, false)),
        ),
      ],
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final TeamModel teammodel = Provider.of<TeamModel>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      height: 60,
      child: (ActionsComposite.isLoading(context) == true &&
              team?.teamId == teammodel.selectedId)
          ? Center(child: CircularProgressIndicator())
          : getButton(context),
    );
  }
}
