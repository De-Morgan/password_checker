import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordField extends HookWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final String labelText;
  final FocusNode focusNode;
  final VoidCallback onEditComplete;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final TextInputAction textInputAction;

  const PasswordField({
    Key key,
    this.onChanged,
    this.hintText = "Choose password",
    this.labelText = "Enter password",
    this.focusNode,
    this.onEditComplete,
    this.controller,
    this.textInputAction = TextInputAction.done,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(false);
    void _toggleShowPassword() => showPassword.value = !showPassword.value;
    return TextFormField(
      controller: controller,
      obscureText: !showPassword.value,
      onChanged: onChanged,
      focusNode: focusNode,
      validator: validator,
      onEditingComplete: onEditComplete,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEB))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEB))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFC7E15))),
          suffixIcon: IconButton(
            icon:
                Icon(showPassword.value ? Icons.lock_open : Icons.lock_outline),
            onPressed: _toggleShowPassword,
          )),
    );
  }
}
