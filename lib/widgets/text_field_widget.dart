import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onSuffixIconPressed;
  final Widget? suffixButton;
  final String? Function(String?)? validator;
  final List<DropdownMenuItem<String>>? dropdownItems; // Added field for dropdown items
  final ValueChanged<String?>? onDropdownChanged; // Added callback for dropdown changes
  final String? dropdownValue; // Added initial value for dropdown
  final TextInputType? keyboardType;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.isPassword,
    required this.prefixIcon,
    required this.validator,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.suffixButton,
    this.dropdownItems, // Optional dropdown items
    this.onDropdownChanged, // Optional callback for dropdown changes
    this.dropdownValue,
    this.keyboardType, // Optional initial value for dropdown
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: isDropdownField() ? buildDropdownField() : buildTextField(),
    );
  }

  bool isDropdownField() {
    return widget.dropdownItems != null;
  }

  Widget buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: widget.dropdownValue,
      onChanged: widget.onDropdownChanged,
      items: widget.dropdownItems!
          .map((value) => DropdownMenuItem<String>(
                value: value.value,
                child: Text(value.value!),
              ))
          .toList(),
      selectedItemBuilder: (context) => widget.dropdownItems!
          .map((value) => Text(
                value.value!,
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
              ))
          .toList(),
      isExpanded: true,
      dropdownColor: const Color(0xff152739), //<-- SEE HERE
      style: const TextStyle(
        color: Colors.white70, // Change this to your desired text color
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
        filled: true, // Set to true to enable background color
        fillColor: const Color(0xff152739),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          size: 24,
          color: const Color(0xFFFEB139),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFEB139), // Color of the underline when focused
          ),
        ),
      ),
      validator: widget.validator,
      isDense: true,
    );
  }

  Widget buildTextField() {
    bool isObscureText = widget.isPassword;

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword,
      style: const TextStyle(
        color: Colors.white70, // Change this to your desired text color
      ),
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white70, fontSize: 12),
        filled: true, // Set to true to enable background color
        fillColor: const Color(0xff152739),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          size: 24,
          color: const Color(0xFFFEB139),
        ),
        suffixIcon: widget.suffixIcon != null
            ? (GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                  if (widget.onSuffixIconPressed != null) {
                    widget.onSuffixIconPressed!();
                  }
                },
                child: Icon(
                  isObscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFFFEB139),
                ),
              ))
            : (widget.suffixButton), // Optional suffix button widget
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFEB139), // Color of the underline when focused
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
