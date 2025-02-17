import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'search_bar_model.dart';
export 'search_bar_model.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.searchLabel,
  });

  final String? searchLabel;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late SearchBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBarModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: Stack(
        children: [
          TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              const Duration(milliseconds: 2000),
              () => safeSetState(() {}),
            ),
            autofocus: false,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.search,
            obscureText: false,
            decoration: InputDecoration(
              labelText: valueOrDefault<String>(
                widget.searchLabel,
                'Search Watch',
              ),
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'DM Sans',
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.08,
                    lineHeight: 20.0,
                  ),
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'DM Sans',
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).appBar,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).appBar,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).appBar,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
              suffixIcon: _model.textController!.text.isNotEmpty
                  ? InkWell(
                      onTap: () async {
                        _model.textController?.clear();
                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.clear,
                        color: FlutterFlowTheme.of(context).alternate,
                        size: 24.0,
                      ),
                    )
                  : null,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.08,
                  lineHeight: 1.43,
                ),
            validator: _model.textControllerValidator.asValidator(context),
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Box.png',
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
