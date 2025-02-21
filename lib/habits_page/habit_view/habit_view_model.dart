import '/components/comment_block/comment_block_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'habit_view_widget.dart' show HabitViewWidget;
import 'package:flutter/material.dart';

class HabitViewModel extends FlutterFlowModel<HabitViewWidget> {
  ///  Local state fields for this page.
  /// Done Today
  int doneToday = 0;

  /// List of dates
  List<DateTime> dateLists = [];
  void addToDateLists(DateTime item) => dateLists.add(item);
  void removeFromDateLists(DateTime item) => dateLists.remove(item);
  void removeAtIndexFromDateLists(int index) => dateLists.removeAt(index);
  void insertAtIndexInDateLists(int index, DateTime item) =>
      dateLists.insert(index, item);
  void updateDateListsAtIndex(int index, Function(DateTime) updateFn) =>
      dateLists[index] = updateFn(dateLists[index]);

  /// Total Completed
  int totalDone = 0;

  /// Comments List for AI
  String allComments = 'Comments';

  ///  State fields for stateful widgets in this page.

  // Models for comment_block dynamic component.
  late FlutterFlowDynamicModels<CommentBlockModel> commentBlockModels;

  @override
  void initState(BuildContext context) {
    commentBlockModels = FlutterFlowDynamicModels(() => CommentBlockModel());
  }

  @override
  void dispose() {
    commentBlockModels.dispose();
  }
}
