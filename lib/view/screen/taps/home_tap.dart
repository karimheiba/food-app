import 'package:chefio1/view/screen/search_Screen.dart';
import 'package:chefio1/view/widget/custom_Text_Form_fild.dart';
import 'package:chefio1/view/widget/custom_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../widget/Custom_product_Item_widget.dart';
import '../../widget/custom_binary_option.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // the top of screen
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()),
                          );
                        },
                        child: CostomTextFormFild(
                          hint: "Search",
                          prefixIcon: IconlyLight.search,
                          filled: true,
                          enabled: false,
                        ),
                      ),
                    ),
                    // Categories List
                    const CustomCategoriesList(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          // the bottom of the screen
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomBinaryOption(),
                    // Product List Part
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 1,
                        childAspectRatio: 1 / 1.5,
                        children: List.generate(
                          5,
                          (index) => CustomProductItemWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
