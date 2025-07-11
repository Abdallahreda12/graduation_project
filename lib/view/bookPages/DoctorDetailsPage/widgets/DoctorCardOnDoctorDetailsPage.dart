import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/doctor_model.dart';

class DoctorCardOnDoctorDetailsPage extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback? onMessageTap;
  final VoidCallback? onCallTap;

  const DoctorCardOnDoctorDetailsPage({
    super.key,
    required this.doctor,
    this.onMessageTap,
    this.onCallTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Color(0xffD4D4D4)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Profile Image
               ClipOval(
            child: doctor.usersPhotoUrl.isEmpty || doctor.usersPhotoUrl == "empty" || doctor.usersPhotoUrl == "failure"
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
                    imageUrl: "$linkServerImage${doctor.usersPhotoUrl}",
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
                // Name, Degree, Rating
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       "Dr.  ${doctor.fullName}",
                        style: AppStyles.urbanistSemiBold18(context),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        doctor.doctorsSpecialization,
                        style: AppStyles.urbanistReqular12(context),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            if (index < doctor.averageRating.floor()) {
                              return Icon(Icons.star, color: Colors.amber, size: 20);
                            } else if (index < doctor.averageRating.ceil() && doctor.averageRating % 1 != 0) {
                              return Icon(Icons.star_half, color: Colors.amber, size: 20);
                            } else {
                              return Icon(Icons.star_border, color: Colors.amber, size: 20);
                            }
                          }),
                          SizedBox(width: 5),
                          Text(
                            "${doctor.averageRating.toStringAsFixed(1)} Star",
                            style: AppStyles.urbanistReqular14(context)
                                .copyWith(color: Color(0xff909090)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: onMessageTap,
                child: Container(
                  height: 40,
                  width: MediaQuery.sizeOf(context).width / 2 - 50,
                  decoration: BoxDecoration(
                      color: Color(0xffF3AB21),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Message",
                        style: AppStyles.urbanistMedium14(context)
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: onCallTap,
                child: Container(
                  height: 40,
                  width: MediaQuery.sizeOf(context).width / 2 - 50,
                  decoration: BoxDecoration(
                      color: Color(0xff268AD6),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Call",
                        style: AppStyles.urbanistMedium14(context)
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}