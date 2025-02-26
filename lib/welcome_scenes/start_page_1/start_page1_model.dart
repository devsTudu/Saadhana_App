import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'start_page1_widget.dart' show StartPage1Widget;
import 'package:flutter/material.dart';

class StartPage1Model extends FlutterFlowModel<StartPage1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
