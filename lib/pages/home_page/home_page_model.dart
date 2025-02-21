import '/components/habit_card/habit_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for habit_card dynamic component.
  late FlutterFlowDynamicModels<HabitCardModel> habitCardModels;

  @override
  void initState(BuildContext context) {
    habitCardModels = FlutterFlowDynamicModels(() => HabitCardModel());
  }

  @override
  void dispose() {
    habitCardModels.dispose();
  }
}
