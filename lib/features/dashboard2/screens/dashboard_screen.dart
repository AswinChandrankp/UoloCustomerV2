import 'dart:async';
import 'dart:io';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:sixam_mart/features/dashboard/dashboardscroll_controller.dart';
import 'package:sixam_mart/features/dashboard/widgets/store_registration_success_bottom_sheet.dart';
import 'package:sixam_mart/features/dashboard2/widgets/address_bottom_sheet_widget.dart';
import 'package:sixam_mart/features/home/controllers/home_controller.dart';
import 'package:sixam_mart/features/location/controllers/location_controller.dart';
import 'package:sixam_mart/features/splash/controllers/splash_controller.dart';
import 'package:sixam_mart/features/order/controllers/order_controller.dart';
import 'package:sixam_mart/features/order/domain/models/order_model.dart';
import 'package:sixam_mart/features/address/screens/address_screen.dart';
import 'package:sixam_mart/features/auth/controllers/auth_controller.dart';
import 'package:sixam_mart/features/dashboard/widgets/bottom_nav_item_widget.dart';
import 'package:sixam_mart/features/parcel/controllers/parcel_controller.dart';
import 'package:sixam_mart/features/store/controllers/store_controller.dart';
import 'package:sixam_mart/helper/auth_helper.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/common/widgets/cart_widget.dart';
import 'package:sixam_mart/common/widgets/custom_dialog.dart';
import 'package:sixam_mart/features/checkout/widgets/congratulation_dialogue.dart';
import 'package:sixam_mart/features/dashboard/widgets/address_bottom_sheet_widget.dart';
import 'package:sixam_mart/features/dashboard/widgets/parcel_bottom_sheet_widget.dart';
import 'package:sixam_mart/features/favourite/screens/favourite_screen.dart';
import 'package:sixam_mart/features/home/screens/home_screen.dart';
import 'package:sixam_mart/features/menu/screens/menu_screen.dart';
import 'package:sixam_mart/features/order/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/util/styles.dart';

import '../widgets/running_order_view_widget.dart';

// class DashboardScreen extends StatefulWidget {
//   final int pageIndex;
//   final bool fromSplash;
//   const DashboardScreen({super.key, required this.pageIndex, this.fromSplash = false});

//   @override
//   DashboardScreenState createState() => DashboardScreenState();
// }

// class DashboardScreenState extends State<DashboardScreen> {
//   PageController? _pageController;
//   int _pageIndex = 0;
//   late List<Widget> _screens;
//   final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
//   bool _canExit = GetPlatform.isWeb ? true : false;

//   GlobalKey<ExpandableBottomSheetState> key = GlobalKey();

//   late bool _isLogin;
//   bool active = false;

//   @override
//   void initState() {
//     super.initState();

//     _isLogin = AuthHelper.isLoggedIn();

//     _showRegistrationSuccessBottomSheet();

//     if(_isLogin){
//       if(Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 && Get.find<AuthController>().getEarningPint().isNotEmpty
//           && !ResponsiveHelper.isDesktop(Get.context)){
//         Future.delayed(const Duration(seconds: 1), () => showAnimatedDialog(Get.context!, const CongratulationDialogue()));
//       }
//       suggestAddressBottomSheet();
//       Get.find<OrderController>().getRunningOrders(1, fromDashboard: true);
//     }

//     _pageIndex = widget.pageIndex;

//     _pageController = PageController(initialPage: widget.pageIndex);

//     _screens = [
//       const HomeScreen(),
//       const FavouriteScreen(),
//       const SizedBox(),
//       const OrderScreen(),
//       const MenuScreen()
//     ];

//     Future.delayed(const Duration(seconds: 1), () {
//       setState(() {});
//     });

//   }

//   _showRegistrationSuccessBottomSheet() {
//     bool canShowBottomSheet = Get.find<HomeController>().getRegistrationSuccessfulSharedPref();
//     if(canShowBottomSheet) {
//       Future.delayed(const Duration(seconds: 1), () {
//         ResponsiveHelper.isDesktop(Get.context) ? Get.dialog(const Dialog(child: StoreRegistrationSuccessBottomSheet())).then((value) {
//           Get.find<HomeController>().saveRegistrationSuccessfulSharedPref(false);
//           Get.find<HomeController>().saveIsStoreRegistrationSharedPref(false);
//           setState(() {});
//         }) : showModalBottomSheet(
//           context: Get.context!, isScrollControlled: true, backgroundColor: Colors.transparent,
//           builder: (con) => const StoreRegistrationSuccessBottomSheet(),
//         ).then((value) {
//           Get.find<HomeController>().saveRegistrationSuccessfulSharedPref(false);
//           Get.find<HomeController>().saveIsStoreRegistrationSharedPref(false);
//           setState(() {});
//         });
//       });
//     }
//   }

//   Future<void> suggestAddressBottomSheet() async {
//     active = await Get.find<LocationController>().checkLocationActive();
//     if(widget.fromSplash && Get.find<LocationController>().showLocationSuggestion && active) {
//       Future.delayed(const Duration(seconds: 1), () {
//         showModalBottomSheet(
//           context: Get.context!, isScrollControlled: true, backgroundColor: Colors.transparent,
//           builder: (con) => const AddressBottomSheetWidget(),
//         ).then((value) {
//           Get.find<LocationController>().hideSuggestedLocation();
//           setState(() {});
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
//     return GetBuilder<SplashController>(
//       builder: (splashController) {
//         return PopScope(
//           canPop: false,
//           onPopInvokedWithResult: (didPop, result) async {
//             if (_pageIndex != 0) {
//               _setPage(0);
//             } else {
//               if(!ResponsiveHelper.isDesktop(context) && Get.find<SplashController>().module != null && Get.find<SplashController>().configModel!.module == null) {
//                 Get.find<SplashController>().setModule(null);
//                 Get.find<StoreController>().resetStoreData();
//               }else {
//                 if(_canExit) {
//                   if (GetPlatform.isAndroid) {
//                     SystemNavigator.pop();
//                   } else if (GetPlatform.isIOS) {
//                     exit(0);
//                   }
//                 }else {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('back_press_again_to_exit'.tr, style: const TextStyle(color: Colors.white)),
//                     behavior: SnackBarBehavior.floating,
//                     backgroundColor: Colors.green,
//                     duration: const Duration(seconds: 2),
//                     margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                   ));
//                   _canExit = true;
//                   Timer(const Duration(seconds: 2), () {
//                     _canExit = false;
//                   });
//                 }
//               }
//             }
//           },
//           child: GetBuilder<OrderController>(
//             builder: (orderController) {
//               List<OrderModel> runningOrder = orderController.runningOrderModel != null ? orderController.runningOrderModel!.orders! : [];

