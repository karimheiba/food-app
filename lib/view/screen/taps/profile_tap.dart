import 'package:chefio1/constans/colors.dart';
import 'package:chefio1/view/widget/Custom_product_Item_widget.dart';
import 'package:chefio1/view/widget/custom_binary_option.dart';
import 'package:chefio1/view/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ProfileTap extends StatelessWidget {
  ProfileTap({
    Key? key,
    this.showFollowBottomInProfile = false,
  }) : super(key: key);
  bool showFollowBottomInProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: mainText,
              ),
            ),
          ),
        ],
        leading: showFollowBottomInProfile == true
            ? Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: mainText,
                    )),
              )
            : const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              const AssetImage("assets/imges/Avatar3.png"),
                        ),
                        showFollowBottomInProfile == false
                            ? InkWell(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: primary,
                                  child: Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Choirul Syafril",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "32",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Recipes",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: SecondaryText),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "789",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Following",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: SecondaryText),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "1.200",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Followers",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: SecondaryText),
                            )
                          ],
                        ),
                      ],
                    ),
                    showFollowBottomInProfile == true
                        ? CustomButton(onTap: () {}, text: "Follow")
                        : const SizedBox(
                            height: 20,
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomBinaryOption(
                    textLeft: "Recipes",
                    textRight: "Liked",
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 1 / 1.3,
                    children: List.generate(
                        5,
                        (index) => CustomProductItemWidget(
                              showUser: false,
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
