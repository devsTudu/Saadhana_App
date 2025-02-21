import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ask_a_i_page_widget.dart' show AskAIPageWidget;
import 'package:flutter/material.dart';

class AskAIPageModel extends FlutterFlowModel<AskAIPageWidget> {
  ///  Local state fields for this component.
  /// AI Response
  String response = 'response';

  /// Query to AI
  String query = 'How to improve in practicing habits, suggest in 50 words';

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for asking_text widget.
  FocusNode? askingTextFocusNode;
  TextEditingController? askingTextTextController;
  String? Function(BuildContext, String?)? askingTextTextControllerValidator;
  // State field(s) for read_comments widget.
  bool? readCommentsValue;
  // Stores action output result for [Backend Call - API (Gemini)] action in submit_btn widget.
  ApiCallResponse? commentByAi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    askingTextFocusNode?.dispose();
    askingTextTextController?.dispose();
  }
}
