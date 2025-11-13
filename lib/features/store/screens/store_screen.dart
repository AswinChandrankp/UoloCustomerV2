import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:sixam_mart/common/widgets/endscreendialog_widget.dart';
import 'package:sixam_mart/features/cart/controllers/cart_controller.dart';
import 'package:sixam_mart/features/category/controllers/category_controller.dart';
import 'package:sixam_mart/features/item/controllers/item_controller.dart';
import 'package:sixam_mart/features/language/controllers/language_controller.dart';
import 'package:sixam_mart/features/store/controllers/store_controller.dart';
import 'package:sixam_mart/features/splash/controllers/splash_controller.dart';
import 'package:sixam_mart/features/favourite/controllers/favourite_controller.dart';
import 'package:sixam_mart/features/category/domain/models/category_model.dart';
import 'package:sixam_mart/features/item/domain/models/item_model.dart';
import 'package:sixam_mart/features/store/domain/models/store_model.dart';
import 'package:sixam_mart/features/store/screens/storeitemview.dart';
import 'package:sixam_mart/features/store/widgets/CoupenCarousal.dart';
import 'package:sixam_mart/helper/auth_helper.dart';
import 'package:sixam_mart/helper/date_converter.dart';
import 'package:sixam_mart/helper/price_converter.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/app_constants.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/common/widgets/custom_button.dart';
import 'package:sixam_mart/common/widgets/custom_image.dart';
import 'package:sixam_mart/common/widgets/custom_snackbar.dart';
import 'package:sixam_mart/common/widgets/footer_view.dart';
import 'package:sixam_mart/common/widgets/item_view.dart';
import 'package:sixam_mart/common/widgets/item_widget.dart';
import 'package:sixam_mart/common/widgets/menu_drawer.dart';
import 'package:sixam_mart/common/widgets/paginated_list_view.dart';
import 'package:sixam_mart/common/widgets/veg_filter_widget.dart';
import 'package:sixam_mart/common/widgets/web_item_view.dart';
import 'package:sixam_mart/common/widgets/web_item_widget.dart';
import 'package:sixam_mart/common/widgets/web_menu_bar.dart';
import 'package:sixam_mart/features/checkout/screens/checkout_screen.dart';
import 'package:sixam_mart/features/search/widgets/custom_check_box_widget.dart';
import 'package:sixam_mart/features/store/widgets/customizable_space_bar_widget.dart';
import 'package:sixam_mart/features/store/widgets/store_banner_widget.dart';
import 'package:sixam_mart/features/store/widgets/store_description_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/features/store/widgets/store_details_screen_shimmer_widget.dart';

import '../widgets/bottom_cart_widget.dart';
import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sixam_mart/common/widgets/ecommerse_card.dart';
import 'package:sixam_mart/common/widgets/item_shimmer.dart';
import 'package:sixam_mart/common/widgets/item_view%20copy.dart';
import 'package:sixam_mart/features/address/controllers/address_controller.dart';
import 'package:sixam_mart/features/cart/controllers/cart_controller.dart';
import 'package:sixam_mart/features/category/controllers/category_controller.dart';
import 'package:sixam_mart/features/checkout/controllers/checkout_controller.dart';
import 'package:sixam_mart/features/coupon/controllers/coupon_controller.dart';
import 'package:sixam_mart/features/home/widgets/banner_view.dart';
import 'package:sixam_mart/features/item/controllers/item_controller.dart';
import 'package:sixam_mart/features/language/controllers/language_controller.dart';
import 'package:sixam_mart/features/profile/controllers/profile_controller.dart';
import 'package:sixam_mart/features/store/controllers/store_controller.dart';
import 'package:sixam_mart/features/splash/controllers/splash_controller.dart';
import 'package:sixam_mart/features/favourite/controllers/favourite_controller.dart';
import 'package:sixam_mart/features/category/domain/models/category_model.dart';
import 'package:sixam_mart/features/item/domain/models/item_model.dart';
import 'package:sixam_mart/features/store/domain/models/store_model.dart';
import 'package:sixam_mart/helper/address_helper.dart';
import 'package:sixam_mart/helper/auth_helper.dart';
import 'package:sixam_mart/helper/date_converter.dart';
import 'package:sixam_mart/helper/price_converter.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/app_constants.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/common/widgets/custom_button.dart';
import 'package:sixam_mart/common/widgets/custom_image.dart';
import 'package:sixam_mart/common/widgets/custom_snackbar.dart';
import 'package:sixam_mart/common/widgets/footer_view.dart';
import 'package:sixam_mart/common/widgets/item_view.dart';
import 'package:sixam_mart/common/widgets/item_widget.dart';
import 'package:sixam_mart/common/widgets/menu_drawer.dart';
import 'package:sixam_mart/common/widgets/paginated_list_view.dart';
import 'package:sixam_mart/common/widgets/veg_filter_widget.dart';
import 'package:sixam_mart/common/widgets/web_item_view.dart';
import 'package:sixam_mart/common/widgets/web_item_widget.dart';
import 'package:sixam_mart/common/widgets/web_menu_bar.dart';
import 'package:sixam_mart/features/checkout/screens/checkout_screen.dart';
import 'package:sixam_mart/features/search/widgets/custom_check_box_widget.dart';
import 'package:sixam_mart/features/store/widgets/customizable_space_bar_widget.dart';
import 'package:sixam_mart/features/store/widgets/store_banner_widget.dart';
import 'package:sixam_mart/features/store/widgets/store_description_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/features/store/widgets/store_details_screen_shimmer_widget.dart';

