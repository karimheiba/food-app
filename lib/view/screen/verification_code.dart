import 'package:chefio1/constans/colors.dart';
import 'package:chefio1/view/screen/password_recovery_screen.dart';
import 'package:chefio1/view/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widget/custom_pin_code.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "check your email",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "We.ve sent the code to your email",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                CustomPinCode(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "code expires in  ",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      '3:10',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Secondary),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PasswordRecoveryScreen(),
                          ));
                    },
                    text: "Verify"),
                CustomButton(
                  onTap: () {},
                  text: "Send again",
                  colorBorder: SecondaryText,
                  color: Colors.white24,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
