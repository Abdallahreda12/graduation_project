import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard(
      {super.key,
      required this.photo,
      required this.name,
      required this.desciption,
      required this.stars});
  final String photo;
  final String name;
  final String desciption;
  final String stars;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: "$linkServerImage$photo",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              width: 100, // adjust as needed
              height: 100,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppStyles.urbanistSemiBold14(context)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                desciption,
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Color(0xffD9D9D9)),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesPetsAppBarIcon,
                    width: 18,
                    height: 18,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  Text(stars,
                      style: AppStyles.urbanistReqular12(context).copyWith(
                        color: Color(0xffD9D9D9),
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
