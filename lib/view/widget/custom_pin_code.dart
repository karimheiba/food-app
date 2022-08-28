import 'package:chefio1/constans/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        appContext: context,
        length: 4,
        onChanged: (value) {},
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(15),
          borderWidth: 2,
          fieldHeight: 70,
          fieldWidth: 70,
          selectedColor: primary,
          activeColor: outline,
          inactiveColor: outline,
        ),
      ),
    );
  }
}
