import 'package:intl/intl.dart';

class TimeFormatter {
  static String formatMessageTime(String timestamp, {bool isJustSent = false}) {
    try {
      final messageTime = DateTime.parse(timestamp);
      final now = DateTime.now();
      final difference = now.difference(messageTime);

      // If message was just sent (less than 5 seconds ago)
      if (isJustSent || difference.inSeconds < 5) {
        return 'Just now';
      }
      
      // Less than 1 minute ago
      if (difference.inMinutes < 1) {
        return '${difference.inSeconds}s ago';
      }
      
      // Less than 1 hour ago
      if (difference.inHours < 1) {
        return '${difference.inMinutes}m ago';
      }
      
      // Same day
      if (isSameDay(messageTime, now)) {
        return DateFormat('h:mm a').format(messageTime); // 2:30 PM (no seconds)
      }
      
      // Yesterday
      if (isYesterday(messageTime, now)) {
        return 'Yesterday ${DateFormat('h:mm a').format(messageTime)}';
      }
      
      // This week
      if (difference.inDays < 7) {
        return DateFormat('EEE h:mm a').format(messageTime); // Mon 2:30 PM
      }
      
      // Older messages
      return DateFormat('MMM d, h:mm a').format(messageTime); // Jan 15, 2:30 PM
      
    } catch (e) {
      return timestamp; // Fallback to original timestamp
    }
  }

  static String formatChatTime(String timestamp) {
    try {
      final messageTime = DateTime.parse(timestamp);
      final now = DateTime.now();
      final difference = now.difference(messageTime);

      // Less than 1 minute ago
      if (difference.inMinutes < 1) {
        return 'now';
      }
      
      // Less than 1 hour ago
      if (difference.inHours < 1) {
        return '${difference.inMinutes}m';
      }
      
      // Same day - show time without seconds
      if (isSameDay(messageTime, now)) {
        return DateFormat('h:mm a').format(messageTime);
      }
      
      // Yesterday
      if (isYesterday(messageTime, now)) {
        return 'Yesterday';
      }
      
      // This week
      if (difference.inDays < 7) {
        return DateFormat('EEE').format(messageTime); // Mon, Tue, etc.
      }
      
      // Older messages
      return DateFormat('MMM d').format(messageTime); // Jan 15
      
    } catch (e) {
      return timestamp;
    }
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }

  static bool isYesterday(DateTime date, DateTime now) {
    final yesterday = now.subtract(Duration(days: 1));
    return date.year == yesterday.year &&
           date.month == yesterday.month &&
           date.day == yesterday.day;
  }

  static String getRelativeTime(String timestamp) {
    try {
      final messageTime = DateTime.parse(timestamp);
      final now = DateTime.now();
      final difference = now.difference(messageTime);

      if (difference.inSeconds < 30) {
        return 'Just now';
      } else if (difference.inMinutes < 1) {
        return '${difference.inSeconds}s ago';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes}m ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours}h ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d ago';
      } else {
        return DateFormat('MMM d').format(messageTime);
      }
    } catch (e) {
      return timestamp;
    }
  }
}