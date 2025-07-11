import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/doctor_model.dart';
// Import your doctor model here
// import 'package:graduation_project/models/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.photo,
    required this.name,
    required this.description,
    required this.stars,
    required this.doctorModel,
  });

  final String photo;
  final String name;
  final String description;
  final String stars;
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: ColorsApp.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Doctor Photo
          ClipOval(
            child: photo.isEmpty || photo == "empty" || photo == "failure"
                ? Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey.shade600,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: "$linkServerImage$photo",
                    placeholder: (context, url) => Container(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
          ),
          
          SizedBox(height: 10),
          
          // Doctor Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Name
              Text(
                name,
                style: AppStyles.urbanistSemiBold14(context)
                    .copyWith(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              SizedBox(height: 2),
              
              // Specialization
              Text(
                description,
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Color(0xffD9D9D9)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              SizedBox(height: 4),
              
              // Rating and Experience
              Row(
                children: [
                  // Star Rating
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                  SizedBox(width: 2),
                  Text(
                    stars,
                    style: AppStyles.urbanistReqular12(context).copyWith(
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                  SizedBox(width: 8),
                  // Experience
                  Text(
                    "${doctorModel.doctorsYearsExperience}y exp",
                    style: AppStyles.urbanistReqular12(context).copyWith(
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ],
              ),
              
              // Home Visit Badge (if available)
              if (doctorModel.isHomeVisitAvailable) ...[
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Home Visit",
                    style: AppStyles.urbanistReqular12(context).copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}