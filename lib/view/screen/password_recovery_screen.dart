import 'package:chefio1/view/screen/new_password_screen.dart';
import 'package:chefio1/view/widget/custom_Text_Form_fild.dart';
import 'package:chefio1/view/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Password recovery',
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Enter your email to recover your password",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            CostomTextFormFild(
              hint: "Email or phone number",
              prefixIcon: IconlyBroken.message,
            ),
            CustomButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPasswordScreen(),
                      ));
                },
                text: "Next"),
          ]),
        ),
      ),
    );
  }
}
