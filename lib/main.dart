import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tetris/Utils/utils.dart';
import 'package:tetris/generated/l10n.dart';
import 'package:tetris/panel/main_menu.dart';
import 'package:tetris/panel/page_portrait.dart';
import 'package:tetris/provider/themes.dart';


void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  _disableDebugPrint();
  runApp(MyApp());
}

void _disableDebugPrint() {
  bool debug = false;
  assert(() {
    debug = true;
    return true;
  }());
  if (!debug) {
    debugPrint = (message, {wrapWidth}) {
      //disable log print when not in debug mode
    };
  }
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with WidgetsBindingObserver  {
  ThemeProvider themeChangeProvider = ThemeProvider();

  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    FontStyleUtils.platform=Theme.of(context).platform;
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.themeColor =
    await themeChangeProvider.themePreference.getThemeColor();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => themeChangeProvider),

        ],
        child: Consumer<ThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Themestyles.themeData(themeChangeProvider.themeColor, context),
              title: 'tetris',
              home:  MainMenu(),
              locale: _locale,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              navigatorObservers: [routeObserver],
              supportedLocales: S.delegate.supportedLocales,
            );
          },
        )
    );
  }
}

const SCREEN_BORDER_WIDTH = 0.5;

const BACKGROUND_COLOR = const Color(0xffffffff);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only Android/iOS support land mode
    bool land = MediaQuery.of(context).orientation == Orientation.landscape;
    return land ? PageLand() : PagePortrait();
  }
}
