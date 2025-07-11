// import 'package:flutter/material.dart';

// // Communication Type Model
// class CommunicationType {
//   final int id;
//   final String name;
//   final String description;
//   final IconData icon;

//   CommunicationType({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.icon,
//   });
// }

// // Static Communication Types List
// class CommunicationTypes {
//   static List<CommunicationType> getCommunicationTypes() {
//     return [
//       CommunicationType(
//         id: 1,
//         name: "Messaging",
//         description: "Chat with doctor",
//         icon: Icons.message_outlined,
//       ),
//       CommunicationType(
//         id: 2,
//         name: "Voice Call",
//         description: "Voice call with doctor",
//         icon: Icons.phone_outlined,
//       ),
//       CommunicationType(
//         id: 3,
//         name: "Video Call",
//         description: "Video call with doctor",
//         icon: Icons.videocam_outlined,
//       ),
//       CommunicationType(
//         id: 4,
//         name: "Visit Clinic",
//         description: "Visit doctor clinic",
//         icon: Icons.local_hospital_outlined,
//       ),
//     ];
//   }

//   static CommunicationType? getById(int id) {
//     try {
//       return getCommunicationTypes().firstWhere((type) => type.id == id);
//     } catch (e) {
//       return null;
//     }
//   }

//   static CommunicationType? getByName(String name) {
//     try {
//       return getCommunicationTypes().firstWhere(
//         (type) => type.name.toLowerCase() == name.toLowerCase(),
//       );
//     } catch (e) {
//       return null;
//     }
//   }
// }

// // Enhanced Package Model with Communication Type
// class PackageModel {
//   final int id;
//   final String name;
//   final String description; // This will be the local description from CommunicationType
//   final double price;
//   final String clinicName;
//   final CommunicationType communicationType;

//   PackageModel({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.clinicName,
//     required this.communicationType,
//   });

//   factory PackageModel.fromJson(Map<String, dynamic> json, String clinicName) {
//     // Get communication type ID from API or default to Visit Clinic
//     final communicationTypeId = json['communication_type_id'] != null 
//         ? int.parse(json['communication_type_id'].toString()) 
//         : 4; // Default to Visit Clinic
        
//     final communicationType = CommunicationTypes.getById(communicationTypeId) 
//         ?? CommunicationTypes.getById(4)!; // Default to Visit Clinic

//     return PackageModel(
//       id: int.parse(json['package_id'].toString()),
//       name: json['packages_name'] ?? '',
//       description: communicationType.description, // Use local description
//       price: double.parse(json['packages_price'].toString()),
    
//       clinicName: clinicName,
//       communicationType: communicationType,
//     );
//   }
// }