//               List<OrderModel> reversOrder =  List.from(runningOrder.reversed);

//               return Scaffold(
//                 key: _scaffoldKey,
//                 body: ExpandableBottomSheet(
//                   background: Stack(children: [
//                     PageView.builder(
//                         controller: _pageController,
//                         itemCount: _screens.length,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           return _screens[index];
//                         },
//                       ),

//                       ResponsiveHelper.isDesktop(context) || keyboardVisible ? const SizedBox() : Align(
//                         alignment: Alignment.bottomCenter,
//                         child: GetBuilder<SplashController>(
//                           builder: (splashController) {
//                             bool isParcel = splashController.module != null && splashController.configModel!.moduleConfig!.module!.isParcel!;

//                             _screens = [
//                               const HomeScreen(),
//                               isParcel ? const AddressScreen(fromDashboard: true) : const FavouriteScreen(),
//                               const SizedBox(),
//                               const OrderScreen(),
//                               const MenuScreen()
//                             ];
//                             return Container(
//                               width: size.width, height: GetPlatform.isIOS ? 80 : 65,
//                               decoration: BoxDecoration(
//                                 color: Theme.of(context).cardColor,
//                                 borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.radiusLarge)),
//                                   boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
//                               ),
//                               child: Stack(children: [

//                                 Center(
//                                   heightFactor: 0.6,
//                                   child: ResponsiveHelper.isDesktop(context) ? null : (widget.fromSplash && Get.find<LocationController>().showLocationSuggestion && active) ? null
//                                     : (orderController.showBottomSheet && orderController.runningOrderModel != null && orderController.runningOrderModel!.orders!.isNotEmpty && _isLogin) ? const SizedBox() : Container(
//                                       width: 60, height: 60,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: Theme.of(context).cardColor, width: 5),
//                                         borderRadius: BorderRadius.circular(30),
//                                         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
//                                       ),
//                                       child: FloatingActionButton(
//                                         backgroundColor: Theme.of(context).primaryColor,
//                                         onPressed: () {
//                                           if(isParcel) {
//                                             showModalBottomSheet(
//                                               context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
//                                               builder: (con) => ParcelBottomSheetWidget(parcelCategoryList: Get.find<ParcelController>().parcelCategoryList),
//                                             );
//                                           } else {
//                                             Get.toNamed(RouteHelper.getCartRoute());
//                                           }
//                                         },
//                                         elevation: 0,
//                                         child: isParcel ? Icon(CupertinoIcons.add, size: 34, color: Theme.of(context).cardColor) : CartWidget(color: Theme.of(context).cardColor, size: 22),
//                                       ),
//                                   ),
//                                 ),

//                                 ResponsiveHelper.isDesktop(context) ? const SizedBox() : (widget.fromSplash && Get.find<LocationController>().showLocationSuggestion && active) ? const SizedBox()
//                                 : (orderController.showBottomSheet && orderController.runningOrderModel != null && orderController.runningOrderModel!.orders!.isNotEmpty && _isLogin) ? const SizedBox() : Center(
//                                   child: SizedBox(
//                                       width: size.width, height: 80,
//                                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//                                         BottomNavItemWidget(
//                                           title: 'home'.tr, selectedIcon: Images.homeSelect,
//                                           unSelectedIcon: Images.homeUnselect, isSelected: _pageIndex == 0,
//                                           onTap: () => _setPage(0),
//                                         ),
//                                         BottomNavItemWidget(
//                                           title: isParcel ? 'address'.tr : 'favourite'.tr,
//                                           selectedIcon: isParcel ? Images.addressSelect : Images.favouriteSelect,
//                                           unSelectedIcon: isParcel ? Images.addressUnselect : Images.favouriteUnselect,
//                                           isSelected: _pageIndex == 1, onTap: () => _setPage(1),
//                                         ),
//                                         Container(width: size.width * 0.2),
//                                         BottomNavItemWidget(
//                                           title: 'orders'.tr, selectedIcon: Images.orderSelect, unSelectedIcon: Images.orderUnselect,
//                                           isSelected: _pageIndex == 3, onTap: () => _setPage(3),
//                                         ),
//                                         BottomNavItemWidget(
//                                           title: 'menu'.tr, selectedIcon: Images.menu, unSelectedIcon: Images.menu,
//                                           isSelected: _pageIndex == 4, onTap: () => _setPage(4),
//                                         ),
//                                       ]),
//                                   ),
//                                 ),
//                               ],
//                               ),
//                             );
//                           }
//                         ),
//                       ),
//                     ]),

//                   persistentContentHeight: (widget.fromSplash && Get.find<LocationController>().showLocationSuggestion && active) ? 0 : GetPlatform.isIOS ? 110 : 100,

//                   onIsContractedCallback: () {
//                     if(!orderController.showOneOrder) {
//                       orderController.showOrders();
//                     }
//                   },
//                   onIsExtendedCallback: () {
//                     if(orderController.showOneOrder) {
//                       orderController.showOrders();
//                     }
//                   },

//                   enableToggle: true,

