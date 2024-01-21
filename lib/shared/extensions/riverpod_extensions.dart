import 'dart:async';

import 'package:oauth2/oauth2.dart';

typedef ApiCallShortcut<T> = Future<T> Function(
  String userId,
  Client apiClient,
);

// extension ProviderApiCall on Ref {
//   Future<T> apiCall<T>(ApiCallShortcut<T> call) async {
//     final userId = 'TODO: userId',
//     final apiClient = read(authClientProvider);

//     return await call(userId, apiClient);
//   }
// }

// extension WidgetApiCall on WidgetRef {
//   Future<T> apiCall<T>(ApiCallShortcut<T> call) async {

//     final userId = await read(userProvider.future);
//     final apiClient = read(apiClientProvider);

//     return await call(userId, apiClient);
//   }
// }

// /// An extension on [Ref] with helpful methods to add a debounce.
// extension RefDebounceExtension on Ref {
//   /// Delays an execution by a bit such that if a dependency changes multiple
//   /// time rapidly, the rest of the code is only run once.
//   Future<void> debounce(Duration duration) {
//     final completer = Completer<void>();
//     final timer = Timer(duration, () {
//       if (!completer.isCompleted) completer.complete();
//     });
//     onDispose(() {
//       timer.cancel();
//       if (!completer.isCompleted) {
//         completer.completeError(StateError('Cancelled'));
//       }
//     });
//     return completer.future;
//   }
// }
