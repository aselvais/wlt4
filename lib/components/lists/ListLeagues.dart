import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/LeaguesModel.dart';

class ListLeagues extends StatelessWidget {
  ///
  ///
  ///
  Widget getButton(BuildContext context, League f) {
    final _list = Provider.of<LeaguesModel>(context);
    bool isSelected = false;
    if (_list.selectedId == f.id) isSelected = true;
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.network(f.imageUrl ?? '', width: 100, height: 100),
          ),
        ),
        Expanded(
          flex: 8,
          child: Text(f.name ?? '',
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
  onTapElement(BuildContext context, League item) {
    ActionsComposite.goToSeasonScreen(context, item);
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<LeaguesModel>(context);
    if (ActionsComposite.isLoading(context) == true) {
      return Center(child: CircularProgressIndicator());
    } else
      return ListView(
        children: _list.list
            .map<Widget>((League f) => (InkWell(
                  child: Container(
                    height: 60,
                    child: getButton(context, f),
                  ),
                  onTap: () => onTapElement(context, f),
                )))
            .toList(),
      );
  }
}