//                   expandableContent: (widget.fromSplash && Get.find<LocationController>().showLocationSuggestion && active && !ResponsiveHelper.isDesktop(context)) ?  const SizedBox()
//                   : (ResponsiveHelper.isDesktop(context) || !_isLogin || orderController.runningOrderModel == null
//                   || orderController.runningOrderModel!.orders!.isEmpty || !orderController.showBottomSheet) ? const SizedBox()
//                   : Dismissible(
//                     key: UniqueKey(),
//                     onDismissed: (direction) {
//                       if(orderController.showBottomSheet){
//                         orderController.showRunningOrders();
//                       }
//                     },
//                     child: RunningOrderViewWidget(reversOrder: reversOrder, onOrderTap: () {
//                       _setPage(3);
//                       if(orderController.showBottomSheet){
//                         orderController.showRunningOrders();
//                       }
//                     }),
//                   ),
//                 ),
//               );
//             }
//           ),
//         );
//       }
//     );
//   }

//   void _setPage(int pageIndex) {
//     setState(() {
//       _pageController!.jumpToPage(pageIndex);
//       _pageIndex = pageIndex;
//     });
//   }

//   Widget trackView(BuildContext context, {required bool status}) {
//     return Container(height: 3, decoration: BoxDecoration(color: status ? Theme.of(context).primaryColor
//         : Theme.of(context).disabledColor  , borderRadius: BorderRadius.circular(Dimensions.radiusDefault)));
//   }
// }

// class DashboardScreen extends StatefulWidget {
//   final int pageIndex;
//   final bool fromSplash;

//  static final GlobalKey<DashboardScreenState> globalKey = GlobalKey<DashboardScreenState>();
//   const DashboardScreen({super.key, required this.pageIndex, this.fromSplash = false});

//   @override
//   DashboardScreenState createState() => DashboardScreenState();
// }

// class DashboardScreenState extends State<DashboardScreen> {
//   late PageController _pageController;
//   int _pageIndex = 1;
//   late List<Widget> _screens;
//   final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
//   bool _canExit = GetPlatform.isWeb ? true : false;
//   late bool _isLogin;
//   bool active = false;
//   late ScrollController _scrollController;
//   @override
//   void initState() {
//     super.initState();
//      Get.lazyPut(() => Bottomsheetcontroller());
//     _isLogin = AuthHelper.isLoggedIn();
//     Get.find<SplashController>().getConfigData(loadModuleData: true);
//     _pageIndex =
//     widget.fromSplash ? 0 : widget.pageIndex ;
//     // Get.find<SplashController>().getModules();
//     //  for(ModuleModel module in Get.find<SplashController>().moduleList ?? []) {
//     //                         if(module.moduleType == AppConstants.food) {
//     //                           Get.find<SplashController>().setModule(module);
//     //                           break;
//     //                         }
//     //                       }
//       // Get.find<SplashController>().setModule(

//       // );

//     _showRegistrationSuccessBottomSheet();

//     if (_isLogin) {
//       _handleLoginActions();
//     }

//     _pageController = PageController(initialPage: _pageIndex);
//     _initializeScreens();

//     Timer(const Duration(seconds: 1), () {
//       setState(() {});
//     });

//      _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);
//   }

//     void _onScroll() {
//     if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {

//       print("scroll direction reverse");
//       // User is scrolling down
//       if (Get.find<OrderController>().showBottomSheet) {
//         // Get.find<OrderController>().hideRunningOrders();
//       }
//     } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
//       // User is scrolling up
//       if (!Get.find<OrderController>().showBottomSheet) {
//         Get.find<OrderController>().showRunningOrders();
//          print("scroll directionn non reverse");
//       }
//     }
//   }

//   void _handleLoginActions() {
//     if (Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 &&
//         Get.find<AuthController>().getEarningPint().isNotEmpty &&
//         !ResponsiveHelper.isDesktop(Get.context)) {
//       Future.delayed(
//           const Duration(seconds: 1),
//           () => showAnimatedDialog(
//               context, const CongratulationDialogue()));
//     }
//     suggestAddressBottomSheet();
//     Get.find<OrderController>().getRunningOrders(1, fromDashboard: true);
//   }

//   void _initializeScreens() {
//     _screens = [
//       const HomeScreen(),
//       const HomeScreen(),
//       const HomeScreen(),
//       const FavouriteScreen(),
//       const OrderScreen(),
//       const MenuScreen(),
//     ];
//   }

//   void _showRegistrationSuccessBottomSheet() {
//     bool canShowBottomSheet =
//         Get.find<HomeController>().getRegistrationSuccessfulSharedPref();
//     if (canShowBottomSheet) {
//       Timer(const Duration(seconds: 1), () {
//         ResponsiveHelper.isDesktop(context)
//             ? Get.dialog(const Dialog(
//                 child: StoreRegistrationSuccessBottomSheet())).then((_) {
//                 _clearRegistrationPrefs();
//               })
//             : showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 backgroundColor: Colors.transparent,
//                 builder: (_) => const StoreRegistrationSuccessBottomSheet(),
//               ).then((_) => _clearRegistrationPrefs());
//       });
//     }
//   }

//   void _clearRegistrationPrefs() {
//     Get.find<HomeController>().saveRegistrationSuccessfulSharedPref(false);
//     Get.find<HomeController>().saveIsStoreRegistrationSharedPref(false);
//     setState(() {});
//   }

//   Future<void> suggestAddressBottomSheet() async {
//     active = await Get.find<LocationController>().checkLocationActive();
//     if (widget.fromSplash &&
//         Get.find<LocationController>().showLocationSuggestion &&
//         active) {
//       Timer(const Duration(seconds: 1), () {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           backgroundColor: Colors.transparent,
//           builder: (_) => const AddressBottomSheetWidget(),
//         ).then((_) {
//           Get.find<LocationController>().hideSuggestedLocation();
//           setState(() {});
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
//     return GetBuilder<SplashController>(builder: (splashController) {
//       return PopScope(
//         canPop: false,
//         onPopInvoked: (_) async => _handleBackPress(),
//         child: GetBuilder<OrderController>(
//           builder: (orderController) {
//             List<OrderModel> runningOrders =
//                 orderController.runningOrderModel?.orders ?? [];
//             List<OrderModel> reversedOrders = List.from(runningOrders.reversed);

