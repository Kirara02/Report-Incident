import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/constant.dart';
import '../../config/theme/colors.dart';

class UXInputCustom extends StatefulWidget {
  const UXInputCustom(
      {this.labelText,
      required this.controller,
      this.value,
      this.errorText,
      Key? key,
      this.onChanged,
      this.keyboardType,
      this.obscureText = false,
      this.readOnly = false,
      this.decoration,
      this.textAlign = TextAlign.left,
      this.style,
      this.maxLength,
      this.autofocus = false,
      this.isDense = false,
      this.inputFormatters,
      this.prefixIcon,
      this.validator,
      this.hintText,
      this.contentPadding,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.onTap,
      this.textInputAction,
      this.prefixIconWidget,
      this.onEditingComplete,
      this.helperText,
      this.autoValidMode,
      this.textFieldBorder,
      this.enableBorder,
      this.floatingLabelBehavior})
      : super(key: key);

  final String? labelText;
  final TextEditingController controller;
  final String? value;
  final String? errorText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enableBorder;

  final ValueChanged<String>? onChanged;
  final InputDecoration? decoration;
  final int? maxLength;
  final bool autofocus;
  final IconData? prefixIcon;
  final Widget? prefixIconWidget;
  final Widget? suffixIcon;
  // style
  final TextAlign textAlign;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;

  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final String? helperText;
  final AutovalidateMode? autoValidMode;
  final TextInputAction? textInputAction;
  final InputBorder? textFieldBorder;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  State<UXInputCustom> createState() => _XInputCustomState();
}

class _XInputCustomState extends State<UXInputCustom> {
  String get value => widget.value ?? '';

  bool obscureText = false;
  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  void didUpdateWidget(UXInputCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Widget? _buildActions() {
      final List<Widget> actions = [];
      if (widget.obscureText) {
        actions.add(
          IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: AppConstants.kPaddingL,
              color: UIColors.grey_60,
            ),
          ),
        );
      }

      if (widget.suffixIcon != null) {
        actions.add(widget.suffixIcon!);
      }

      if (actions.isEmpty) {
        return null;
      }
      if (actions.length == 1) {
        return actions[0];
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      );
    }

    if (widget.helperText == null) {
      return _field(_buildActions);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _field(_buildActions),
          const SizedBox(height: AppConstants.kPaddingXS),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.kPaddingL,
            ),
            child: Text(
              widget.helperText!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      );
    }
  }

  TextFormField _field(Widget? Function() buildActions) {
    return TextFormField(
      autovalidateMode: widget.autoValidMode,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      style: widget.style,
      textAlign: widget.textAlign,
      obscureText: obscureText,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      decoration: (widget.decoration ?? const InputDecoration()).copyWith(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey_20, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelStyle:
              widget.readOnly ? const TextStyle(color: UIColors.grey_80) : null,
          focusedBorder: widget.textFieldBorder,
          contentPadding: widget.contentPadding ??
              EdgeInsets.only(
                left: AppConstants.kPaddingL,
                right: widget.suffixIcon == null ? AppConstants.kPaddingL : 0,
              ),
          isDense: widget.isDense,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  size: AppConstants.kPaddingL,
                )
              : widget.prefixIconWidget,
          hintText: widget.hintText,
          labelText: widget.labelText,
          errorText: widget.errorText,
          filled: false,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppColors.danger, width: 1),
          ),
          floatingLabelBehavior: widget.floatingLabelBehavior,
          suffixIcon: buildActions(),
          enabledBorder: widget.enableBorder),
    );
  }
}
