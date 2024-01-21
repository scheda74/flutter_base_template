import 'package:flutter/material.dart';
import 'package:flutter_base_template/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'localization/generated/app_localizations.dart';
import 'shared/providers/router/router_provider.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class AppEntry extends ConsumerStatefulWidget {
  const AppEntry({super.key});

  @override
  ConsumerState<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends ConsumerState<AppEntry> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      theme: createTheme(lightColorScheme), // themeMode: ThemeMode.light,
      darkTheme: createTheme(darkColorScheme), // themeMode: ThemeMode.dark
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        Intl.defaultLocale = locale?.toLanguageTag();
        return locale;
      },
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
