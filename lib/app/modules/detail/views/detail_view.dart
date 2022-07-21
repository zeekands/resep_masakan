import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Resep"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: controller.detail.gambar ?? "",
                height: 300.h,
                width: 1.sw,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            20.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${controller.detail.nama}',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.verticalSpace,
                Text(
                  '${controller.detail.deskripsi}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[400],
                  ),
                ),
                20.verticalSpace,
                Text(
                  'Bahan',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  '${controller.detail.bahan}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[400],
                  ),
                ),
                20.verticalSpace,
                Text(
                  'Langkah',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                20.verticalSpace,
                Text(
                  '${controller.detail.langkah}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 20.w),
          ],
        ),
      ),
    );
  }
}