import '../widgets/bottom_cart_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

// === MAIN STORE SCREEN ===
// class StoreScreen extends StatefulWidget {
//   final Store? store;
//   final bool fromModule;
//   final String slug;

//   const StoreScreen({
//     super.key,
//     required this.store,
//     required this.fromModule,
//     this.slug = '',
//   });

//   @override
//   State<StoreScreen> createState() => _StoreScreenState();
// }

// class _StoreScreenState extends State<StoreScreen> {
//   final ScrollController scrollController = ScrollController();
//   final TextEditingController _searchController = TextEditingController();
//   bool _showTitle = false;

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       final storeController = Get.find<StoreController>();
//       storeController.getStoreItemList(
//         widget.store!.id,
//         1,
//         'all',
//         true,
//       );
//     });
//     _initData();
//     WidgetsBinding.instance.addPostFrameCallback((_) => _initSecondaryData());
//     scrollController.addListener(_onScroll);
//   }

//   void _initData() async {
//     final storeController = Get.find<StoreController>();
//     final splashController = Get.find<SplashController>();

//     storeController.hideAnimation();
//     await storeController
//         .getStoreDetails(Store(id: widget.store!.id), widget.fromModule,
//             slug: widget.slug)
//         .then((_) => storeController.showButtonAnimation());

//     if (Get.find<CategoryController>().categoryList == null) {
//       Get.find<CategoryController>().getCategoryList(true);
//     }
//   }

//   void _initSecondaryData() async {
//     final isLoggedIn = AuthHelper.isLoggedIn();
//     final checkoutController = Get.find<CheckoutController>();
//     final profileController = Get.find<ProfileController>();
//     final addressController = Get.find<AddressController>();
//     final couponController = Get.find<CouponController>();
//     final cartController = Get.find<CartController>();

//     checkoutController.initCheckoutData(widget.store!.id);
//     checkoutController.setPaymentMethod(0, isUpdate: false);

//     final userAddress = AddressHelper.getUserAddressFromSharedPref();
//     checkoutController.streetNumberController.text =
//         userAddress?.streetNumber ?? '';
//     checkoutController.houseController.text = userAddress?.house ?? '';
//     checkoutController.floorController.text = userAddress?.floor ?? '';
//     checkoutController.couponController.clear();

//     checkoutController.getDmTipMostTapped();
//     checkoutController.setPreferenceTimeForView('', isUpdate: false);
//     checkoutController.getOfflineMethodList();
//     checkoutController.toggleCreateAccount(willUpdate: false);
//     checkoutController.changePartialPayment(isUpdate: false);

//     if (isLoggedIn) {
//       if (profileController.userInfoModel == null)
//         profileController.getUserInfo();
//       couponController.getCouponList();
//       if (addressController.addressList == null)
//         addressController.getAddressList();
//     }

//     if (widget.store!.id == null && GetPlatform.isWeb) {
//       await cartController.getCartDataOnline();
//     }

//     checkoutController.pickPrescriptionImage(isRemove: true, isCamera: false);
//     final tipIndex = checkoutController.getSharedPrefDmTipIndex();
//     final index = tipIndex.isNotEmpty ? int.parse(tipIndex) : 0;
//     checkoutController.updateTips(index, notify: false);
//     checkoutController.tipController.text =
//         index < AppConstants.tips.length ? AppConstants.tips[index] : '';
//   }

