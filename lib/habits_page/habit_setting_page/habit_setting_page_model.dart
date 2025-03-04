import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'habit_setting_page_widget.dart' show HabitSettingPageWidget;
import 'package:flutter/material.dart';

class HabitSettingPageModel extends FlutterFlowModel<HabitSettingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for goal_add widget.
  FocusNode? goalAddFocusNode;
  TextEditingController? goalAddTextController;
  String? Function(BuildContext, String?)? goalAddTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    goalAddFocusNode?.dispose();
    goalAddTextController?.dispose();
  }
}
