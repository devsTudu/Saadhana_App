import '/components/habit_card/habit_card_widget.dart';
import '/components/journal_card_general/journal_card_general_widget.dart';
import '/components/journal_card_special/journal_card_special_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for journal_typePage widget.
  PageController? journalTypePageController;

  int get journalTypePageCurrentIndex => journalTypePageController != null &&
          journalTypePageController!.hasClients &&
          journalTypePageController!.page != null
      ? journalTypePageController!.page!.round()
      : 0;
  // Models for journal_Card_Special dynamic component.
  late FlutterFlowDynamicModels<JournalCardSpecialModel>
      journalCardSpecialModels;
  // Models for journal_card_general dynamic component.
  late FlutterFlowDynamicModels<JournalCardGeneralModel>
      journalCardGeneralModels;

  @override
  void initState(BuildContext context) {
    habitCardModels = FlutterFlowDynamicModels(() => HabitCardModel());
    journalCardSpecialModels =
        FlutterFlowDynamicModels(() => JournalCardSpecialModel());
    journalCardGeneralModels =
        FlutterFlowDynamicModels(() => JournalCardGeneralModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    habitCardModels.dispose();
    journalCardSpecialModels.dispose();
    journalCardGeneralModels.dispose();
  }
}