//   void _onScroll() {
//     final storeController = Get.find<StoreController>();
//     final model = storeController.storeItemModel;

//     if (scrollController.offset > 50 && !_showTitle) {
//       setState(() => _showTitle = true);
//     } else if (scrollController.offset <= 50 && _showTitle) {
//       setState(() => _showTitle = false);
//     }

//     if (scrollController.position.userScrollDirection ==
//         ScrollDirection.reverse) {
//       if (storeController.showFavButton) {
//         storeController.changeFavVisibility();
//         storeController.hideAnimation();
//       }
//     } else {
//       if (!storeController.showFavButton) {
//         storeController.changeFavVisibility();
//         storeController.showButtonAnimation();
//       }
//     }

//     // === PAGINATION TRIGGER ===
//     if (model == null || model.items == null) return;

//     final currentItems = model.items!.length;
//     final totalSize = model.totalSize ?? 0;

//     if (currentItems >= totalSize) return; // No more items

//     if (scrollController.position.pixels >=
//             scrollController.position.maxScrollExtent - 500 &&
//         !storeController.isLoadingMore &&
//         storeController.hasMoreItems) {
//       print("Loading more items... Page: ${storeController.itemOffset}");

//       storeController.getStoreItemList(
//         widget.store!.id,
//         storeController.itemOffset,
//         storeController.type,
//         true,
//       );
//     }
//   }

//   @override
//   void dispose() {
//     Get.find<StoreController>().clearstoreitems();
//     scrollController.dispose();
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//     ));

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         endDrawer: const MenuDrawer(),
//         endDrawerEnableOpenDragGesture: false,
//         body: GetBuilder<StoreController>(builder: (storeController) {
//           final store = storeController.store;
//           final hasData = store != null && store.name != null;

//           if (!hasData) {
//             return const MyStoreShimmer(isloader: false);
//           }

//           storeController.setCategoryList();

//           return CustomScrollView(
//             controller: scrollController,
//             physics: const AlwaysScrollableScrollPhysics(),
//             slivers: [
//               SliverAppBar(
//                 backgroundColor: Theme.of(context).cardColor,
//                 elevation: 0,
//                 pinned: true,
//                 leading: IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: Icon(Icons.arrow_back_ios,
//                       color: Theme.of(context).primaryColor),
//                 ),
//                 title: Text(
//                   _showTitle ? store.name ?? '' : '',
//                   style: robotoMedium.copyWith(
//                       fontSize: 16,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 actions: [
//                   GetBuilder<FavouriteController>(
//                       builder: (favouriteController) {
//                     final isWished =
//                         favouriteController.wishStoreIdList.contains(store.id);
//                     return InkWell(
//                       onTap: () {
//                         if (AuthHelper.isLoggedIn()) {
//                           isWished
//                               ? favouriteController.removeFromFavouriteList(
//                                   store.id, true)
//                               : favouriteController.addToFavouriteList(
//                                   null, store.id, true);
//                         } else {
//                           showCustomSnackBar('you_are_not_logged_in'.tr);
//                         }
//                       },
//                       child: Icon(
//                         isWished ? Icons.favorite : Icons.favorite_border,
//                         color: isWished
//                             ? Colors.redAccent
//                             : Theme.of(context).primaryColor,
//                         size: 25,
//                       ),
//                     );
//                   }),
//                   if (AppConstants.webHostedUrl.isNotEmpty)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(
//                         onTap: storeController.shareStore,
//                         child: SvgPicture.asset('assets/image/icons/Vector.svg',
//                             height: 20),
//                       ),
//                     ),
//                 ],
//               ),

