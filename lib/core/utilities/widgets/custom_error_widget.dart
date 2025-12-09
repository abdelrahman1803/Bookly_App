import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  final String? errMessage;
  final VoidCallback? onRetry;
  final String retryText;
  final Widget? icon;
  final Color backgroundColor;
  final Color accentColor;
  final EdgeInsetsGeometry padding;

  const CustomErrorWidget({
    super.key,
    this.title = "An Error Occurred",
    required this.errMessage,
    this.onRetry,
    this.retryText = "Retry",
    this.icon,
    this.backgroundColor = const Color(0xFF2C2C2C),
    this.accentColor = Colors.deepPurpleAccent,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: double.infinity, // ياخد مساحة الشاشة كلها
      color: backgroundColor,
      alignment: Alignment.center,
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon or Image
          if (icon != null)
            SizedBox(height: 88, child: icon)
          else
            Container(
              height: 88,
              width: 88,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.error_outline, size: 44, color: accentColor),
            ),

          const SizedBox(height: 18),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          // Message
          Text(
            errMessage!,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.grey[300],
              height: 1.35,
            ),
          ),

          const SizedBox(height: 18),

          // Retry button only
          if (onRetry != null)
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: accentColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                retryText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
