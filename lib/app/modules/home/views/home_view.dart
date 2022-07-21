import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:resep_masakan/app/data/data/resep.dart';
import 'package:resep_masakan/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                20.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resep Makanan',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mudah dan Praktis',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          color: Colors.grey[400]),
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 20.w),
            20.verticalSpace,
            Text(
              'Temukan Resep Makanan',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                fontWeight: FontWeight.bold,
              ),
            ).paddingSymmetric(horizontal: 20.w),
            Flexible(
              child: StreamBuilder<List<Resep>>(
                  stream: controller.readResep(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10.h,
                        crossAxisCount: 2,
                        childAspectRatio: .7,
                      ),
                      itemBuilder: (_, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(
                              Routes.DETAIL,
                              arguments: snapshot.data![index],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data?[index].gambar ?? "",
                                height: 230.h,
                                width: 200.w,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          10.verticalSpace,
                          Text(
                            snapshot.data?[index].nama ?? "",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      itemCount: snapshot.data?.length,
                    ).paddingSymmetric(vertical: 20.h, horizontal: 10.w);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
