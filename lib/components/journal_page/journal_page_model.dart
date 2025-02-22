import '/flutter_flow/flutter_flow_util.dart';
import 'journal_page_widget.dart' show JournalPageWidget;
import 'package:flutter/material.dart';

class JournalPageModel extends FlutterFlowModel<JournalPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for shortInfo widget.
  FocusNode? shortInfoFocusNode;
  TextEditingController? shortInfoTextController;
  String? Function(BuildContext, String?)? shortInfoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    shortInfoFocusNode?.dispose();
    shortInfoTextController?.dispose();
  }
}
