import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_journals_widget.dart' show AddJournalsWidget;
import 'package:flutter/material.dart';

class AddJournalsModel extends FlutterFlowModel<AddJournalsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for journal_field widget.
  FocusNode? journalFieldFocusNode;
  TextEditingController? journalFieldTextController;
  String? Function(BuildContext, String?)? journalFieldTextControllerValidator;
  // State field(s) for title_field widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldTextController;
  String? Function(BuildContext, String?)? titleFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    journalFieldFocusNode?.dispose();
    journalFieldTextController?.dispose();

    titleFieldFocusNode?.dispose();
    titleFieldTextController?.dispose();
  }
}
