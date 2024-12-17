import '/flutter_flow/flutter_flow_util.dart';
import 'otplogin_widget.dart' show OtploginWidget;
import 'package:flutter/material.dart';

class OtploginModel extends FlutterFlowModel<OtploginWidget> {
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
