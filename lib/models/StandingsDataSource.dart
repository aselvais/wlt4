import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/Standingdata.dart';

class StandingsDataSource {
  late List<Standingdata> _standingdata;
  int _selectedCount = 0;
  bool isLandscape = false;
  late BuildContext _context;

  ///
  ///
  ///
  StandingsDataSource(List<Standingdata> d) {
    this._standingdata = d;
  }

  ///
  ///
  ///
  @override
  int get rowCount {
    return _standingdata.length;
  }

  ///
  ///
  ///
  @override
  bool get isRowCountApproximate {
    return false;
  }

  ///
  ///
  ///
  @override
  int get selectedRowCount {
    return _selectedCount;
  }

  ///
  ///
  ///
  _onTap(teamId) async {
    await ActionsComposite.goToTeamDetailScreen(_context, teamId);
  }

  ///
  ///
  ///
  DataRow? getRow(Standingdata? standingdata, int index) {
    List<DataCell> mcells = [];
    if (standingdata != null) {
      DataCell? cell01 = (standingdata.imgurl != null &&
              standingdata.imgurl != '')
          ? (DataCell(
              Image.network(standingdata.imgurl ?? '', width: 30, height: 30),
              onTap: () => this._onTap(standingdata.teamId)))
          : null;
      DataCell cell02 = (DataCell(
          Text(
            '${standingdata.team}',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => this._onTap(standingdata.teamId)));
      DataCell cell03 = (DataCell(Text('${standingdata.gp}'),
          onTap: () => this._onTap(standingdata.teamId)));
      DataCell cell04 = (DataCell(
          Text('${standingdata.w}-${standingdata.l}-${standingdata.t}'),
          onTap: () => this._onTap(standingdata.teamId)));
      DataCell cell05 = (DataCell(Text('${standingdata.pts}'),
          onTap: () => this._onTap(standingdata.teamId)));

      DataCell? cell06 = (this.isLandscape == true)
          ? (DataCell(Text('${standingdata.gf}'),
              onTap: () => this._onTap(standingdata.teamId)))
          : null;

      DataCell? cell07 = (this.isLandscape == true)
          ? (DataCell(Text('${standingdata.ga}'),
              onTap: () => this._onTap(standingdata.teamId)))
          : null;

      DataCell? cell08 = (this.isLandscape == true && standingdata.pim != null)
          ? (DataCell(Text('${standingdata.pim}'),
              onTap: () => this._onTap(standingdata.teamId)))
          : null;

      DataCell? cell09 =
          (this.isLandscape == true && standingdata.gfavg != null)
              ? (DataCell(Text('${standingdata.gfavg?.toStringAsPrecision(4)}'),
                  onTap: () => this._onTap(standingdata.teamId)))
              : null;

      DataCell? cell10 =
          (this.isLandscape == true && standingdata.plusminus != null)
              ? (DataCell(Text('${standingdata.plusminus}'),
                  onTap: () => this._onTap(standingdata.teamId)))
              : null;

      DataCell? cell11 =
          (this.isLandscape == true && standingdata.rfavg != null)
              ? (DataCell(Text('${standingdata.rfavg}'),
                  onTap: () => this._onTap(standingdata.teamId)))
              : null;

      DataCell? cell12 = (this.isLandscape == true && standingdata.strk != null)
          ? (DataCell(Text('${standingdata.strk}'),
              onTap: () => this._onTap(standingdata.teamId)))
          : null;

      List<DataCell?> elem = [
        cell01,
        cell02,
        cell03,
        cell04,
        cell05,
        cell06,
        cell07,
        cell08,
        cell09,
        cell10,
        cell11,
        cell12
      ];

      // elem.where((t) => t != null).toList();
      elem.toList();
    }
    return DataRow.byIndex(index: index, cells: mcells);
  }

  ///
  ///
  ///
  List<DataRow?> getAllRows(BuildContext context) {
    this.isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    this._context = context;
    int u = 0;
    return _standingdata.map((i) => this.getRow(i, u++)).toList();
  }
}
