import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'add_journals_model.dart';
export 'add_journals_model.dart';

class AddJournalsWidget extends StatefulWidget {
  const AddJournalsWidget({
    super.key,
    this.indexJournal,
  });

  /// Journal Index if Updating
  final int? indexJournal;

  static String routeName = 'add_journals';
  static String routePath = '/addJournals';

  @override
  State<AddJournalsWidget> createState() => _AddJournalsWidgetState();
}

class _AddJournalsWidgetState extends State<AddJournalsWidget> {
  late AddJournalsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddJournalsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'add_journals'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_JOURNALS_add_journals_ON_INIT_STATE');
      if (widget.indexJournal != null) {
        logFirebaseEvent('add_journals_set_form_field');
        safeSetState(() {
          _model.journalFieldTextController?.text = FFAppState()
              .journalswritten
              .elementAtOrNull(widget.indexJournal!)!
              .contentJournal;
        });
        logFirebaseEvent('add_journals_set_form_field');
        safeSetState(() {
          _model.titleFieldTextController?.text = FFAppState()
              .journalswritten
              .elementAtOrNull(widget.indexJournal!)!
              .title;
        });
      } else {
        logFirebaseEvent('add_journals_set_form_field');
        safeSetState(() {
          _model.journalFieldTextController?.text = 'Today I';
          _model.journalFieldFocusNode?.requestFocus();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _model.journalFieldTextController?.selection =
                TextSelection.collapsed(
              offset: _model.journalFieldTextController!.text.length,
            );
          });
        });
      }
    });

    _model.journalFieldTextController ??= TextEditingController();
    _model.journalFieldFocusNode ??= FocusNode();

    _model.titleFieldTextController ??= TextEditingController(
        text: FFAppState()
            .journalswritten
            .elementAtOrNull(widget.indexJournal!)
            ?.title);
    _model.titleFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ADD_JOURNALS_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'r94ytzcj' /* Write Journal */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.journalFieldTextController,
                    focusNode: _model.journalFieldFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.none,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'sphlwen8' /* Journal here */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                    maxLines: null,
                    minLines: 1,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model.journalFieldTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.titleFieldTextController,
                        focusNode: _model.titleFieldFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '4qznep1w' /* Title */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
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
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.titleFieldTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ADD_JOURNALS_PAGE_SAVE_BTN_ON_TAP');
                      if (widget.indexJournal != null) {
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().updateJournalswrittenAtIndex(
                          widget.indexJournal!,
                          (e) => e
                            ..contentJournal =
                                _model.journalFieldTextController.text
                            ..title = _model.titleFieldTextController.text
                            ..lastUpdated = getCurrentTimestamp,
                        );
                        FFAppState().update(() {});
                      } else {
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().addToJournalswritten(JournalsStruct(
                          date: getCurrentTimestamp,
                          contentJournal:
                              _model.journalFieldTextController.text,
                          writer: 'user',
                          secret: false,
                          title: _model.titleFieldTextController.text,
                          lastUpdated: getCurrentTimestamp,
                        ));
                        FFAppState().update(() {});
                      }

                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        HomePageWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.topToBottom,
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'fqbnzjj3' /* Save */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
