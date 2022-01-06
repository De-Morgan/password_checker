

import 'package:flutter/material.dart';
import 'input_validation_mixin.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'password_checker_widget.dart';
import 'password_field.dart';

class ChangePasswordPage extends HookWidget with InputValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final currentNode = useFocusNode();
    final newNode = useFocusNode();
    final retypeNode = useFocusNode();
    final currentPassword = useTextEditingController();
    final newPassword = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Change Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                PasswordField(
                  controller: currentPassword,
                  focusNode: currentNode,
                  labelText: "Current password",
                  hintText: "",
                  validator: (password) => isPasswordValidRelax(password)
                      ? null
                      : 'Enter a valid password',
                  textInputAction: TextInputAction.next,
                  onEditComplete: () {
                    newNode.requestFocus();
                  },
                ),
                const SizedBox(height: 30),
                PasswordField(
                  controller: newPassword,
                  focusNode: newNode,
                  labelText: "Choose new password",
                  hintText: "",
                  textInputAction: TextInputAction.next,
                  validator: (password) => isPasswordValid(password)
                      ? null
                      : 'Choose a strong password',
                  onEditComplete: () {
                    retypeNode.requestFocus();
                  },
                ),
                const SizedBox(height: 16),
                PasswordChecker(
                  textEditingController: newPassword,
                ),
                const SizedBox(height: 10),
                PasswordField(
                  focusNode: retypeNode,
                  hintText: "",
                  labelText: "Re-type new password",
                  validator: (password) {
                    if (password == newPassword.text) {
                      return null;
                    } else {
                      return 'Password does not match';
                    }
                  },
                  onEditComplete: () {
                    retypeNode.unfocus();
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.maxFinite, 40),
                      elevation: 0,
                      primary: Color(0xffFC7E15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        // Perform your logic
                      }
                    }, child: Text('Change Password'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
