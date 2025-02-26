import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'journal_card_model.dart';
export 'journal_card_model.dart';

class JournalCardWidget extends StatefulWidget {
  const JournalCardWidget({
    super.key,
    required this.dateJournal,
    String? content,
    String? writer,
  })  : this.content = content ?? 'That day I did this habit',
        this.writer = writer ?? 'User';

  /// Date when the journal was writen
  final DateTime? dateJournal;

  /// Content of the journal
  final String content;

  /// the one who wrote
  final String writer;

  @override
  State<JournalCardWidget> createState() => _JournalCardWidgetState();
}

class _JournalCardWidgetState extends State<JournalCardWidget> {
  late JournalCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 70.0,
              child: VerticalDivider(
                width: 24.0,
                thickness: 4.0,
                indent: 12.0,
                endIndent: 12.0,
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.writer,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          dateTimeFormat(
                            "relative",
                            widget.dateJournal,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.content,
                          'A very long statements to check if t this functions properly trims it or not nkub jkbserg',
                        ).maybeHandleOverflow(
                          maxChars: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 50;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 80;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 100;
                            } else {
                              return 50;
                            }
                          }(),
                          replacement: '…',
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
