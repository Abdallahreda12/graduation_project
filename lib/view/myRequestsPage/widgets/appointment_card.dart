import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/appointment_model.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;
  final VoidCallback? onRate;

  const AppointmentCard({
    Key? key,
    required this.appointment,
    this.onTap,
    this.onCancel,
    this.onRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with status and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getStatusColor(appointment.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getStatusIcon(appointment.status),
                            size: 14,
                            color: _getStatusColor(appointment.status),
                          ),
                          SizedBox(width: 4),
                          Text(
                            appointment.status.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _getStatusColor(appointment.status),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      appointment.formattedDate,
                      style: AppStyles.urbanistMedium14(context).copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 12),
                
                // Clinic and Doctor info
                Row(
                  children: [
                    Icon(
                      Icons.local_hospital,
                      size: 18,
                      color: ColorsApp.primaryColor,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment.clinicName,
                            style: AppStyles.urbanistMedium16(context),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Dr. ${appointment.doctorFullName}',
                            style: AppStyles.urbanistReqular12(context).copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 12),
                
                // Time and Animal info
                Row(
                  children: [
                    // Time
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 6),
                          Text(
                            appointment.formattedTime,
                            style: AppStyles.urbanistMedium14(context).copyWith(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Animal info
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.pets,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              '${appointment.animalGender}, ${appointment.animalAge} yrs',
                              style: AppStyles.urbanistMedium14(context).copyWith(
                                color: Colors.grey[700],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 12),
                
                // Owner name
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Owner: ${appointment.animalOwnerName}',
                        style: AppStyles.urbanistReqular14(context).copyWith(
                          color: Colors.grey[700],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                
                // Problem description (if not too long)
                if (appointment.problemDescription.isNotEmpty && 
                    appointment.problemDescription.length <= 100) ...[
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.description,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            appointment.problemDescription,
                            style: AppStyles.urbanistReqular12(context).copyWith(
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                
                // Rating display for completed appointments
                if (appointment.status.toLowerCase() == 'completed' && 
                    appointment.isRated && 
                    appointment.userRating != null) ...[
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'You rated this appointment',
                          style: AppStyles.urbanistMedium12(context).copyWith(
                            color: Colors.green[700],
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            ...List.generate(5, (index) {
                              return Icon(
                                index < appointment.userRating! ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                                size: 14,
                              );
                            }),
                            SizedBox(width: 4),
                            Text(
                              '${appointment.userRating}',
                              style: AppStyles.urbanistMedium12(context).copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                
                // Action buttons
                if (appointment.status.toLowerCase() == 'pending') ...[
                  SizedBox(height: 16),
                  Row(
                    children: [
                      if (onCancel != null) ...[
                        Expanded(
                          child: OutlinedButton(
                            onPressed: onCancel,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsApp.primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'View Details',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else if (appointment.status.toLowerCase() == 'completed') ...[
                  SizedBox(height: 16),
                  if (!appointment.isRated && onRate != null) ...[
                    // Show rate button if not rated
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: onRate,
                            icon: Icon(Icons.star_rate, size: 18),
                            label: Text('Rate Experience'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsApp.primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'View Details',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    // Show only view details if already rated
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'View Details',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ] else ...[
                  // For other statuses (confirmed, cancelled)
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'View Details',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Icons.schedule;
      case 'confirmed':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      case 'completed':
        return Icons.check_circle_outline;
      default:
        return Icons.help_outline;
    }
  }
}