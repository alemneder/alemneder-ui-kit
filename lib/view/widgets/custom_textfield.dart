import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final String? description;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextStyle? style;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomTextField(
      {Key? key,
      this.title,
      this.hintText,
      this.description,
      this.controller,
      this.onChanged,
      this.obscureText,
      this.keyboardType,
      this.enabled,
      this.style,
      this.maxLength,
      this.maxLines,
      this.inputFormatters,
      this.textInputAction,
      this.textAlign,
      this.suffixIcon,
      this.prefixIcon})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.title != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  widget.title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              )
            : Container(),
        widget.description != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  widget.description!,
                  style: TextStyle(fontSize: 12),
                ),
              )
            : Container(),
        SizedBox(
          height: 2,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                obscureText: widget.obscureText ?? false,
                //cursorColor: Colors.orange,
                enabled: widget.enabled,
                maxLength: widget.maxLength,
                controller: widget.controller,
                textAlignVertical: TextAlignVertical.center,
                minLines: 1,
                textInputAction: widget.textInputAction,
                maxLines: widget.keyboardType == TextInputType.multiline ||
                        widget.keyboardType == TextInputType.streetAddress
                    ? widget.maxLines != null
                        ? widget.maxLines
                        : null
                    : 1,
                onChanged: widget.onChanged,
                textAlign: widget.textAlign ?? TextAlign.start,
                inputFormatters: widget.inputFormatters,
                style: widget.style,
                decoration: InputDecoration(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
                    hintText: widget.hintText,
                    suffixIcon: widget.suffixIcon,
                    hintStyle: widget.style,
                    contentPadding : const EdgeInsets.symmetric(horizontal:16.0,vertical:20),
                    prefixIcon: widget.prefixIcon,
                    border: InputBorder.none,
                    //fillColor: Color(0xfff3f3f4),
                    counterText: widget.maxLength != null &&
                            widget.controller != null
                        ? "${widget.controller!.text.length}/${widget.maxLength}"
                        : null,
                    filled: true),
                keyboardType: widget.keyboardType ?? TextInputType.text,
              ),
            ),
          ),
        )
      ],
    );
  }
}