//             return Scaffold(
//               key: _scaffoldKey,
//               body: ExpandableBottomSheet(
//                 background: _buildPageView(),
//                 persistentContentHeight: _calculatePersistentHeight(),
//                 onIsContractedCallback: () {
//                   if (!orderController.showOneOrder) {
//                     orderController.showOrders();
//                   }
//                 },
//                 onIsExtendedCallback: () {
//                   if (orderController.showOneOrder) {
//                     orderController.showOrders();
//                   }
//                 },
//                 expandableContent: _buildExpandableContent(orderController, reversedOrders),
//               ),
//             );
//           },
//         ),
//       );
//     });
//   }

//   Widget _buildPageView() {
//     return Stack(
//       children: [
//         PageView.builder(
//           controller: _pageController,
//           itemCount: _screens.length,
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) => _screens[index],
//         ),

//              _buildBottomNav()

//         ,
//       ],
//     );
//   }

//   double _calculatePersistentHeight() {
//     return (widget.fromSplash &&
//             Get.find<LocationController>().showLocationSuggestion &&
//             active)
//         ? 0
//         : GetPlatform.isIOS
//             ? 110
//             : 100;
//   }

//   Widget _buildExpandableContent(OrderController orderController, List<OrderModel> reversedOrders) {
//     if (widget.fromSplash &&
//         Get.find<LocationController>().showLocationSuggestion &&
//         active &&
//         !ResponsiveHelper.isDesktop(context)) {
//       return const SizedBox();
//     } else if (!ResponsiveHelper.isDesktop(context) &&
//         _isLogin &&
//         orderController.runningOrderModel?.orders?.isNotEmpty == true &&
//         orderController.showBottomSheet) {
//       return Dismissible(
//         key: UniqueKey(),
//         onDismissed: (_) {
//           if (orderController.showBottomSheet) {
//             orderController.showRunningOrders();
//           }
//         },
//         child: RunningOrderViewWidget(
//           reversOrder: reversedOrders,
//           onOrderTap: () {
//             setPage(3);
//             if (orderController.showBottomSheet) {
//               orderController.showRunningOrders();
//             }
//           },
//         ),
//       );
//     } else {
//       return const SizedBox();
//     }
//   }

//   Widget _buildBottomNav() {
//     final Size size = MediaQuery.of(context).size;
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: GetBuilder<SplashController>(
//         builder: (splashController) {
//           bool isParcel = splashController.module != null &&
//               splashController.configModel!.moduleConfig!.module!.isParcel!;

//           return Obx(() {
//               return  Get.find<Bottomsheetcontroller>().showBottomSheet.value ? Container(
//                 width: size.width,
//                 height: GetPlatform.isIOS ? 80 : 55,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   boxShadow: const [
//                     BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     BottomNavItemWidget(
//                       title: 'home'.tr,
//                       selectedIcon: "assets/svgs/homesl.svg",
//                       unSelectedIcon: "assets/svgs/homeun.svg",
//                       isSelected: _pageIndex == 0,
//                       onTap: () {
//                         splashController.removeModule();
//                         setPage(0);
//                       },
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 11),
//                       child: VerticalDivider(
//                         width: 10,
//                         color: Color(0xFF818181),
//                       ),
//                     ),
//                     BottomNavItemWidget(
//                       title: 'Food'.tr,
//                       selectedIcon: "assets/svgs/foodsl.svg",
//                       unSelectedIcon: "assets/svgs/foodun.svg",
//                       isSelected: _pageIndex == 1,
//                       onTap: () {
//                         splashController.switchModule(0, true);
//                         Get.find<StoreController>().resetStoreData();
//                         setPage(1);
//                       },
//                     ),
//                     BottomNavItemWidget(
//                       title: 'Uolomart'.tr,
//                       selectedIcon: "assets/svgs/martsl.svg",
//                       unSelectedIcon: "assets/svgs/martun.svg",
//                       isSelected: _pageIndex == 2,
//                       onTap: () {
//                         splashController.switchModule(1, true);
//                         Get.put(const DashboardScreen(pageIndex: 2));
//                         setPage(2);
//                       },
//                     ),
//                     BottomNavItemWidget(
//                       title: isParcel ? 'address'.tr : 'EatList'.tr,
//                       selectedIcon:
//                           isParcel ? Images.addressSelect : "assets/svgs/wishsl.svg",
//                       unSelectedIcon:
//                           isParcel ? Images.addressUnselect : "assets/svgs/wishun.svg",
//                       isSelected: _pageIndex == 3,
//                       onTap: () => setPage(3),
//                     ),
//                     BottomNavItemWidget(
//                       title: 'orders'.tr,
//                       selectedIcon: "assets/svgs/ordersl.svg",
//                       unSelectedIcon: "assets/svgs/orderun.svg",
//                       isSelected: _pageIndex == 4,
//                       onTap: () => setPage(4),
//                     ),
//                   ],
//                 ),
//               ) : SizedBox();
//             }
//           );
//         },
//       ),
//     );
//   }

//   Future<void> _handleBackPress() async {
//     if (_pageIndex != 0) {
//       setPage(1);
//     } else {
//       if (!ResponsiveHelper.isDesktop(context) &&
//           Get.find<SplashController>().module != null &&
//           Get.find<SplashController>().configModel!.module == null) {
//         Get.find<SplashController>().setModule(null);
//         Get.find<StoreController>().resetStoreData();
//       } else {
//         if (_canExit) {
//           if (GetPlatform.isAndroid) {
//             SystemNavigator.pop();
//           } else if (GetPlatform.isIOS) {
//             exit(0);
//           }

//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(

//             content: Text('back_press_again_to_exit'.tr,
//                 style: const TextStyle(color: Colors.white)),

