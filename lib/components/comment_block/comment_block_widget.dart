import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'comment_block_model.dart';
export 'comment_block_model.dart';

class CommentBlockWidget extends StatefulWidget {
  const CommentBlockWidget({
    super.key,
    String? commenter,
    required this.time,
    required this.content,
    required this.idxJournal,
    required this.idxHabit,
  }) : this.commenter = commenter ?? 'user';

  final String commenter;

  /// When posted
  final DateTime? time;

  final String? content;
  final int? idxJournal;
  final int? idxHabit;

  @override
  State<CommentBlockWidget> createState() => _CommentBlockWidgetState();
}

class _CommentBlockWidgetState extends State<CommentBlockWidget> {
  late CommentBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentBlockModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.commenter,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        dateTimeFormat(
                          "relative",
                          widget.time,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'COMMENT_BLOCK_COMP_Icon_loiadut1_ON_TAP');
                      logFirebaseEvent('Icon_alert_dialog');
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Delete Confirm'),
                                content: Text('You really want to delete this'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('yes, Delete'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('Icon_update_app_state');
                        FFAppState().updateUserhabitAtIndex(
                          widget.idxHabit!,
                          (e) => e
                            ..updateJournal(
                              (e) => e.removeAt(widget.idxJournal!),
                            ),
                        );
                        FFAppState().update(() {});
                      }
                    },
                    child: Icon(
                      Icons.delete_forever,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 36.0,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    Icons.keyboard_control,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('COMMENT_BLOCK_COMP_Text_6xuiz8fs_ON_TAP');
                logFirebaseEvent('Text_navigate_to');

                context.pushNamed(
                  CommentReadWidget.routeName,
                  queryParameters: {
                    'indexHabit': serializeParam(
                      widget.idxHabit,
                      ParamType.int,
                    ),
                    'indexJournal': serializeParam(
                      widget.idxJournal,
                      ParamType.int,
                    ),
                  }.withoutNulls,
                );
              },
              child: Text(
                valueOrDefault<String>(
                  (FFAppState()
                          .userhabit
                          .elementAtOrNull(widget.idxHabit!)
                          ?.journal
                          .elementAtOrNull(widget.idxJournal!))
                      ?.contentJournal,
                  'Habit Details',
                ).maybeHandleOverflow(
                  maxChars: 80,
                  replacement: '…',
                ),
                textAlign: TextAlign.start,
                maxLines: 3,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
