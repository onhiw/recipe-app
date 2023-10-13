import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants/constant.dart';
import 'package:recipe_app/injection.dart' as di;
import 'package:recipe_app/presentation/bloc/category-bloc/category_bloc.dart';
import 'package:recipe_app/presentation/bloc/recipe-bloc/recipe_bloc.dart';
import 'package:recipe_app/presentation/pages/page_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<CategoryBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecipeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}
