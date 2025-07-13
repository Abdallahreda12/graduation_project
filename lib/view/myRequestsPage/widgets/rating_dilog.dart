import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/data/models/appointment_model.dart';

class RatingDialog extends StatefulWidget {
  final AppointmentModel appointment;
  final Function(double rating) onRatingSubmitted;

  const RatingDialog({
    Key? key,
    required this.appointment,
    required this.onRatingSubmitted,
  }) : super(key: key);

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _rating = 0.0;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rate Your Experience',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            
            SizedBox(height: 16),
            
            // Doctor info
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.local_hospital,
                    color: ColorsApp.primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. ${widget.appointment.doctorFullName}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.appointment.clinicName,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Rating stars
            Text(
              'How would you rate your experience?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            
            SizedBox(height: 12),
            
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _rating = index + 1.0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        index < _rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 36,
                      ),
                    ),
                  );
                }),
              ),
            ),
            
            SizedBox(height: 16),
            
            // // Rating text
            // if (_rating > 0)
            //   Center(
            //     child: Text(
            //       _getRatingText(_rating),
            //       style: TextStyle(
            //         fontSize: 14,
            //         color: Colors.grey[600],
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ),
            
            SizedBox(height: 20),
            
            // Comment section (optional)
            Text(
              'Additional Comments (Optional)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            
            SizedBox(height: 8),
            
            TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Share your experience...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: ColorsApp.primaryColor),
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[400]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _rating > 0 ? () {
                      widget.onRatingSubmitted(_rating);
                      Navigator.of(context).pop();
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('Submit Rating'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}