// Integration with AsyncValueWidget for easy UI consumption

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget to simplify handling async states in the UI
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value, 
    required this.data, 
    super.key,
    this.loading,
    this.error,
    this.onRetry,
    this.isEmpty,
    this.emptyWidget,
  });

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget Function()? loading;
  final Widget Function(Object, StackTrace?, VoidCallback?)? error;
  final VoidCallback? onRetry;
  final bool Function(T)? isEmpty;
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (value) {
        if (isEmpty != null && isEmpty!(value)) {
          return emptyWidget ?? const Center(child: Text('No data available'));
        }
        return data(value);
      },
      loading: loading ?? () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => this.error != null
          ? this.error!(error, stackTrace, onRetry)
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Error: $error'),
                  if (onRetry != null)
                    ElevatedButton(
                      onPressed: onRetry,
                      child: const Text('Retry'),
                    ),
                ],
              ),
            ),
    );
  }
}
