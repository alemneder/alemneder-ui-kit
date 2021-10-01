import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final bool? isProcess;
  final Function()? onTap;

  const CustomButton({Key? key, this.onTap, this.isProcess, required this.text})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: widget.onTap != null && widget.isProcess == null
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Theme.of(context).primaryColor)),
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.isProcess != null && widget.isProcess!
                ? PlatformCircularProgressIndicator()
                : Text(
                    widget.text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: widget.onTap != null
                            ? Colors.white
                            : Theme.of(context).primaryColor),
                  ),
          ),
        ),
      ),
    );
  }
}
