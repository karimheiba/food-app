import 'package:chefio1/view/widget/custom_follow_notifcation.dart';
import 'package:chefio1/view/widget/custom_liked_notifcation.dart';
import 'package:flutter/material.dart';

class NotitcationTap extends StatelessWidget {
  NotitcationTap({Key? key}) : super(key: key);
  List newItem = ["liked", "follow"];
  List todayItem = ["follow", "liked", "liked"];

  List oldesItem = ["follow", "follow", "liked", "liked"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newItem.length,
                  itemBuilder: (context, index) {
                    return newItem[index] == "follow"
                        ? CustomFollowNotifcation()
                        : CustomLikedNotifcation();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Today",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todayItem.length,
                  itemBuilder: (context, index) {
                    return todayItem[index] == "follow"
                        ? CustomFollowNotifcation()
                        : CustomLikedNotifcation();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Oldest",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: oldesItem.length,
                  itemBuilder: (context, index) {
                    return oldesItem[index] == "follow"
                        ? CustomFollowNotifcation()
                        : CustomLikedNotifcation();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
