import 'package:flutter/material.dart';

class OnlineToggle extends StatelessWidget {
  final bool isOnline;
  final VoidCallback onToggle;
  final bool isLoading;

  const OnlineToggle({
    Key? key, 
    required this.isOnline, 
    required this.onToggle,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DEBUG: Building OnlineToggle with isOnline=$isOnline, isLoading=$isLoading");
    
    return Center(
      child: TextButton(
        onPressed: isLoading ? null : () {
          print("DEBUG: OnlineToggle button pressed, current state: $isOnline");
          onToggle();
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(
              color: isOnline ? Colors.green.shade400 : Colors.grey.shade400,
              width: 2.0,
            ),
          ),
          backgroundColor:
              isOnline ? Colors.green.shade100 : Colors.grey.shade100,
          disabledBackgroundColor: Colors.grey.shade200,
        ),
        child: isLoading 
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: isOnline ? Colors.green.shade700 : Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Updating...',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isOnline ? Icons.check_circle : Icons.cancel,
                    color: isOnline ? Colors.green.shade700 : Colors.grey.shade700,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isOnline ? 'Online' : 'Offline',
                    style: TextStyle(
                      color: isOnline ? Colors.green.shade700 : Colors.grey.shade700,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
