import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListStandingsTables.dart';
import 'package:wlt3/components/widgets/Buttonlist.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/TiersModel.dart';

class StandingsScreen extends StatelessWidget {
  ///
  ///
  ///
  onTapTiers(BuildContext context) {
    ActionsComposite.goToTiersScreen(context);
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
  Widget getTiersButton(BuildContext context) {
    final tiers = Provider.of<TiersModel>(context);
    final Division? division =
        Provider.of<DivisionsModel>(context).selectedModel;
    String? tiersName = '...';
    try {
      tiersName = tiers.selectedModel?.name;
    } catch (ee) {}
    /*
    if (tiers.loading == true || tiers.list.length == 0) {
      return Container();
    } else {
    */
    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            child:
                Buttonlist(title: 'Division', subtitle: division?.name ?? ''),
            onTap: () => onTapDivisions(context),
          ),
        ),
        (tiers.list.length != 0)
            ? Expanded(
                flex: 1,
                child: InkWell(
                  child: Buttonlist(
                    title: 'Tiers',
                    subtitle: tiersName,
                  ),
                  onTap: () => onTapTiers(context),
                ),
              )
            : Container(),
      ],
    );
    //}
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Themedata.greyBackground,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              getTiersButton(context),
              Expanded(
                flex: 9,
                child: (ActionsComposite.isLoading(context) == true)
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: ListStandingsTables(),
                      ),
              )
            ],
          ),
        ));
  }
}
