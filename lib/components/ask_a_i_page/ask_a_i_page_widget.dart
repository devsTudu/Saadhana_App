import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ask_a_i_page_model.dart';
export 'ask_a_i_page_model.dart';

class AskAIPageWidget extends StatefulWidget {
  const AskAIPageWidget({
    super.key,
    required this.index,
    required this.comments,
  });

  /// Index of the habit
  final int? index;

  /// All past comments
  final String? comments;

  @override
  State<AskAIPageWidget> createState() => _AskAIPageWidgetState();
}

class _AskAIPageWidgetState extends State<AskAIPageWidget> {
  late AskAIPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AskAIPageModel());

    _model.askingTextTextController ??= TextEditingController();
    _model.askingTextFocusNode ??= FocusNode();

    _model.readCommentsValue = false;
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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xB20B191E),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 16.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 44.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('ASK_A_I_close_rounded_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kg9ubkds' /* Ask AI 🤖 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Open Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??=
                                      FFLocalizations.of(context).getText(
                                    'v3ccgvjx' /* Motivation */,
                                  ),
                                ),
                                options: (getJsonField(
                                  FFAppState().AIData,
                                  r'''$["type_comments"]''',
                                  true,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.dropDownValue = val),
                                width: 120.0,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'i5f2jmpj' /* Type */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Color(0xFFE0E3E7),
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 4.0,
                        thickness: 1.0,
                        color: Color(0xFFE0E3E7),
                      ),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minWidth: 50.0,
                          minHeight: 50.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.askingTextTextController,
                            focusNode: _model.askingTextFocusNode,
                            autofocus: true,
                            textInputAction: TextInputAction.go,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'gzy6xavs' /* Question */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            maxLength: 60,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.askingTextTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Divider(
                        height: 4.0,
                        thickness: 1.0,
                        color: Color(0xFFE0E3E7),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8.0, 4.0, 16.0, 44.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.readCommentsValue!,
                                  onChanged: (newValue) async {
                                    safeSetState(() =>
                                        _model.readCommentsValue = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '9tco4r17' /* Use  Comments */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ASK_A_I_PAGE_COMP_submit_btn_ON_TAP');
                                if (_model.readCommentsValue!) {
                                  logFirebaseEvent(
                                      'submit_btn_update_component_state');
                                  _model.query =
                                      'These are my past notes, \" ${widget.comments}\"';
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent(
                                      'submit_btn_update_component_state');
                                  _model.query = 'Hi agent,';
                                  safeSetState(() {});
                                }

                                logFirebaseEvent(
                                    'submit_btn_update_component_state');
                                _model.query =
                                    '${_model.query} I am trying to adopt a habit title,\"${valueOrDefault<String>(
                                  FFAppState()
                                      .userhabit
                                      .elementAtOrNull(widget.index!)
                                      ?.title,
                                  'Good Habit',
                                )}\" and description as \"${valueOrDefault<String>(
                                  FFAppState()
                                      .userhabit
                                      .elementAtOrNull(widget.index!)
                                      ?.description,
                                  'I will do it daily',
                                )}\", now I want a reply for \"${_model.askingTextTextController.text}\", in the mood of \"${_model.dropDownValue}\".';
                                safeSetState(() {});
                                logFirebaseEvent('submit_btn_backend_call');
                                _model.commentByAi = await GeminiCall.call(
                                  query:
                                      '${_model.query}: respond it in around 150 words, with proper structure and like a mentor',
                                );

                                logFirebaseEvent('submit_btn_update_app_state');
                                FFAppState().updateUserhabitAtIndex(
                                  widget.index!,
                                  (e) => e
                                    ..updateJournal(
                                      (e) => e.add(JournalsStruct(
                                        date: getCurrentTimestamp,
                                        contentJournal: GeminiCall.response(
                                          (_model.commentByAi?.jsonBody ?? ''),
                                        ),
                                        writer: 'AI',
                                      )),
                                    ),
                                );
                                _model.updatePage(() {});
                                logFirebaseEvent(
                                    'submit_btn_reset_form_fields');
                                safeSetState(() {
                                  _model.askingTextTextController?.clear();
                                });
                                logFirebaseEvent(
                                    'submit_btn_reset_form_fields');
                                safeSetState(() {
                                  _model.dropDownValueController?.reset();
                                });
                                logFirebaseEvent(
                                    'submit_btn_reset_form_fields');
                                safeSetState(() {
                                  _model.readCommentsValue = false;
                                });
                                logFirebaseEvent('submit_btn_navigate_back');
                                context.safePop();

                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'bwly1i2m' /* Ask */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.send_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 28.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
