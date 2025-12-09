import 'package:flutter/material.dart';

class PersistentErrorWidget extends StatefulWidget {
  final String title;
  final String errMessage;
  final Future<void> Function() onRetry;
  final String retryText;
  final Widget? icon;
  final Color backgroundColor;
  final Color accentColor;
  final EdgeInsetsGeometry padding;

  const PersistentErrorWidget({
    super.key,
    this.title = "An Error Occurred",
    this.errMessage = "Something went wrong. Please try again later.",
    required this.onRetry,
    this.retryText = "Retry",
    this.icon,
    this.backgroundColor = Colors.white,
    this.accentColor = Colors.deepPurpleAccent,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  State<PersistentErrorWidget> createState() => _PersistentErrorWidgetState();
}

class _PersistentErrorWidgetState extends State<PersistentErrorWidget> {
  bool _isLoading = false;

  void _handleRetry() async {
    setState(() => _isLoading = true);
    try {
      await widget.onRetry();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 520),
        padding: widget.padding,
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null)
              SizedBox(height: 88, child: widget.icon)
            else
              Container(
                height: 88,
                width: 88,
                decoration: BoxDecoration(
                  color: widget.accentColor.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_outline,
                  size: 44,
                  color: widget.accentColor,
                ),
              ),
            const SizedBox(height: 18),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.errMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.black54,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 18),
            _isLoading
                ? const CircularProgressIndicator()
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: _handleRetry,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: widget.accentColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          widget.retryText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () => Navigator.maybePop(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Back",
                          style: TextStyle(fontWeight: FontWeight.w600),
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
