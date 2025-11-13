import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/common/widgets/card_design/item_card.dart';
import 'package:sixam_mart/common/widgets/item_shimmer.dart';
import 'package:sixam_mart/common/widgets/item_widget.dart';
import 'package:sixam_mart/features/store/controllers/store_controller.dart';
import 'package:sixam_mart/helper/date_converter.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreItemsView extends StatelessWidget {
  final int storeId;
  final String type;
  final bool isScrollable;

  const StoreItemsView({
    super.key,
    required this.storeId,
    required this.type,
    this.isScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
      builder: (storeController) {
        final model = storeController.storeItemModel;
        final items = model?.items ?? [];

        // Show loader if no items
        if (items.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ItemShimmer(
                isEnabled: true,
                hasDivider: false,
                isStore: true,
              ),
            ),
          );
        }

        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFECF3F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  storeController.recommendedItemModel!.items!.isEmpty
                      ? SizedBox()
                      : InkWell(
                          onTap: storeController.togglerecommendedContainer,
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Recommended",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Icon(
                                  storeController.isopen
                                      ? Icons.keyboard_arrow_right
                                      : Icons.keyboard_arrow_down,
                                  color: Theme.of(context).primaryColor,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                  if (!storeController.isopen)
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          storeController.recommendedItemModel!.items!.length,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ItemWidget(
                          item: storeController.recommendedItemModel!.items![i],
                          isStore: false,
                          store: null,
                          index: i,
                          length: storeController
                              .recommendedItemModel!.items!.length,
                          // Recomended: true,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: !isScrollable,
              physics: isScrollable
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ItemWidget(
                    item: item,
                    isStore: false,
                    store: null,
                    index: index,
                    length: items.length,
                    // Recomended: false, //
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
