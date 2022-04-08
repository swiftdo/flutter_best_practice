import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/toast_util.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: myRouter.defaultRouteParser(),
      routeInformationProvider: myRouter.routeInfoProvider(),
      routerDelegate: AutoRouterDelegate(
        myRouter,
        navigatorObservers: () => [AppRouteObserver()],
      ),
      builder: myToast.init(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