//             behavior: SnackBarBehavior.floating,
//             backgroundColor: Colors.green,
//             duration: const Duration(seconds: 2),
//             margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//           ));
//           _canExit = true;
//           Timer(const Duration(seconds: 2), () {
//             _canExit = false;
//           });
//         }
//       }
//     }
//   }

//   void setPage(int pageIndex) {
//     setState(() {
//       _pageController.jumpToPage(pageIndex);
//       _pageIndex = pageIndex;
//     });
//   }

//   Widget trackView(BuildContext context, {required bool status}) {
//     return Container(
//       height: 3,
//       decoration: BoxDecoration(
//         color: status
//             ? Theme.of(context).primaryColor
//             : Theme.of(context).disabledColor.withOpacity(0.5),
//         borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//       ),
//     );
//   }
// }

// class DashboardScreen extends StatefulWidget {
//   final int pageIndex;
//   final bool fromSplash;

//  static final GlobalKey<DashboardScreenState> globalKey = GlobalKey<DashboardScreenState>();
//   const DashboardScreen({super.key, required this.pageIndex, this.fromSplash = false});

//   @override
//   DashboardScreenState createState() => DashboardScreenState();
// }

// class DashboardScreenState extends State<DashboardScreen> {
//   late PageController _pageController;
//   int _pageIndex = 1;
//   late List<Widget> _screens;
//   final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
//   bool _canExit = GetPlatform.isWeb ? true : false;
//   late bool _isLogin;
//   bool active = false;
//   late ScrollController _scrollController;
//   @override
//   void initState() {
//     super.initState();
//     //  Get.lazyPut(() => Bottomsheetcontroller());
//     // Get.put(Bottomsheetcontroller());
//     // Get.find<Bottomsheetcontroller>();
//     _isLogin = AuthHelper.isLoggedIn();
//     Get.find<SplashController>().getConfigData(loadModuleData: true);
//     _pageIndex =
//     widget.fromSplash ? 0 : widget.pageIndex ;
//     // Get.find<SplashController>().getModules();
//     //  for(ModuleModel module in Get.find<SplashController>().moduleList ?? []) {
//     //                         if(module.moduleType == AppConstants.food) {
//     //                           Get.find<SplashController>().setModule(module);
//     //                           break;
//     //                         }
//     //                       }
//       // Get.find<SplashController>().setModule(

//       // );

//     _showRegistrationSuccessBottomSheet();

//     if (_isLogin) {
//       _handleLoginActions();
//     }

//     _pageController = PageController(initialPage: _pageIndex);
//     _initializeScreens();

//     Timer(const Duration(seconds: 1), () {
//       setState(() {});
//     });

//      _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);
//   }

//     void _onScroll() {
//     if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {

//       print("scroll direction reverse");
//       // User is scrolling down
//       if (Get.find<OrderController>().showBottomSheet) {
//         // Get.find<OrderController>().hideRunningOrders();
//       }
//     } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
//       // User is scrolling up
//       if (!Get.find<OrderController>().showBottomSheet) {
//         Get.find<OrderController>().showRunningOrders();
//          print("scroll directionn non reverse");
//       }
//     }
//   }

//   void _handleLoginActions() {
//     if (Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 &&
//         Get.find<AuthController>().getEarningPint().isNotEmpty &&
//         !ResponsiveHelper.isDesktop(Get.context)) {
//       // Future.delayed(
//       //     const Duration(seconds: 1),
//       //     () => showAnimatedDialog(

//       //         context, const CongratulationDialogue()

//       //         )

//       //         );

//       Future.delayed(
//   const Duration(seconds: 1),
//   () => showDialog(
//     context: context,
//     barrierColor: Colors.black.withOpacity(0.6), // Ensure the barrier is transparent
//     builder: (BuildContext context) {
//       return const CongratulationDialogue();
//     },
//   ),
// );
//     }
//     suggestAddressBottomSheet();
//     Get.find<OrderController>().getRunningOrders(1, fromDashboard: true);
//   }

//   void _initializeScreens() {
//     _screens = [
//       const HomeScreen(),
//       const HomeScreen(),
//       const HomeScreen(),
//       const FavouriteScreen(),
//       const OrderScreen(),
//       const MenuScreen(),
//     ];
//   }

//   void _showRegistrationSuccessBottomSheet() {
//     bool canShowBottomSheet =
//         Get.find<HomeController>().getRegistrationSuccessfulSharedPref();
//     if (canShowBottomSheet) {
//       Timer(const Duration(seconds: 1), () {
//         ResponsiveHelper.isDesktop(context)
//             ? Get.dialog(const Dialog(
//                 child: StoreRegistrationSuccessBottomSheet())).then((_) {
//                 _clearRegistrationPrefs();
//               })
//             : showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 backgroundColor: Colors.transparent,
//                 builder: (_) => const StoreRegistrationSuccessBottomSheet(),
//               ).then((_) => _clearRegistrationPrefs());
//       });
//     }
//   }

//   void _clearRegistrationPrefs() {
//     Get.find<HomeController>().saveRegistrationSuccessfulSharedPref(false);
//     Get.find<HomeController>().saveIsStoreRegistrationSharedPref(false);
//     setState(() {});
//   }

//   Future<void> suggestAddressBottomSheet() async {
//     active = await Get.find<LocationController>().checkLocationActive();
//     if (widget.fromSplash &&
//         Get.find<LocationController>().showLocationSuggestion &&
//         active) {
//       Timer(const Duration(seconds: 1), () {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           backgroundColor: Colors.transparent,
//           builder: (_) => const AddressBottomSheetWidget(),
//         ).then((_) {
//           Get.find<LocationController>().hideSuggestedLocation();
//           setState(() {});
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
//     return GetBuilder<SplashController>(builder: (splashController) {
//       return PopScope(
//         canPop: false,
//         onPopInvoked: (_) async => _handleBackPress(),
//         child: GetBuilder<OrderController>(
//           builder: (orderController) {
//             List<OrderModel> runningOrders =
//                 orderController.runningOrderModel?.orders ?? [];
//             List<OrderModel> reversedOrders = List.from(runningOrders.reversed);