//               // === Store Header ===
//               SliverToBoxAdapter(
//                 child: Center(
//                   child: Container(
//                     width: Dimensions.webMaxWidth,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(20),
//                         bottomRight: Radius.circular(20),
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         StoreDescriptionViewWidget(store: store),
//                         if (store.open != 1 || !store.active!)
//                           _buildClosedBanner(context),
//                         StoreBannerWidget(storeController: storeController),
//                         CouponCarousel(storeid: store.id),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // === Search + Filter Bar ===
//               if (storeController.categoryList!.isNotEmpty)
//                 SliverPersistentHeader(
//                   pinned: true,
//                   delegate: _SearchFilterDelegate(
//                     child: Center(
//                       child: Container(
//                         width: Dimensions.webMaxWidth,
//                         color: Theme.of(context).cardColor,
//                         padding: const EdgeInsets.symmetric(
//                             vertical: Dimensions.paddingSizeExtraSmall),
//                         child: Row(
//                           children: [
//                             if (storeController.type.isNotEmpty)
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 15),
//                                   child: InkWell(
//                                     onTap: () => Get.toNamed(
//                                         RouteHelper.getSearchStoreItemRoute(
//                                             store.id)),
//                                     child: _buildSearchBar(store.name),
//                                   ),
//                                 ),
//                               ),
//                             if (storeController.type.isNotEmpty)
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 5),
//                                 child: VegFilterWidget(
//                                   type: storeController.type,
//                                   onSelected: (type) {
//                                     storeController.getStoreItemList(
//                                         store.id, 1, type, true);
//                                   },
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//               // === Category Tabs ===
//               if (storeController.categoryList!.isNotEmpty)
//                 SliverPersistentHeader(
//                   pinned: true,
//                   delegate: _CategoryTabDelegate(
//                     child: Center(
//                       child: Container(
//                         width: Dimensions.webMaxWidth,
//                         color: Theme.of(context).cardColor,
//                         padding: const EdgeInsets.symmetric(
//                             vertical: Dimensions.paddingSizeExtraSmall),
//                         child: SizedBox(
//                           height: 30,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             padding: const EdgeInsets.only(
//                                 left: Dimensions.paddingSizeSmall),
//                             physics: const BouncingScrollPhysics(),
//                             itemCount: storeController.categoryList!.length,
//                             itemBuilder: (context, index) {
//                               final category =
//                                   storeController.categoryList![index];
//                               final isSelected =
//                                   index == storeController.categoryIndex;
//                               return InkWell(
//                                 onTap: () =>
//                                     storeController.setCategoryIndex(index),
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: Dimensions.paddingSizeDefault,
//                                     vertical: Dimensions.paddingSizeExtraSmall,
//                                   ),
//                                   margin: const EdgeInsets.only(
//                                       right: Dimensions.paddingSizeSmall),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Theme.of(context)
//                                             .primaryColor
//                                             .withOpacity(0.2)),
//                                     borderRadius: BorderRadius.circular(
//                                         Dimensions.radiusDefault),
//                                     color: isSelected
//                                         ? Colors.black
//                                         : Colors.transparent,
//                                   ),
//                                   child: Text(
//                                     category.name!,
//                                     style: isSelected
//                                         ? robotoMedium.copyWith(
//                                             fontSize: Dimensions.fontSizeSmall,
//                                             color: Colors.white)
//                                         : robotoRegular.copyWith(
//                                             fontSize: Dimensions.fontSizeSmall,
//                                             color: Colors.black),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//               // === Items List ===
//               SliverToBoxAdapter(
//                 child: Container(
//                   width: Dimensions.webMaxWidth,
//                   color: Theme.of(context).colorScheme.surface,
//                   padding:
//                       const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
//                   child: StoreItemsView(
//                     storeId: store.id!,
//                     type: storeController.type,
//                     isScrollable: false,
//                   ),
//                 ),
//               ),

//               // === Pagination Footer ===
//               SliverToBoxAdapter(child: _buildPaginationFooter()),

//               const SliverToBoxAdapter(child: SizedBox(height: 80)),
//             ],
//           );
//         }),

//         // === Bottom Cart ===
//         bottomSheet: GetBuilder<CartController>(builder: (cartController) {
//           return cartController.cartList.isNotEmpty &&
//                   !ResponsiveHelper.isDesktop(context)
//               ? BottomCartWidget(fromgroccery: false)
//               : const SizedBox();
//         }),

//         // === Floating Menu Button ===
//         floatingActionButton: Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 32, 31, 31),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: FloatingActionButton(
//             backgroundColor: const Color.fromARGB(255, 32, 31, 31),
//             onPressed: () => showGridMenu(context),
//             child: const Icon(Icons.menu_book_sharp,
//                 color: Colors.white, size: 30),
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       ),
//     );
//   }

