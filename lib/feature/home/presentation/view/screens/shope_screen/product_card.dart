import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopescreen/core/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.name,
      required this.price,
      required this.oldPrice,
      required this.rating,
      required this.image});
  final String name;
  final String price;
  final String oldPrice;
  final String rating;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side:  BorderSide(
          color: AppColors.lightBlue,
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r)),
                child: Image.network(
                  image,
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Material(
                  elevation: 10.0, // Adjust the elevation as needed
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16.r,
                    child: Icon(Icons.favorite_outline_outlined,
                        color: AppColors.blue, size: 16.sp),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      'EGP $price',
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      oldPrice,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.lightBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      'Review ($rating)',
                      style: TextStyle(fontSize: 14.sp,color: AppColors.deepBlue),
                    ),
                    Icon(Icons.star, color: Colors.amber, size: 16.sp),
                    Spacer(),
                    CircleAvatar(
                        backgroundColor: AppColors.blue,
                        radius: 16.r,
                        child: Icon(Icons.add,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 25.sp)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
