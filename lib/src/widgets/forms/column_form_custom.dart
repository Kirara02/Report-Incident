// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:report_incident/src/widgets/forms/ux_input_custom.dart';

class ColumnFormCustom extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final InputDecoration? decoration;
  const ColumnFormCustom(
      {Key? key,
      required this.title,
      required this.controller,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 3.0,
        ),
        UXInputCustom(
          controller: controller,
          decoration: decoration ?? const InputDecoration(),
        ),
      ],
    );
  }
}