//   Widget _buildSearchBar(String? storeName) {
//     return Container(
//       height: 40,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: const Color.fromARGB(255, 244, 243, 243),
//         border: Border.all(width: 0.3, color: Colors.grey),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 10,
//             left: 20,
//             child: SizedBox(
//               width: 200,
//               child: Text(
//                 "Search in ${storeName ?? 'Store'}",
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             ),
//           ),
//           const Positioned(
//             right: 10,
//             top: 5,
//             child: Icon(Icons.search, size: 30, color: Colors.red),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildClosedBanner(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         width: double.infinity,
//         height: 80,
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 237, 121, 11).withOpacity(0.2),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 "This restaurant is currently not available for delivery".tr,
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Theme.of(context).primaryColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Image.asset("assets/image/icons/icons8-disconnect-94.png"),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPaginationFooter() {
//     return GetBuilder<StoreController>(builder: (storeController) {
//       final model = storeController.storeItemModel;
//       if (model == null || model.items == null) return const SizedBox();
//       final isLastPage = (model.items!.length + 1) >= (model.totalSize ?? 0);
//       return isLastPage ? const EndScreenDialog() : const SizedBox();
//     });
//   }
// }

// // === CORRECT SLIVER DELEGATES ===
// class _SearchFilterDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;
//   _SearchFilterDelegate({required this.child});

//   @override
//   Widget build(
//           BuildContext context, double shrinkOffset, bool overlapsContent) =>
//       child;
//   @override
//   double get maxExtent => 70;
//   @override
//   double get minExtent => 70;
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       false;
// }

// class _CategoryTabDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;
//   _CategoryTabDelegate({required this.child});

//   @override
//   Widget build(
//           BuildContext context, double shrinkOffset, bool overlapsContent) =>
//       child;
//   @override
//   double get maxExtent => 50;
//   @override
//   double get minExtent => 50;
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       false;
// }

// // === MENU DIALOG ===
// void showGridMenu(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (_) => Padding(
//       padding: const EdgeInsets.only(bottom: 90, right: 16),
//       child: Align(
//         alignment: Alignment.bottomRight,
//         child: Material(
//           color: const Color.fromARGB(255, 32, 31, 31),
//           borderRadius: BorderRadius.circular(12),
//           child: SizedBox(
//             width: 200,
//             height: 300,
//             child: GetBuilder<StoreController>(builder: (storeController) {
//               return ListView.builder(
//                 padding: const EdgeInsets.all(8),
//                 itemCount: storeController.categoryList!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     contentPadding: EdgeInsets.zero,
//                     title: Text(
//                       storeController.categoryList![index].name!,
//                       style: const TextStyle(color: Colors.white, fontSize: 17),
//                     ),
//                     onTap: () {
//                       Navigator.pop(context);
//                       storeController.setCategoryIndex(index);
//                     },
//                   );
//                 },
//               );
//             }),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// // === SHIMMER WIDGETS (Original Design Restored) ===
// class MyStoreShimmer extends StatelessWidget {
//   final bool isloader;
//   const MyStoreShimmer({super.key, required this.isloader});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isloader
//           ? Center(
//               child: Lottie.asset(
//                 'assets/animations/Animation - 1740696483528 (4).json',
//                 repeat: true,
//                 fit: BoxFit.cover,
//                 height: 200,
//                 width: 200,
//               ),
//             )
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 50),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             ShimmerSkeleton(height: 30, width: 150),
//                             SizedBox(height: 5),
//                             ShimmerSkeleton(height: 20, width: 250),
//                           ],
//                         ),
//                         Column(
//                           children: const [
//                             ShimmerSkeleton(height: 30, width: 80),
//                             SizedBox(height: 5),
//                             ShimmerSkeleton(height: 20, width: 60),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 50),
//                     Row(
//                       children: const [
//                         ShimmerSkeleton(height: 35, width: 260),
//                         SizedBox(width: 10),
//                         ShimmerSkeleton(height: 35, width: 80),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       height: 45,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 5,
//                         itemBuilder: (context, index) => const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: ShimmerSkeleton(height: 20, width: 85),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const ItemShimmer(),
//                     const SizedBox(height: 20),
//                     const ItemShimmer(),
//                     const SizedBox(height: 20),
//                     const ItemShimmer(),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }

// class ItemShimmer extends StatelessWidget {
//   const ItemShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer(
//       enabled: true,
//       child: Container(
//         height: 120,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.04),
//                 spreadRadius: 2,
//                 blurRadius: 5),
//           ],
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 120,
//               height: 120,
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.04),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     ShimmerSkeleton(height: 20, width: 180),
//                     ShimmerSkeleton(height: 15, width: 100),
//                     ShimmerSkeleton(height: 18, width: 80),
//                     ShimmerSkeleton(height: 15, width: 60),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ShimmerSkeleton extends StatelessWidget {
//   final double? height, width;
//   const ShimmerSkeleton({Key? key, this.height, this.width}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer(
//       enabled: true,
//       child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.04),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// === MAIN WIDGET ===
class StoreScreen extends StatefulWidget {
  final Store? store;
  final bool fromModule;
  final String slug;

