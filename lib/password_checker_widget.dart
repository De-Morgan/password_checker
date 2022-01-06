


import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'input_validation_mixin.dart';


class PasswordChecker extends HookWidget with InputValidatorMixin {
  final TextEditingController textEditingController;

  PasswordChecker({Key key, @required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasUpperCase = useState(false);
    final hasLowerCase = useState(false);
    final hasSymbol = useState(false);
    final has8cha = useState(false);
    final has1No = useState(false);

    void _textListener() {
      if (hasOneUppercase(textEditingController.text)) {
        hasUpperCase.value = true;
      } else {
        hasUpperCase.value = false;
      }
      if (hasOneLowercase(textEditingController.text)) {
        hasLowerCase.value = true;
      } else {
        hasLowerCase.value = false;
      }
      if (hasOneSymbol(textEditingController.text)) {
        hasSymbol.value = true;
      } else {
        hasSymbol.value = false;
      }
      if (hasAtLeast8cha(textEditingController.text)) {
        has8cha.value = true;
      } else {
        has8cha.value = false;
      }
      if (hasOneDigit(textEditingController.text)) {
        has1No.value = true;
      } else {
        has1No.value = false;
      }
    }

    useEffect(() {
      textEditingController.addListener(_textListener);
      return () => textEditingController.removeListener(_textListener);
    });

    return Column(
      children: [
        _CheckField(
          isChecked: hasUpperCase.value,
          title: 'Password must include uppercase',
        ),
        _CheckField(
          isChecked: hasLowerCase.value,
          title: 'Password must include lowercase',
        ),
        _CheckField(
          isChecked: hasSymbol.value,
          title: 'Password must include a special character',
        ),
        _CheckField(
          isChecked: has8cha.value,
          title: 'Password must be at least 8 characters',
        ),
        _CheckField(
          isChecked: has1No.value,
          title: 'Password must include a digit',
        ),
      ],
    );
  }
}

class _CheckField extends StatelessWidget {
  final String title;
  final bool isChecked;
  const _CheckField({Key key, this.title, this.isChecked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          if (isChecked)
            Icon(Icons.check_circle,color: Colors.green,)
          else
            Icon(Icons.cancel,color: Colors.red,),
          const SizedBox(width: 10),
          Text(
            "$title",
          )
        ],
      ),
    );
  }
}
