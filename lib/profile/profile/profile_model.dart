import '/components/dark_light_switch_large/dark_light_switch_large_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DarkLightSwitchLarge component.
  late DarkLightSwitchLargeModel darkLightSwitchLargeModel;

  @override
  void initState(BuildContext context) {
    darkLightSwitchLargeModel =
        createModel(context, () => DarkLightSwitchLargeModel());
  }

  @override
  void dispose() {
    darkLightSwitchLargeModel.dispose();
  }
}