//             return Scaffold(
//               key: _scaffoldKey,
//               body: ExpandableBottomSheet(
//                 background: _buildPageView(),
//                 persistentContentHeight: _calculatePersistentHeight(),
//                 onIsContractedCallback: () {
//                   if (!orderController.showOneOrder) {
//                     orderController.showOrders();
//                   }
//                 },
//                 onIsExtendedCallback: () {
//                   if (orderController.showOneOrder) {
//                     orderController.showOrders();
//                   }
//                 },
//                 expandableContent: _buildExpandableContent(orderController, reversedOrders),
//               ),
//             );
//           },
//         ),
//       );
//     });
//   }

//   Widget _buildPageView() {
//     return Stack(
//       children: [
//         PageView.builder(
//           controller: _pageController,
//           itemCount: _screens.length,
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) => _screens[index],
//         ),

//              _buildBottomNav()

//         ,
//       ],
//     );
//   }

//   double _calculatePersistentHeight() {
//     return (widget.fromSplash &&
//             Get.find<LocationController>().showLocationSuggestion &&
//             active)
//         ? 0
//         : GetPlatform.isIOS
//             ? 110
//             : 100;
//   }

//   Widget _buildExpandableContent(OrderController orderController, List<OrderModel> reversedOrders) {
//     if (widget.fromSplash &&
//         Get.find<LocationController>().showLocationSuggestion &&
//         active &&
//         !ResponsiveHelper.isDesktop(context)) {
//       return const SizedBox();
//     } else if (!ResponsiveHelper.isDesktop(context) &&
//         _isLogin &&
//         orderController.runningOrderModel?.orders?.isNotEmpty == true &&
//         orderController.showBottomSheet) {
//       return Dismissible(
//         key: UniqueKey(),
//         onDismissed: (_) {
//           if (orderController.showBottomSheet) {
//             orderController.showRunningOrders();
//           }
//         },
//         child: RunningOrderViewWidget(
//           reversOrder: reversedOrders,
//           onOrderTap: () {
//             setPage(3);
//             if (orderController.showBottomSheet) {
//               orderController.showRunningOrders();
//             }
//           },
//         ),
//       );
//     } else {
//       return const SizedBox();
//     }
//   }

//   Widget _buildBottomNav() {
//     final Size size = MediaQuery.of(context).size;
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: GetBuilder<SplashController>(
//         builder: (splashController) {
//           bool isParcel = splashController.module != null &&
//               splashController.configModel!.moduleConfig!.module!.isParcel!;

//           return Obx(() {
//               return  Get.find<SplashController>().showBottomSheet.value ? Container(
//                 width: size.width,
//                 height: GetPlatform.isIOS ? 80 : 55,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   boxShadow: const [
//                     BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     BottomNavItemWidget(

//                       title: 'home'.tr,
//                       selectedIcon:
//                        "assets/svgs/svg logo big.svg"
//                        ,
//                       unSelectedIcon: "assets/svgs/homeun.svg",
//                       isSelected: _pageIndex == 0 && splashController.module == null,
//                       onTap: () {
//                         splashController.removeModule();
//                         setPage(0);
//                       },
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 11),
//                       child: VerticalDivider(
//                         width: 10,
//                         color: Color(0xFF818181),
//                       ),
//                     ),
//                     BottomNavItemWidget(
//                       isfood: true,
//                       title: 'Food'.tr,
//                       selectedIcon: "assets/svgs/food.svg",
//                       unSelectedIcon: "assets/svgs/food.svg",
//                       isSelected: _pageIndex == 1,
//                       onTap: () {
//                         splashController.switchModule(0, true);
//                         Get.find<StoreController>().resetStoreData();
//                         setPage(1);
//                       },
//                     ),
//                     // BottomNavItemWidget(
//                     //   title: 'Uolomart'.tr,
//                     //   selectedIcon: "assets/svgs/martsl.svg",
//                     //   unSelectedIcon: "assets/svgs/martun.svg",
//                     //   isSelected: _pageIndex == 2,
//                     //   onTap: () {
//                     //     splashController.switchModule(1, true);
//                     //     Get.put(const DashboardScreen(pageIndex: 2));
//                     //     setPage(2);
//                     //   },
//                     // ),
//                     BottomNavItemWidget(
//                       title: isParcel ? 'address'.tr : 'EatList'.tr,
//                       selectedIcon:
//                           isParcel ? Images.addressSelect : "assets/svgs/wishsl.svg",
//                       unSelectedIcon:
//                           isParcel ? Images.addressUnselect : "assets/svgs/wishun.svg",
//                       isSelected: _pageIndex == 3,
//                       onTap: () => setPage(3),
//                     ),
//                     BottomNavItemWidget(
//                       title: 'orders'.tr,
//                       selectedIcon: "assets/svgs/ordersl.svg",
//                       unSelectedIcon: "assets/svgs/orderun.svg",
//                       isSelected: _pageIndex == 4,
//                       onTap: () => setPage(4),
//                     ),
//                   ],
//                 ),
//               ) : SizedBox();
//             }
//           );
//         },
//       ),
//     );
//   }

//   Future<void> _handleBackPress() async {
//     if (_pageIndex != 0) {
//       setPage(1);
//     } else {
//       if (!ResponsiveHelper.isDesktop(context) &&
//           Get.find<SplashController>().module != null &&
//           Get.find<SplashController>().configModel!.module == null) {
//         Get.find<SplashController>().setModule(null);
//         Get.find<StoreController>().resetStoreData();
//       } else {
//         if (_canExit) {
//           if (GetPlatform.isAndroid) {
//             SystemNavigator.pop();
//           } else if (GetPlatform.isIOS) {
//             exit(0);
//           }

//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(

