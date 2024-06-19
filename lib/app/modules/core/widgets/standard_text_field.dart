import 'package:flutter/material.dart';
import 'package:stefanini_flutter_test/app/modules/core/extensions/app_theme.dart';
import 'package:stefanini_flutter_test/app/modules/core/extensions/context_extension.dart';
import 'package:stefanini_flutter_test/app/modules/core/validator/compoundable_formatter.dart';

class StandardTextField extends StatefulWidget {
  final CompoundableFormatter compoundableFormatter;
  final String? errorText;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final bool showSuffixIcon;
  final String? suffixIconPath;
  final bool editable;
  final int? maxLines;

  const StandardTextField({
    super.key,
    required this.compoundableFormatter,
    this.onChanged,
    required this.controller,
    this.errorText,
    this.enabled = true,
    this.padding,
    this.suffixIconPath,
    this.editable = true,
    this.maxLines = 1,
    this.showSuffixIcon = false,
  });

  @override
  State<StandardTextField> createState() => _StandardTextFieldState();
}

class _StandardTextFieldState extends State<StandardTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.compoundableFormatter.label,
            style: context.theme.textTheme.mediumBlackTextStyle,
          ),
          TextFormField(
            maxLines: widget.maxLines,
            maxLength: widget.compoundableFormatter.maxLength,
            style: context.theme.textTheme.smallBlackRegularTextStyle,
            autofillHints: widget.compoundableFormatter.autofillHints,
            onChanged: widget.onChanged,
            controller: widget.controller,
            keyboardType: widget.compoundableFormatter.textInputType,
            textAlign: TextAlign.left,
            inputFormatters: [
              widget.compoundableFormatter.inputFormatter,
            ],
            obscureText: !_showPassword && widget.compoundableFormatter.obscure,
            decoration:
                _buildInputDecoration(theme, widget.errorText, widget.enabled),
            enabled: widget.enabled && widget.editable,
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      ThemeData theme, String? errorText, bool enabled) {
    return InputDecoration(
      suffixIcon: _buildSuffixIcon(),
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 20,
      ),
      errorBorder: _buildOutlineErrorInputBorder(),
      hintText: widget.compoundableFormatter.hint,
      hintStyle: context.theme.textTheme.smallGreyRegularTextStyle,
      enabledBorder: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputFocusedBorder(),
      focusedErrorBorder: _buildOutlineErrorInputBorder(),
      disabledBorder: _buildOutlineInputBorder(),
      errorText: errorText,
      fillColor: context.theme.colorScheme.primaryWhite,
    );
  }

  Widget? _buildSuffixIcon() {
    return widget.compoundableFormatter.obscure
        ? Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromARGB(255, 197, 197, 197),
              ),
              onPressed: () => widget.suffixIconPath != null
                  ? null
                  : setState(() {
                      _showPassword = !_showPassword;
                    }),
            ),
          )
        : widget.compoundableFormatter.suffixIcon;
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      gapPadding: 1,
      borderSide: widget.enabled
          ? const BorderSide(color: AppColors.greyFFD2D8D7, width: 1.5)
          : const BorderSide(color: AppColors.greyFFE4E4E4, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(14)),
    );
  }

  OutlineInputBorder _buildOutlineErrorInputBorder() {
    return OutlineInputBorder(
      gapPadding: 2,
      borderSide:
          BorderSide(color: context.theme.colorScheme.greyFFD2D8D7, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(14)),
    );
  }

  OutlineInputBorder _buildOutlineInputFocusedBorder() {
    return OutlineInputBorder(
      gapPadding: 1,
      borderSide: BorderSide(
        color: context.theme.colorScheme.primaryBlack,
        width: 1.5,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(14),
      ),
    );
  }
}
