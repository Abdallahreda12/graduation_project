import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/styles.dart';

class DoctoCardInBookingPage extends StatelessWidget {
  const DoctoCardInBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                  Assets.imagesDoctorImage), // Replace with your image path
            ),
            const SizedBox(width: 12),
            // Name, Degree, Rating
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Alexandera Poppins",
                    style: AppStyles.urbanistSemiBold18(context),
                  ),
                  Text("M.Sc. - Veterinary Surgery",
                      style: AppStyles.urbanistReqular12(context)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_half, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text("4.5 Star",
                          style: AppStyles.urbanistReqular14(context)
                              .copyWith(color: Color(0xff909090))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
