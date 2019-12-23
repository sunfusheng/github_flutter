import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditTextWidget extends StatefulWidget {
  int maxLines;
  int maxLength;
  TextInputType keyboardType;
  String hintText;
  TextStyle hintStyle;
  TextStyle textStyle;

  EditTextWidget(
      {this.maxLines,
      this.maxLength,
      this.keyboardType,
      this.hintText,
      this.hintStyle,
      this.textStyle});

  @override
  State<StatefulWidget> createState() {
    return _EditTextWidgetState();
  }
}

class _EditTextWidgetState extends State<EditTextWidget> {
  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      controller: null,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixText: '账号: ',
        prefixStyle: widget.textStyle,
        hasFloatingPlaceholder: false,
      ),
      style: widget.textStyle,
    );
    return textField;
  }
}
