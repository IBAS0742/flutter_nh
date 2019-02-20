import 'package:flutter/material.dart';
import 'package:test_one/demo/button_dmo.dart';
import 'package:test_one/demo/flat_action_button_demo.dart';
import 'package:test_one/demo/popup_menu_button.dart';
import 'package:test_one/demo/form_demo.dart';
import 'package:test_one/demo/checkbox_demo.dart';
import 'package:test_one/demo/radio_demo.dart';
import 'package:test_one/demo/switch_demo.dart';
import 'package:test_one/demo/slider_demo.dart';
import 'package:test_one/demo/datetime_demo.dart';
import 'package:test_one/demo/simple_dialog_demo.dart';
import 'package:test_one/demo/alert_dialog_demo.dart';
import 'package:test_one/demo/bottom_sheet_demo.dart';
import 'package:test_one/demo/snack_bar_demo.dart';
import 'package:test_one/demo/expansion_panel_demo.dart';
import 'package:test_one/demo/chip_demo.dart';
import 'package:test_one/demo/data_table_demo.dart';
import 'package:test_one/demo/paginated_data_table_demo.dart';
import 'package:test_one/demo/card_demo.dart';
import 'package:test_one/demo/stepper_demo.dart';

class MaterialComponent extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'StepperDemo',page: StepperDemo(),),
          ListItem(title: 'CardDemo',page: CardDemo(),),
          ListItem(title: 'PaginatedDataTableDemo',page: PaginatedDataTableDemo(),),
          ListItem(title: 'DataTableDemo',page: DataTableDemo(),),
          ListItem(title: 'ChipDemo',page: ChipDemo(),),
          ListItem(title: 'ExpansionPanelDemo',page: ExpansionPanelDemo(),),
          ListItem(title: 'SnackBarDemo',page: SnackBarDemo(),),
          ListItem(title: 'BottomSheetDemo',page: BottomSheetDemo(),),
          ListItem(title: 'AlertDialogDemo',page: AlertDialogDemo(),),
          ListItem(title: 'SimpleDialogDemo',page: SimpleDialogDemo(),),
          ListItem(title: 'DateTimeDemo',page: DateTimeDemo(),),
          ListItem(title: 'SliderDemo',page: SliderDemo(),),
          ListItem(title: 'SwitchDemo',page: SwitchDemo(),),
          ListItem(title: 'RadioDemo',page: RadioDemo(),),
          ListItem(title: 'CheckBox',page: CheckBoxDemo(),),
          ListItem(title: 'FormDemo',page: FormDemo(),),
          ListItem(title: 'PopupMenuButton',page: PopupMenuButtonDemo(),),
          ListItem(title: 'FloatingActionButton',page: FloatingActionButtonDemo(),),
          ListItem(title: 'ButtonDemo',page: ButtonDemo(),),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page)
        );
      },
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            )
          ],
        ),
      ),
    );
  }
}

