import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cartly/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cartly/daos/cart_dao.dart';
import 'package:cartly/views/home/home_screen.dart';
import 'package:provider/provider.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CartDAO(),
      child: MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('pt')],
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.robotoCondensedTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