  const StoreScreen({
    super.key,
    required this.store,
    required this.fromModule,
    this.slug = '',
  });

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final storeController = Get.find<StoreController>();
      storeController.getStoreItemList(
        widget.store!.id,
        1,
        'all',
        true,
      );
    });

    _initData();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initSecondaryData());
    scrollController.addListener(_onScroll);
  }

  void _initData() async {
    final storeController = Get.find<StoreController>();
    storeController.hideAnimation();

    await storeController
        .getStoreDetails(Store(id: widget.store!.id), widget.fromModule,
            slug: widget.slug)
        .then((_) => storeController.showButtonAnimation());

    if (Get.find<CategoryController>().categoryList == null) {
      Get.find<CategoryController>().getCategoryList(true);
    }
  }

  void _initSecondaryData() async {
    final isLoggedIn = AuthHelper.isLoggedIn();
    final checkoutController = Get.find<CheckoutController>();
    final profileController = Get.find<ProfileController>();
    final addressController = Get.find<AddressController>();
    final couponController = Get.find<CouponController>();
    final cartController = Get.find<CartController>();

    checkoutController.initCheckoutData(widget.store!.id);
    checkoutController.setPaymentMethod(0, isUpdate: false);

    final userAddress = AddressHelper.getUserAddressFromSharedPref();
    checkoutController.streetNumberController.text =
        userAddress?.streetNumber ?? '';
    checkoutController.houseController.text = userAddress?.house ?? '';
    checkoutController.floorController.text = userAddress?.floor ?? '';
    checkoutController.couponController.clear();
    checkoutController.getDmTipMostTapped();
    checkoutController.setPreferenceTimeForView('', isUpdate: false);
    checkoutController.getOfflineMethodList();
    checkoutController.toggleCreateAccount(willUpdate: false);
    checkoutController.changePartialPayment(isUpdate: false);

    if (isLoggedIn) {
      if (profileController.userInfoModel == null)
        profileController.getUserInfo();
      couponController.getCouponList();
      if (addressController.addressList == null)
        addressController.getAddressList();
    }

    if (widget.store!.id == null && GetPlatform.isWeb) {
      await cartController.getCartDataOnline();
    }

    checkoutController.pickPrescriptionImage(isRemove: true, isCamera: false);

    final tipIndex = checkoutController.getSharedPrefDmTipIndex();
    final index = tipIndex.isNotEmpty ? int.parse(tipIndex) : 0;
    checkoutController.updateTips(index, notify: false);
    checkoutController.tipController.text =
        index < AppConstants.tips.length ? AppConstants.tips[index] : '';
  }

  void _onScroll() {
    final storeController = Get.find<StoreController>();
    final model = storeController.storeItemModel;

    // Title visibility
    if (scrollController.offset > 50 && !_showTitle) {
      setState(() => _showTitle = true);
    } else if (scrollController.offset <= 50 && _showTitle) {
      setState(() => _showTitle = false);
    }

    // FAB animation
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (storeController.showFavButton) {
        storeController.changeFavVisibility();
        storeController.hideAnimation();
      }
    } else {
      if (!storeController.showFavButton) {
        storeController.changeFavVisibility();
        storeController.showButtonAnimation();
      }
    }

    // === PAGINATION ===
    if (model == null || model.items == null) return;
    final currentItems = model.items!.length;
    final totalSize = model.totalSize ?? 0;
    if (currentItems >= totalSize) return;

    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 500 &&
        !storeController.isLoadingMore &&
        storeController.hasMoreItems) {
      debugPrint("Loading more items... Page: ${storeController.itemOffset}");
      storeController.getStoreItemList(
        widget.store!.id,
        storeController.itemOffset,
        storeController.type,
        true,
      );
    }
  }

  @override
  void dispose() {
    Get.find<StoreController>().clearstoreitems();
    scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        endDrawer: const MenuDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: GetBuilder<StoreController>(builder: (storeController) {
          final store = storeController.store;
          final hasData = store != null && store.name != null;
          if (!hasData) {
            return const MyStoreShimmer(isloader: false);
          }

          storeController.setCategoryList();

          return CustomScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // === APP BAR (SOLID BACKGROUND) ===
              SliverAppBar(
                backgroundColor: Theme.of(context).cardColor,
                surfaceTintColor: Theme.of(context).cardColor,
                elevation: 0,
                pinned: true,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColor),
                ),
                title: Text(
                  _showTitle ? store.name ?? '' : '',
                  style: robotoMedium.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  GetBuilder<FavouriteController>(
                      builder: (favouriteController) {
                    final isWished =
                        favouriteController.wishStoreIdList.contains(store.id);
                    return InkWell(
                      onTap: () {
                        if (AuthHelper.isLoggedIn()) {
                          isWished
                              ? favouriteController.removeFromFavouriteList(
                                  store.id, true)
                              : favouriteController.addToFavouriteList(
                                  null, store.id, true);
                        } else {
                          showCustomSnackBar('you_are_not_logged_in'.tr);
                        }
                      },
                      child: Icon(
                        isWished ? Icons.favorite : Icons.favorite_border,
                        color: isWished
                            ? Colors.redAccent
                            : Theme.of(context).primaryColor,
                        size: 25,
                      ),
                    );
                  }),
                  if (AppConstants.webHostedUrl.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: storeController.shareStore,
                        child: SvgPicture.asset('assets/image/icons/Vector.svg',
                            height: 20),
                      ),
                    ),
                ],
              ),

              // === STORE INFO SECTION ===
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    width: Dimensions.webMaxWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        StoreDescriptionViewWidget(store: store),
                        if (store.open != 1 || !store.active!)
                          _buildClosedBanner(context),
                        StoreBannerWidget(storeController: storeController),
                        CouponCarousel(storeid: store.id),
                      ],
                    ),
                  ),
                ),
              ),

              // === STICKY SEARCH + CATEGORY HEADER (PINNED) ===
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickySearchCategoryDelegate(
                  storeController: storeController,
                  storeName: store.name,
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  width: Dimensions.webMaxWidth,
                  color: Theme.of(context).colorScheme.surface,
                  padding:
                      const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
                  child: StoreItemsView(
                    storeId: store.id!,
                    type: storeController.type,
                    isScrollable: false,
                  ),
                ),
              ),

              // === PAGINATION FOOTER ===
              SliverToBoxAdapter(child: _buildPaginationFooter()),

              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          );
        }),

        // === BOTTOM CART ===
        bottomSheet: GetBuilder<CartController>(builder: (cartController) {
          return cartController.cartList.isNotEmpty &&
                  !ResponsiveHelper.isDesktop(context)
              ? BottomCartWidget(fromgroccery: false)
              : const SizedBox();
        }),

        // === FLOATING MENU BUTTON ===
        floatingActionButton: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 32, 31, 31),
            borderRadius: BorderRadius.circular(100),
          ),
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 32, 31, 31),
            onPressed: () => showGridMenu(context),
            child: const Icon(Icons.menu_book_sharp,
                color: Colors.white, size: 30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  // === HELPER WIDGETS ===
  Widget _buildSearchBar(String? storeName) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 244, 243, 243),
        border: Border.all(width: 0.3, color: Colors.grey),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            child: SizedBox(
              width: 200,
              child: Text(
                "Search in ${storeName ?? 'Store'}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          const Positioned(
            right: 10,
            top: 5,
            child: Icon(Icons.search, size: 30, color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildClosedBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 237, 121, 11).withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "This restaurant is currently not available for delivery".tr,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12),
            Image.asset("assets/image/icons/icons8-disconnect-94.png"),
          ],
        ),
      ),
    );
  }

  Widget _buildPaginationFooter() {
    return GetBuilder<StoreController>(builder: (storeController) {
      final model = storeController.storeItemModel;
      if (model == null || model.items == null) return const SizedBox();
      final hasMore = storeController.hasMoreItems;
      final isLoading = storeController.isLoadingMore;

      if (!hasMore && model.items!.isNotEmpty) {
        return const EndScreenDialog();
      }
      if (isLoading) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: ItemShimmer(),
        );
      }
      return const SizedBox(height: 20);
    });
  }
}

