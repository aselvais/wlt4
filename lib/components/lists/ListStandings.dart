import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/Standingdata.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/Standing.dart';

class ListStandings extends StatelessWidget {
  ///
  ///
  ///
  onTapTeam(BuildContext context, Standingdata team) {
    ActionsComposite.goToTeamDetailScreen(context, team.teamId);
  }

  ///
  ///
  ///
  Widget getCell(String txt, bool isHeader) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          txt,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
        ));
  }

  ///
  ///
  ///
  Widget getElement(BuildContext context, Standingdata f, String k) {
    try {
      switch (k) {
        case 'imgurl':
          {
            return InkWell(
              child: Image.network(f.imgurl.toString(), width: 30, height: 30),
              onTap: () => this.onTapTeam(context, f),
            );
          }
          break;
        case 'team':
          {
            return this.getCell(/*'team: ' +*/ f.team.toString(), false);
          }
          break;
        case 'gp':
          {
            return this.getCell(/*'teamId: ' +*/ f.teamId.toString(), false);
          }
          break;
        case 'gp':
          {
            return this.getCell(/*'GP: ' +*/ f.gp.toString(), false);
          }
          break;
        case 'w':
          {
            return this.getCell(/*'W: ' +*/ f.w.toString(), false);
          }
          break;
        case 'l':
          {
            return this.getCell(/*'L: ' +*/ f.l.toString(), false);
          }
          break;
        case 't':
          {
            return this.getCell(/*'T: ' +*/ f.t.toString(), false);
          }
          break;
        case 'pts':
          {
            return this.getCell(/*'PTS: ' +*/ f.pts.toString(), false);
          }
          break;
        case 'gf':
          {
            return this.getCell(/*'GF: ' +*/ f.gf.toString(), false);
          }
          break;
        case 'ga':
          {
            return this.getCell(/*'GA: ' +*/ f.ga.toString(), false);
          }
          break;
        case 'pim':
          {
            return this.getCell(/*'pim: ' +*/ f.pim.toString(), false);
          }
          break;
        case 'gfavg':
          {
            return this.getCell(/*'GFAVG: ' +*/ f.gfavg.toString(), false);
          }
          break;
        case 'plusminus':
          {
            return this
                .getCell(/*'plusminus: ' +*/ f.plusminus.toString(), false);
          }
          break;
        case 'rfavg':
          {
            return this.getCell(/*'rfavg: ' +*/ f.rfavg.toString(), false);
          }
          break;
        case 'strk':
          {
            return this.getCell(/*'STRK: ' +*/ f.strk.toString(), false);
          }
          break;
        default:
          {
            print('--- ERROR ---');
            print(k);
            return this.getCell('', false);
          }
          break;
      }
    } catch (ee) {
      print('--- ERROR ---');
      print(k);
      return this.getCell('', false);
    }
  }

  ///
  ///
  ///
  List<Widget> getRow(BuildContext context, List<Standingdata>? f) {
    List<Widget> toret = [];

    toret.add(Row(
      children: <Widget>[
        this.getCell(''.toUpperCase(), true),
        this.getCell('team'.toUpperCase(), true),
        this.getCell('teamId'.toUpperCase(), true),
        this.getCell('gp'.toUpperCase(), true),
        this.getCell('w'.toUpperCase(), true),
        this.getCell('l'.toUpperCase(), true),
        this.getCell('t'.toUpperCase(), true),
        this.getCell('pts'.toUpperCase(), true),
        this.getCell('gf'.toUpperCase(), true),
        this.getCell('ga'.toUpperCase(), true),
        this.getCell('pim'.toUpperCase(), true),
        this.getCell('gfavg'.toUpperCase(), true),
        this.getCell('+|-', true),
        this.getCell('rfavg'.toUpperCase(), true),
        this.getCell('strk'.toUpperCase(), true),
      ],
    ));

    f?.forEach((Standingdata f) => toret.add(Row(
          children: <Widget>[
            this.getElement(context, f, 'imgurl'),
            this.getElement(context, f, 'team'),
            this.getElement(context, f, 'teamId'),
            this.getElement(context, f, 'gp'),
            this.getElement(context, f, 'w'),
            this.getElement(context, f, 'l'),
            this.getElement(context, f, 't'),
            this.getElement(context, f, 'pts'),
            this.getElement(context, f, 'gf'),
            this.getElement(context, f, 'ga'),
            this.getElement(context, f, 'pim'),
            this.getElement(context, f, 'gfavg'),
            this.getElement(context, f, 'plusminus'),
            this.getElement(context, f, 'rfavg'),
            this.getElement(context, f, 'strk'),
          ],
        )));
    return toret;
  }

  ///
  ///
  ///
  Widget getButton(BuildContext context, Standing f) {
    return Column(children: getRow(context, f.data));
  }

  ///
  ///
  ///
  onTapElement(BuildContext context, Standing model) {}

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<StandingsModel>(context);
    return ListView(
      children: _list.list
          .map<Widget>((Standing f) => (InkWell(
                child: Container(
                  child: getButton(context, f),
                ),
                onTap: () => onTapElement(context, f),
              )))
          .toList(),
    );
  }
}