//             content: Text('back_press_again_to_exit'.tr,
//                 style: const TextStyle(color: Colors.white)),

//             behavior: SnackBarBehavior.floating,
//             backgroundColor: Colors.green,
//             duration: const Duration(seconds: 2),
//             margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//           ));
//           _canExit = true;
//           Timer(const Duration(seconds: 2), () {
//             _canExit = false;
//           });
//         }
//       }
//     }
//   }

//   void setPage(int pageIndex) {
//     setState(() {
//       _pageController.jumpToPage(pageIndex);
//       _pageIndex = pageIndex;
//     });
//   }

//   Widget trackView(BuildContext context, {required bool status}) {
//     return Container(
//       height: 3,
//       decoration: BoxDecoration(
//         color: status
//             ? Theme.of(context).primaryColor
//             : Theme.of(context).disabledColor.withOpacity(0.5),
//         borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//       ),
//     );
//   }
// }

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  final bool fromSplash;
  const DashboardScreen(
      {super.key, required this.pageIndex, this.fromSplash = false});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  DateTime? _lastBackPressTime;

  GlobalKey<ExpandableBottomSheetState> key = GlobalKey();

  late bool _isLogin;
  bool active = false;

  @override
  void initState() {
    super.initState();

    _isLogin = AuthHelper.isLoggedIn();

    _showRegistrationSuccessBottomSheet();

    if (_isLogin) {
      if (Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 &&
          Get.find<AuthController>().getEarningPint().isNotEmpty &&
          !ResponsiveHelper.isDesktop(Get.context)) {
        Future.delayed(
          const Duration(seconds: 1),
          () => showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.6),
            builder: (BuildContext context) {
              return const CongratulationDialogue();
            },
          ),
        );
      }
      suggestAddressBottomSheet();
      Get.find<OrderController>().getRunningOrders(1, fromDashboard: true);
    }

    _pageIndex = widget.pageIndex;
    _pageController = PageController(initialPage: widget.pageIndex);

    _screens = [
      const HomeScreen(),
      const HomeScreen(),
      const FavouriteScreen(),
      const OrderScreen(),
    ];
  }

  _showRegistrationSuccessBottomSheet() {
    bool canShowBottomSheet =
        Get.find<HomeController>().getRegistrationSuccessfulSharedPref();
    if (canShowBottomSheet) {
      Future.delayed(const Duration(seconds: 1), () {
        ResponsiveHelper.isDesktop(Get.context)
            ? Get.dialog(
                    const Dialog(child: StoreRegistrationSuccessBottomSheet()))
                .then((value) {
                Get.find<HomeController>()
                    .saveRegistrationSuccessfulSharedPref(false);
                Get.find<HomeController>()
                    .saveIsStoreRegistrationSharedPref(false);
                setState(() {});
              })
            : showModalBottomSheet(
                context: Get.context!,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (con) => const StoreRegistrationSuccessBottomSheet(),
              ).then((value) {
                Get.find<HomeController>()
                    .saveRegistrationSuccessfulSharedPref(false);
                Get.find<HomeController>()
                    .saveIsStoreRegistrationSharedPref(false);
                setState(() {});
              });
      });
    }
  }

  Future<void> suggestAddressBottomSheet() async {
    active = await Get.find<LocationController>().checkLocationActive();
    if (widget.fromSplash &&
        Get.find<LocationController>().showLocationSuggestion) {
      Future.delayed(const Duration(seconds: 1), () {
        showModalBottomSheet(
          context: Get.context!,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (con) => const AddressBottomSheetWidget(),
        ).then((value) {
          Get.find<LocationController>().hideSuggestedLocation();
          setState(() {});
        });
      });
    }
  }

  Future<bool> _onWillPop() async {
    debugPrint('🔙 Back pressed | Current Page Index: $_pageIndex');

    // If not on home page, go to home
    if (_pageIndex != 0) {
      debugPrint('📍 Not on home. Going to home page...');
      _setPage(0);
      return false;
    }

    debugPrint('✅ Already on home page');

    // Check if module needs to be reset
    if (!ResponsiveHelper.isDesktop(context) &&
        Get.find<SplashController>().module != null &&
        Get.find<SplashController>().configModel!.module == null) {
      debugPrint('🔄 Resetting module...');
      Get.find<SplashController>().setModule(null);
      Get.find<StoreController>().resetStoreData();
      return false;
    }

    // Direct exit without double tap from home screen
    debugPrint('🚪 Closing app from home screen');
    _showExitDialog();
    return false;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      ),
    );
  }

  Future<void> _showExitDialog() async {
    debugPrint('📋 Exit dialog shown');
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bottomSheetContext) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  spreadRadius: 5,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  24,
                  32,
                  24,
                  24 + MediaQuery.of(context).viewPadding.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle bar
                    Container(
                      width: 48,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Animated Icon with gradient background
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.15),
                            Theme.of(context).primaryColor.withOpacity(0.08),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        CupertinoIcons.square_arrow_right,
                        color: Theme.of(context).primaryColor,
                        size: 44,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      'exit_app'.tr ?? 'Exit App',
                      style: robotoMedium.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    // Subtitle
                    Text(
                      'are_you_sure_exit'.tr ??
                          'Are you sure you want to exit the app? Any unsaved changes will be lost.',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Buttons
                    Column(
                      children: [
                        // Yes Button (Primary)
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('✅ App closing...');
                              Navigator.of(bottomSheetContext).pop();
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                if (GetPlatform.isAndroid) {
                                  SystemNavigator.pop();
                                } else if (GetPlatform.isIOS) {
                                  exit(0);
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              shadowColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                            ),
                            child: Text(
                              'yes'.tr ?? 'Yes, Exit',
                              style: robotoMedium.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // No Button (Secondary)
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              debugPrint('❌ Exit cancelled');
                              Navigator.of(bottomSheetContext).pop();
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              'no'.tr ?? 'Cancel',
                              style: robotoMedium.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return GetBuilder<SplashController>(builder: (splashController) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: GetBuilder<OrderController>(builder: (orderController) {
          List<OrderModel> runningOrder =
              orderController.runningOrderModel != null
                  ? orderController.runningOrderModel!.orders!
                  : [];
          List<OrderModel> reversOrder = List.from(runningOrder.reversed);

          return Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
              bottom: true,
              top: false,
              child: ExpandableBottomSheet(
                background: Stack(children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _screens.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _screens[index];
                    },
                  ),
                  ResponsiveHelper.isDesktop(context) || keyboardVisible
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: GetBuilder<SplashController>(
                              builder: (splashController) {
                            bool isParcel = splashController.module != null &&
                                splashController.configModel!.moduleConfig!
                                    .module!.isParcel!;

                            _screens = [
                              const HomeScreen(),
                              const HomeScreen(),
                              const FavouriteScreen(),
                              OrderScreen(),
                            ];

                            return Obx(() {
                              return !splashController.showBottomSheet.value
                                  ? const SizedBox()
                                  : Container(
                                      width: size.width,
                                      height: GetPlatform.isIOS ? 80 : 55,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                          )
                                        ],
                                      ),
                                      child: Stack(children: [
                                        ResponsiveHelper.isDesktop(context)
                                            ? const SizedBox()
                                            : (widget.fromSplash &&
                                                    Get.find<
                                                            LocationController>()
                                                        .showLocationSuggestion &&
                                                    active)
                                                ? const SizedBox()
                                                : (orderController
                                                            .showBottomSheet &&
                                                        orderController
                                                                .runningOrderModel !=
                                                            null &&
                                                        orderController
                                                            .runningOrderModel!
                                                            .orders!
                                                            .isNotEmpty &&
                                                        _isLogin)
                                                    ? const SizedBox()
                                                    : Center(
                                                        child: SizedBox(
                                                          width: size.width,
                                                          height: 80,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              BottomNavItemWidget(
                                                                title:
                                                                    'home'.tr,
                                                                selectedIcon:
                                                                    "assets/svgs/svg logo big.svg",
                                                                unSelectedIcon:
                                                                    "assets/svgs/homeun.svg",
                                                                isSelected: _pageIndex ==
                                                                        0 &&
                                                                    splashController
                                                                            .module ==
                                                                        null,
                                                                onTap: () {
                                                                  splashController
                                                                      .removeModule();
                                                                  _setPage(0);
                                                                },
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            11),
                                                                child:
                                                                    VerticalDivider(
                                                                  width: 10,
                                                                  color: Color(
                                                                      0xFF818181),
                                                                ),
                                                              ),
                                                              BottomNavItemWidget(
                                                                isfood: true,
                                                                title:
                                                                    'Food'.tr,
                                                                selectedIcon:
                                                                    "assets/svgs/food.svg",
                                                                unSelectedIcon:
                                                                    "assets/svgs/food.svg",
                                                                isSelected:
                                                                    _pageIndex ==
                                                                        1,
                                                                onTap: () {
                                                                  splashController
                                                                      .switchModule(
                                                                          0,
                                                                          true);
                                                                  Get.find<
                                                                          StoreController>()
                                                                      .resetStoreData();
                                                                  _setPage(1);
                                                                },
                                                              ),
                                                              BottomNavItemWidget(
                                                                title: isParcel
                                                                    ? 'address'
                                                                        .tr
                                                                    : 'EatList'
                                                                        .tr,
                                                                selectedIcon: isParcel
                                                                    ? Images
                                                                        .addressSelect
                                                                    : "assets/svgs/wishsl.svg",
                                                                unSelectedIcon: isParcel
                                                                    ? Images
                                                                        .addressUnselect
                                                                    : "assets/svgs/wishun.svg",
                                                                isSelected:
                                                                    _pageIndex ==
                                                                        2,
                                                                onTap: () =>
                                                                    _setPage(2),
                                                              ),
                                                              BottomNavItemWidget(
                                                                title:
                                                                    'orders'.tr,
                                                                selectedIcon:
                                                                    "assets/svgs/ordersl.svg",
                                                                unSelectedIcon:
                                                                    "assets/svgs/orderun.svg",
                                                                isSelected:
                                                                    _pageIndex ==
                                                                        3,
                                                                onTap: () =>
                                                                    _setPage(3),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                      ]),
                                    );
                            });
                          }),
                        ),
                ]),
                persistentContentHeight: (widget.fromSplash &&
                        Get.find<LocationController>().showLocationSuggestion &&
                        active)
                    ? 0
                    : GetPlatform.isIOS
                        ? 110
                        : 100,
                onIsContractedCallback: () {
                  if (!orderController.showOneOrder) {
                    orderController.showOrders();
                  }
                },
                onIsExtendedCallback: () {
                  if (orderController.showOneOrder) {
                    orderController.showOrders();
                  }
                },
                enableToggle: true,
                expandableContent: (widget.fromSplash &&
                        Get.find<LocationController>().showLocationSuggestion &&
                        active &&
                        !ResponsiveHelper.isDesktop(context))
                    ? const SizedBox()
                    : (ResponsiveHelper.isDesktop(context) ||
                            !_isLogin ||
                            orderController.runningOrderModel == null ||
                            orderController
                                .runningOrderModel!.orders!.isEmpty ||
                            !orderController.showBottomSheet)
                        ? const SizedBox()
                        : Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              if (orderController.showBottomSheet) {
                                orderController.showRunningOrders();
                              }
                            },
                            child: RunningOrderViewWidget(
                                reversOrder: reversOrder,
                                onOrderTap: () {
                                  _setPage(3);
                                  if (orderController.showBottomSheet) {
                                    orderController.showRunningOrders();
                                  }
                                }),
                          ),
              ),
            ),
          );
        }),
      );
    });
  }

  void _setPage(int pageIndex) {
    debugPrint('🔄 Navigating to page: $pageIndex');
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
    debugPrint('✅ Page changed to: $pageIndex');
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
