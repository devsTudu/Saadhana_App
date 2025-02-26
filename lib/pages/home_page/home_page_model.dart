import '/components/habit_card/habit_card_widget.dart';
import '/components/journal_card_special/journal_card_special_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for habit_card dynamic component.
  late FlutterFlowDynamicModels<HabitCardModel> habitCardModels;
  // Models for journal_Card_Special dynamic component.
  late FlutterFlowDynamicModels<JournalCardSpecialModel>
      journalCardSpecialModels;

  @override
  void initState(BuildContext context) {
    habitCardModels = FlutterFlowDynamicModels(() => HabitCardModel());
    journalCardSpecialModels =
        FlutterFlowDynamicModels(() => JournalCardSpecialModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    habitCardModels.dispose();
    journalCardSpecialModels.dispose();
  }
}
