import 'package:bzsmart/screens/Home/Provider/homeProvder.dart';
import 'package:bzsmart/screens/Home/homeScreen.dart';
import 'package:bzsmart/screens/cart/cartScreen.dart';
import 'package:bzsmart/screens/cart/provider/cardProvider.dart';
import 'package:bzsmart/screens/favorites/favoritesScreen.dart';
import 'package:bzsmart/screens/favorites/provider/favoriteProvider.dart';
import 'package:bzsmart/screens/lang/Provider/langProvder.dart';
import 'package:bzsmart/screens/lang/langScreen.dart';
import 'package:bzsmart/screens/log%20in/loginScreen.dart';
import 'package:bzsmart/screens/log%20in/provider/loginProvider.dart';
import 'package:bzsmart/screens/map/mapScreen.dart';
import 'package:bzsmart/screens/map/provider/mapProvider.dart';
import 'package:bzsmart/screens/navigation/navigationScreen.dart';
import 'package:bzsmart/screens/navigation/provider/navigationProvider.dart';
import 'package:bzsmart/screens/onboarding/onboardingScreen.dart';
import 'package:bzsmart/screens/onboarding/provider/onboaridngProvider.dart';
import 'package:bzsmart/screens/profile/profileScreen.dart';
import 'package:bzsmart/screens/profile/provider/profileProvider.dart';
import 'package:bzsmart/screens/register/Provider/registerProvider.dart';
import 'package:bzsmart/screens/register/registerScreen.dart';
import 'package:bzsmart/screens/register/widgets/completeProfile.dart';
import 'package:bzsmart/screens/splash/provider/splashProvider.dart';
import 'package:bzsmart/screens/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routes/routes.dart';
import 'generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        final sharedPreferences = snapshot.data;
        final savedLanguage = sharedPreferences?.getString('lang');

        Locale defaultLocale;
        if (savedLanguage != null &&
            S.delegate.isSupported(Locale(savedLanguage))) {
          defaultLocale = Locale(savedLanguage);
        } else {
          defaultLocale = WidgetsBinding.instance.window.locale;
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<SplashProvider>(
                create: (context) => SplashProvider()),
            ChangeNotifierProvider<OnboaridngProvider>(
                create: (context) => OnboaridngProvider()),
            ChangeNotifierProvider<LangProvider>(
                create: (context) => LangProvider()..fillRadioList(context)),
            ChangeNotifierProvider<LoginProvider>(
                create: (context) => LoginProvider()..initState()),
            ChangeNotifierProvider<RegisterProvider>(
                create: (context) => RegisterProvider()),
            ChangeNotifierProvider<NavigationProvider>(
                create: (context) => NavigationProvider()..init()),
            ChangeNotifierProvider<HomeProvider>(
                create: (context) => HomeProvider()..init()),
            ChangeNotifierProvider<FavoriteProvider>(
                create: (context) => FavoriteProvider()),
            ChangeNotifierProvider<CartProvider>(
                create: (context) => CartProvider()),
            ChangeNotifierProvider<MapProvider>(
                create: (context) => MapProvider()),
            ChangeNotifierProvider<ProfileProvider>(
                create: (context) => ProfileProvider()),
          ],
          child: Builder(builder: (context) {
            context.read<LangProvider>().getLang();
            return MaterialApp(
              // locale: defaultLocale,
              locale: context.watch<LangProvider>().state.lang == ""
                  ? defaultLocale
                  : Locale(context.watch<LangProvider>().state.lang),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              routes: {
                // Routes.init: (context) =>  const HomeScreen(),
                Routes.init: (context) =>  const SplashScreen(),
                Routes.lang: (context) => const LangScreen(),
                Routes.onboarding: (context) => const OnboardingScreen(),
                Routes.home: (context) => const HomeScreen(),
                Routes.login: (context) => const LoginScreen(),
                Routes.createAccount: (context) => const RegisterScreen(),
                Routes.favorites: (context) => const FavoritesScreen(),
                Routes.profile: (context) => const ProfileScreen(),
                Routes.navigation: (context) => const NavigationScreen(),
                Routes.map: (context) => const MapScreen(),
                Routes.card: (context) => const CartScreen(),
                Routes.completeProfile: (context) => const CompleteProfile(),
              },
            );
          }),
        );
      },
    );
  }
}
