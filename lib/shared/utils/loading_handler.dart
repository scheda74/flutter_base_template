import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingHandler {
  late BuildContext context;

  LoadingHandler.of(this.context);

  Future<void> startBlockingLoading() async {
    return await showDialog<void>(
      useRootNavigator: false,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        );
      },
    );
  }

  Future<void> stopBlockingLoading() async {
    if (context.canPop()) {
      context.pop();
    }
  }

  Future<void> showError(String errorMessage) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        content: Text(errorMessage),
      ),
    );
  }
}
