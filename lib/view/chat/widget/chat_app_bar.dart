
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project/controller/cocnversation_controller.dart';

// class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String userName;
//   final String userPhoto;
  
//   const ChatAppBar({
//     super.key,
//     required this.userName,
//     required this.userPhoto,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ConversationController>(
//       builder: (controller) {
//         return AppBar(
//           title: Row(
//             children: [
//               // User Profile Picture
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: CircleAvatar(
//                   radius: 20,
//                   child: userPhoto.isNotEmpty
//                       ? CachedNetworkImage(
//                           imageUrl: userPhoto,
//                           imageBuilder: (context, imageProvider) => Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               image: DecorationImage(
//                                 image: imageProvider,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           placeholder: (context, url) => CircularProgressIndicator(
//                             strokeWidth: 2,
//                           ),
//                           errorWidget: (context, url, error) => Icon(Icons.person),
//                         )
//                       : Icon(Icons.person),
//                 ),
//               ),
//               // User Name and Status
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       userName,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     if (controller.isTyping)
//                       Text(
//                         'typing...',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.green,
//                           fontStyle: FontStyle.italic,
//                         ),
//                       )
//                     else
//                       Row(
//                         children: [
//                           Container(
//                             width: 8,
//                             height: 8,
//                             decoration: BoxDecoration(
//                               color: controller.isOtherUserOnline 
//                                   ? Colors.green 
//                                   : Colors.grey,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             controller.isOtherUserOnline ? 'Online' : 'Offline',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.info_outline),
//               onPressed: () {
//                 // Show user info or conversation details
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }