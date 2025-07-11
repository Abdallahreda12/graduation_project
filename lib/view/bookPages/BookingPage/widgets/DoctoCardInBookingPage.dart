import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/doctor_model.dart';

class DoctorCardInBookingPage extends StatelessWidget {
  final DoctorModel doctorModel;

  const DoctorCardInBookingPage({ required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: const Color(0xffD4D4D4)),
      ),
      child: Row(
        children: [
           ClipOval(
            child: doctorModel.usersPhotoUrl.isEmpty || doctorModel.usersPhotoUrl == "empty" || doctorModel.usersPhotoUrl == "failure"
                ? Container(
                    width: 50,
                    height: 50,
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
                    imageUrl: "$linkServerImage${doctorModel.usersPhotoUrl}",
                    placeholder: (context, url) => SizedBox(
                      width: 35,
                      height: 35,
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 "Dr. ${doctorModel.fullName}",
                  style: AppStyles.urbanistSemiBold18(context),
                ),
                Text(
                  "${doctorModel.doctorsDegree}",
                  style: AppStyles.urbanistReqular12(context),
                ),
                const SizedBox(height: 4),
                _buildRatingStars(context, doctorModel.averageRating), // You can adjust rating logic here if needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(BuildContext context, double rating) {
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          Icon(
            i <= rating.floor()
                ? Icons.star
                : (i == rating.ceil() && rating % 1 > 0)
                    ? Icons.star_half
                    : Icons.star_border,
            color: Colors.amber,
            size: 20,
          ),
        const SizedBox(width: 5),
        Text(
          "$rating Star",
          style: AppStyles.urbanistReqular14(context)
              .copyWith(color: const Color(0xff909090)),
        ),
      ],
    );
  }
}
