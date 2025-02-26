import '/components/habit_suggestion_item/habit_suggestion_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'start_page_add_habits_widget.dart' show StartPageAddHabitsWidget;
import 'package:flutter/material.dart';

class StartPageAddHabitsModel
    extends FlutterFlowModel<StartPageAddHabitsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for habit_suggestion_item component.
  late HabitSuggestionItemModel habitSuggestionItemModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    habitSuggestionItemModel =
        createModel(context, () => HabitSuggestionItemModel());
  }

  @override
  void dispose() {
    habitSuggestionItemModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
