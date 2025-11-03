import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stock_app/controllers/incoming_controller.dart';

import 'package:stock_app/controllers/outgoing_controller.dart';
import 'package:stock_app/core/constants/app_colors.dart';
import 'package:stock_app/core/constants/app_images.dart';
import 'package:stock_app/models/report_model.dart';
import 'package:stock_app/routes.dart';
import 'package:stock_app/widgets/custom_drawer.dart';
import 'package:stock_app/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.find<OutgoingController>().getOutgoingFromFireStore();
    Get.find<IncomingController>().getIncomingFromFireStore();
    // Get.find<CompanyInfoController>().getCompanyInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '37'.tr,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: base2Color,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .47,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              //scrollDirection: Axis.horizontal,
              //crossAxisCount: 2,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                      title: '38'.tr,
                      quantity: '100',
                      icon: Icons.production_quantity_limits,
                      onTap: () {
                        Get.toNamed(
                          Routes.ALLPRODUCTS,
                        );
                        //  Get.to(ListProducts());
                      },
                    ),
                    CustomContainer(
                      title: '39'.tr,
                      quantity: '100',
                      icon: Icons.category,
                      onTap: () {
                        Get.toNamed(Routes.CATEGORIES);
                      },
                    ),
                    CustomContainer(
                      title: '40'.tr,
                      quantity: '100',
                      icon: Icons.report,
                      onTap: () {
                        Get.toNamed(Routes.ALLRepoerts);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                      title: '41'.tr,
                      quantity: '100',
                      icon: Icons.get_app,
                      onTap: () {
                        Get.toNamed(Routes.Incoming);
                        // Get.to(Incoming());
                      },
                    ),
                    CustomContainer(
                      title: '42'.tr,
                      quantity: '100',
                      icon: Icons.outbox,
                      onTap: () {
                        Get.toNamed(Routes.Outgoing);
                      },
                    ),
                    CustomContainer(
                      title: '43'.tr,
                      quantity: '100',
                      icon: Icons.money,
                      onTap: () {
                        Get.toNamed(Routes.ListDebts);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                      title: '44'.tr,
                      quantity: '100',
                      icon: Icons.person_search_sharp,
                      onTap: () {
                        Get.toNamed(Routes.ALLCustomer);
                      },
                    ),
                    CustomContainer(
                      title: '45'.tr,
                      quantity: '100',
                      icon: Icons.people,
                      onTap: () {
                        Get.toNamed(Routes.ALLSuppliers);
                      },
                    ),
                    CustomContainer(
                      title: '46'.tr,
                      quantity: '100',
                      icon: Icons.attach_money,
                      onTap: () {
                        Get.toNamed(Routes.ALLExpenses);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '47'.tr,
                  style: TextStyle(
                    color: secondColor, //base2Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  '48'.tr,
                  style: TextStyle(
                    color: secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .33,
            // height: 310,
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 4.w),
            child: ListGoods(),
          ),
        ],
      ),
    );
  }
}

class ListGoods extends StatelessWidget {
  final controller = Get.find<OutgoingController>();
  ListGoods({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // controller.getOutgoingFromFireStore();
    return Obx(
      () => controller.bestSalesList.isEmpty
          ? Image.asset(
              ImagesAssets.empty,
              width: 200,
              height: 100,
            )
          : Padding(
              padding: EdgeInsets.only(right: 0.w, left: 0.w),

              // height: 320.h,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: controller.bestSalesList.length,
                itemBuilder: (context, index) {
                  Sales sales = controller.bestSalesList[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            height: 6.h,
                            // width: 50.w,
                            child: Image.asset(
                              cacheHeight: 95,
                              cacheWidth: 95,
                              sales.type.contains('49'.tr)
                                  ? ImagesAssets.bestProduct
                                  : ImagesAssets.profile,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 130,
                            child: CustomText(
                              text: '${sales.type} ',
                              alignment: Alignment.centerLeft,
                              // fontSize: 10.sp,
                              fontSize: 10.sp,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '\$${sales.totalSales / 1000} K',
                            fontSize: 10.sp,
                            maxLines: 2,
                          ),
                          const Icon(
                            Icons.arrow_drop_up,
                            size: 40,
                            color: Color.fromARGB(248, 5, 175, 11),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  final String quantity;
  final IconData icon;
  final void Function()? onTap;

  const CustomContainer({
    super.key,
    required this.title,
    required this.quantity,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * .27,
          height: MediaQuery.of(context).size.height * .14,
          // width: 84,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: base2Color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: base2Color,
                size: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  color: base2Color,
                  //color: Colors.white,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
