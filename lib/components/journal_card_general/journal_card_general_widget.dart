import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'journal_card_general_model.dart';
export 'journal_card_general_model.dart';

class JournalCardGeneralWidget extends StatefulWidget {
  const JournalCardGeneralWidget({
    super.key,
    required this.dateJournal,
    String? content,
    String? writer,
    Color? color,
  })  : this.content = content ?? 'That day I did this habit',
        this.writer = writer ?? 'User',
        this.color = color ?? Colors.white;

  /// Date when the journal was writen
  final DateTime? dateJournal;

  /// Content of the journal
  final String content;

  /// the one who wrote
  final String writer;

  /// Color of Journal
  final Color color;

  @override
  State<JournalCardGeneralWidget> createState() =>
      _JournalCardGeneralWidgetState();
}

class _JournalCardGeneralWidgetState extends State<JournalCardGeneralWidget> {
  late JournalCardGeneralModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalCardGeneralModel());
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
      color: widget.color,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.writer,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          dateTimeFormat(
                            "relative",
                            widget.dateJournal,
                            locale:
                                FFLocalizations.of(context).languageShortCode ??
                                    FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                        style: FlutterFlowTheme.of(context).bodySmall.override(
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