// === NEW STICKY DELEGATE (SEARCH + CATEGORY) ===
// === NEW STICKY DELEGATE (SEARCH + CATEGORY) ===
class _StickySearchCategoryDelegate extends SliverPersistentHeaderDelegate {
  final StoreController storeController;
  final String? storeName;

  const _StickySearchCategoryDelegate({
    required this.storeController,
    this.storeName,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          // ── SEARCH + VEG FILTER ───────────────────────
          if (storeController.type.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeExtraSmall,
                horizontal: Dimensions.paddingSizeSmall,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Get.toNamed(
                          RouteHelper.getSearchStoreItemRoute(
                              storeController.store!.id)),
                      child: _buildSearchBar(storeName),
                    ),
                  ),
                  const SizedBox(width: 5),
                  VegFilterWidget(
                    type: storeController.type,
                    onSelected: (type) {
                      storeController.getStoreItemList(
                          storeController.store!.id, 1, type, true);
                    },
                  ),
                ],
              ),
            ),

          if (storeController.categoryList!.isNotEmpty)
            GetBuilder<StoreController>(
              builder: (controller) => SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                      left: Dimensions.paddingSizeSmall, top: 10),
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.categoryList!.length,
                  itemBuilder: (context, index) {
                    final category = controller.categoryList![index];
                    final isSelected = index == controller.categoryIndex;

                    return InkWell(
                      onTap: () {
                        controller
                            .setCategoryIndex(index); // <-- triggers rebuild
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault,
                          vertical: Dimensions.paddingSizeExtraSmall,
                        ),
                        margin: const EdgeInsets.only(
                            right: Dimensions.paddingSizeSmall),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2)),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                          color: isSelected ? Colors.black : Colors.transparent,
                        ),
                        child: Text(
                          category.name!,
                          style: isSelected
                              ? robotoMedium.copyWith(
                                  fontSize: Dimensions.fontSizeSmall,
                                  color: Colors.white,
                                )
                              : robotoRegular.copyWith(
                                  fontSize: Dimensions.fontSizeSmall,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 115;
  @override
  double get minExtent => 115;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;

  // Helper (kept inside the delegate to avoid duplicate method)
  Widget _buildSearchBar(String? storeName) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 244, 243, 243),
        border: Border.all(width: 0.3, color: Colors.grey),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            child: SizedBox(
              width: 200,
              child: Text(
                "Search in ${storeName ?? 'Store'}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          const Positioned(
            right: 10,
            top: 5,
            child: Icon(Icons.search, size: 30, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

// === MENU DIALOG ===
void showGridMenu(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => Padding(
      padding: const EdgeInsets.only(bottom: 90, right: 16),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Material(
          color: const Color.fromARGB(255, 32, 31, 31),
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 200,
            height: 300,
            child: GetBuilder<StoreController>(builder: (storeController) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: storeController.categoryList!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      storeController.categoryList![index].name!,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      storeController.setCategoryIndex(index);
                    },
                  );
                },
              );
            }),
          ),
        ),
      ),
    ),
  );
}

