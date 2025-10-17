import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';

class DefaultListenerNotifier {
  final DefaultChangeNotifier changeNotifier;
  VoidCallback? _listener;

  DefaultListenerNotifier({required this.changeNotifier});

  void listener({
    required BuildContext context,
    required SuccessVoidCallback successCallback,
    EverCallback? everCallback,
    ErrorVoidCallback? errorCallback,
  }) {
    // Remove existing listener to prevent duplicates
    dispose();

    _listener = () {
      if (everCallback != null) {
        everCallback(changeNotifier, this);
      }
      if (changeNotifier.isLoading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }

      if (changeNotifier.hasError) {
        errorCallback?.call(changeNotifier, this);
        Messages.of(context).showError(changeNotifier.error ?? 'Erro interno');
      } else if (changeNotifier.isSuccess) {
        successCallback(changeNotifier, this);
      }
    };

    changeNotifier.addListener(_listener!);
  }

  void dispose() {
    if (_listener != null) {
      changeNotifier.removeListener(_listener!);
      _listener = null;
    }
  }
}

typedef SuccessVoidCallback =
    void Function(
      DefaultChangeNotifier notifier,
      DefaultListenerNotifier listenerInstance,
    );

typedef ErrorVoidCallback =
    void Function(
      DefaultChangeNotifier notifier,
      DefaultListenerNotifier listenerInstance,
    );

typedef EverCallback =
    void Function(
      DefaultChangeNotifier notifier,
      DefaultListenerNotifier listenerInstance,
    );
