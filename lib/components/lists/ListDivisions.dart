import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/Division.dart';

class ListDivisions extends StatelessWidget {
  ///
  ///
  ///
  onTapElement(BuildContext context, Division model) {
    ActionsComposite.goToGamesHomeScreen(context, model);
  }

  ///
  ///
  ///
  Widget getButton(BuildContext context, Division f) {
    final _list = Provider.of<DivisionsModel>(context);
    bool isSelected = false;
    if (_list.selectedId == f.id) isSelected = true;
    return Row(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Text(f.name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 18.0)),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            Icons.check,
            color: (isSelected) ? Colors.black : Colors.white,
            size: 24.0,
          ),
        ),
      ],
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<DivisionsModel>(context);
    if (ActionsComposite.isLoading(context) == true) {
      return Center(child: CircularProgressIndicator());
    } else
      return ListView(
        children: _list.list
            .map<Widget>((Division f) => InkWell(
                  child: Container(
                    height: 60,
                    child: getButton(context, f),
                  ),
                  onTap: () => onTapElement(context, f),
                ))
            .toList(),
      );
  }
}
