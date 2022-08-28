import 'package:chefio1/constans/colors.dart';
import 'package:chefio1/view/screen/home_screen.dart';
import 'package:chefio1/view/screen/taps/home_tap.dart';
import 'package:chefio1/view/widget/CustomSlider.dart';
import 'package:chefio1/view/widget/custom_Text_Form_fild.dart';
import 'package:chefio1/view/widget/custom_button.dart';
import 'package:chefio1/view/widget/custom_categories_list.dart';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  static List previousSearchs = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Search Bar
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: mainText,
                        )),
                    Expanded(
                      child: CostomTextFormFild(
                        hint: "Serch",
                        prefixIcon: IconlyLight.search,
                        controller: searchController,
                        filled: true,
                        suffixIcon: searchController.text.isEmpty
                            ? null
                            : Icons.cancel_sharp,
                        onTapSuffixIcon: () {
                          searchController.clear();
                        },
                        onChanged: (pure) {
                          setState(() {});
                        },
                        onEditingComplete: () {
                          previousSearchs.add(searchController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                context: context,
                                builder: (context) =>
                                    _custombottomSheetFilter(context));
                          });
                        },
                        icon: const Icon(
                          IconlyBold.filter,
                          color: mainText,
                        )),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            // Previous Searches
            Container(
              color: Colors.white,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: previousSearchs.length,
                  itemBuilder: (context, index) => previousSearchsItem(index)),
            ),
            const SizedBox(
              height: 8,
            ),

            // Search Suggestions
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search Suggestions",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      searchSuggestionsTiem("suchi"),
                      searchSuggestionsTiem("sandwich"),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      searchSuggestionsTiem("seafood"),
                      searchSuggestionsTiem("fried rice"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  previousSearchsItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (DismissDirection dir) {
            setState(() {});
            previousSearchs.removeAt(index);
          },
          child: Row(
            children: [
              const Icon(
                IconlyLight.time_circle,
                color: SecondaryText,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                previousSearchs[index],
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: mainText),
              ),
              const Spacer(),
              const Icon(
                Icons.call_made_outlined,
                color: SecondaryText,
              )
            ],
          ),
        ),
      ),
    );
  }

  searchSuggestionsTiem(String text) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration:
          BoxDecoration(color: form, borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainText),
      ),
    );
  }

  _custombottomSheetFilter(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Add a Filter",
            style: Theme.of(context).textTheme.headline2,
          ),
          CustomCategoriesList(),
          CustomSlider(),
          Row(
            children: [
              Expanded(
                  child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: "Cancel",
                color: form,
                textColor: mainText,
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: CustomButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                text: "Done",
              ))
            ],
          )
        ],
      ),
    );
  }
}
