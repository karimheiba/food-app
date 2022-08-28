import 'package:chefio1/view/widget/custom_Text_Form_fild.dart';
import 'package:chefio1/view/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';

import '../../constans/colors.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool obscure = true;

  //The validator key related to the text field
  bool _contansANumber = false;
  bool _numberofDigits = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reset Your paddword",
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Please enter your new password",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              CostomTextFormFild(
                onChanged: (value) {
                  setState(() {
                    _contansANumber = value.length < 6 ? false : true;
                  });
                },
                obscureText: obscure,
                hint: "Password",
                prefixIcon: IconlyBroken.lock,
                suffixIcon:
                    obscure == true ? IconlyBroken.show : IconlyBroken.hide,
                onTapSuffixIcon: () {
                  setState(() {});
                  obscure = !obscure;
                },
              ),
              passwordTerms(
                  ateast6: _contansANumber, contains: _contansANumber),
              CustomButton(onTap: () {}, text: "Done"),
            ],
          ),
        ),
      ),
    );
  }

  // Part about password terms
  passwordTerms({
    required bool contains,
    required bool ateast6,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Your password must cotain :",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: mainText),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: ateast6 == false ? outline : Color(0xFFE3FFF1),
              child: Icon(
                Icons.done,
                size: 12,
                color: ateast6 == false ? SecondaryText : primary,
              ),
            ),
            Text(
              "  Atleast 6 characters",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: ateast6 == false ? SecondaryText : mainText),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: contains == false ? outline : Color(0xFFE3FFF1),
              child: Icon(
                Icons.done,
                size: 12,
                color: contains == false ? SecondaryText : primary,
              ),
            ),
            Text(
              "  Contains a number",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: contains == false ? SecondaryText : mainText),
            )
          ],
        ),
      ],
    );
  }
}