// === SHIMMER WIDGETS ===
class MyStoreShimmer extends StatelessWidget {
  final bool isloader;
  const MyStoreShimmer({super.key, required this.isloader});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloader
          ? Center(
              child: Lottie.asset(
                'assets/animations/Animation - 1740696483528 (4).json',
                repeat: true,
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ShimmerSkeleton(height: 30, width: 150),
                            SizedBox(height: 5),
                            ShimmerSkeleton(height: 20, width: 250),
                          ],
                        ),
                        Column(
                          children: const [
                            ShimmerSkeleton(height: 30, width: 80),
                            SizedBox(height: 5),
                            ShimmerSkeleton(height: 20, width: 60),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: const [
                        ShimmerSkeleton(height: 35, width: 260),
                        SizedBox(width: 10),
                        ShimmerSkeleton(height: 35, width: 80),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ShimmerSkeleton(height: 20, width: 85),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ItemShimmer(),
                    const SizedBox(height: 20),
                    const ItemShimmer(),
                    const SizedBox(height: 20),
                    const ItemShimmer(),
                  ],
                ),
              ),
            ),
    );
  }
}

class ItemShimmer extends StatelessWidget {
  const ItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        height: 180,
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            // Image placeholder

            // Content placeholder
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title placeholder
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    width: 180,
                    height: 20,
                    margin: const EdgeInsets.only(bottom: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),

                  // Description placeholder
                  Container(
                    width: 50,
                    height: 20,
                    margin: const EdgeInsets.only(bottom: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),

                  // Price placeholder
                  Container(
                    width: 150,
                    height: 30,
                    margin: const EdgeInsets.only(bottom: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),

                  Container(
                    width: 80,
                    height: 20,
                    margin: const EdgeInsets.only(bottom: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.04),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerSkeleton extends StatelessWidget {
  final double? height, width;
  const ShimmerSkeleton({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: true,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
