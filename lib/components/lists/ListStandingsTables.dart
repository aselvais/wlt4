import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/Standingdata.dart';
import 'package:wlt3/models/StandingsModel.dart';

///
///
///
class ListStandingsTables extends StatelessWidget {
  ///
  ///
  ///
  Widget getRow(BuildContext context, List<Standingdata> _standingdata,
      Standingdata _standingdataFirstLine, bool isLandscape, String title) {
    _columns = [
      (DataColumn(
        label: Text(''.toUpperCase()),
      )),
      (_standingdataFirstLine.team != null)
          ? DataColumn(label: Text('team'.toUpperCase()))
          : null,
      (_standingdataFirstLine.gp != null)
          ? DataColumn(label: Text('gp'.toUpperCase()))
          : null,
      (_standingdataFirstLine.w != null)
          ? DataColumn(label: Text('w-l-t'.toUpperCase()))
          : null,
      (_standingdataFirstLine.so != null)
          ? DataColumn(label: Text('so'.toUpperCase()))
          : null,
      (_standingdataFirstLine.pts != null)
          ? DataColumn(label: Text('pts'.toUpperCase()))
          : null,
      (isLandscape == true && _standingdataFirstLine.gf != null)
          ? (DataColumn(
              label: Text('gf'.toUpperCase()),
            ))
          : null,
      (isLandscape == true && _standingdataFirstLine.ga != null)
          ? (DataColumn(
              label: Text('ga'.toUpperCase()),
            ))
          : null,
      (isLandscape == true && _standingdataFirstLine.pim != null)
          ? (DataColumn(
              label: Text('pim'.toUpperCase()),
            ))
          : null,
      (isLandscape == true && _standingdataFirstLine.gfavg != null)
          ? (DataColumn(
              label: Text('gfavg'.toUpperCase()),
            ))
          : null,
      (isLandscape == true && _standingdataFirstLine.plusminus != null)
          ? (DataColumn(
              label: Text('+|-'),
            ))
          : null,
      (isLandscape == true && _standingdataFirstLine.rfavg != null)
          ? (DataColumn(
              label: Text('rfavg'.toUpperCase()),
            ))
          : null,
      (isLandscape == true && _standingdataFirstLine.strk != null)
          ? (DataColumn(
              label: Text('strk'.toUpperCase()),
            ))
          : null,
    ];
    _cell = [
      (DataCell(
          Image.network(standingdata?.imgurl ?? '', width: 30, height: 30),
          onTap: () => ActionsComposite.goToTeamDetailScreen(
              context, standingdata.teamId))),
      (standingdata.team != null)
          ? (DataCell(
              Text(
                '${standingdata.team}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (standingdata.gp != null)
          ? (DataCell(Text('${standingdata.gp}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (standingdata.w != null)
          ? (DataCell(
              Text(
                  '${standingdata.w}-${standingdata.l}-${standingdata?.t ?? ''}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (standingdata.so != null)
          ? (DataCell(Text('${standingdata.so}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (standingdata.pts != null)
          ? (DataCell(Text('${standingdata.pts}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (isLandscape == true && standingdata.gf != null)
          ? (DataCell(Text('${standingdata.gf}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (isLandscape == true && standingdata.ga != null)
          ? (DataCell(Text('${standingdata.ga}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (isLandscape == true && standingdata.pim != null)
          ? (DataCell(Text('${standingdata.pim}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (isLandscape == true && standingdata.gfavg != null)
          ? (DataCell(Text('${standingdata.gfavg.toStringAsPrecision(4)}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (isLandscape == true && standingdata.plusminus != null)
          ? (DataCell(Text('${standingdata.plusminus}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (isLandscape == true && standingdata.rfavg != null)
          ? (DataCell(Text('${standingdata.rfavg}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
      (isLandscape == true && standingdata.strk != null)
          ? (DataCell(Text('${standingdata.strk}'),
              onTap: () => ActionsComposite.goToTeamDetailScreen(
                  context, standingdata.teamId)))
          : null,
    ];

    return Column(
      children: <Widget>[
        Text(title,
            style: TextStyle(
                height: 3, fontWeight: FontWeight.bold, fontSize: 16)),
        Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                    ),
                    child: DataTable(
                      columnSpacing: 0,
                      dataRowHeight: 30,
                      columns: _columns.where((t) => t != null).toList(),
                      rows: _standingdata
                          .map((standingdata) => DataRow(
                                cells: _cell.where((t) => t != null).toList(),
                              ))
                          .toList(),
                    )))
          ],
        ),
      ],
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    if (ActionsComposite.isLoading(context) == true)
      return Center(child: CircularProgressIndicator());
    else {
      bool isLandscape =
          MediaQuery.of(context).orientation == Orientation.landscape;
      StandingsModel _standingsModel = Provider.of<StandingsModel>(context);

      try {
        return Column(
            children: _standingsModel.list
                .map((_standing) => getRow(
                    context,
                    _standing.data,
                    _standing.data.first,
                    isLandscape,
                    (_standing.title != '' && _standing.title != null)
                        ? _standing.title
                        : ''))
                .toList());
      } catch (ee) {
        print(ee);
        return Center(child: Text('Error... ' + ee.toString()));
      }
    }
  }
}
