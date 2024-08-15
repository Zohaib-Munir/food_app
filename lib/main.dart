import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/riverpod/provider.dart';
import 'package:food_app/widgets/custom_card_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0XFFC75B7A),
          centerTitle: true,
          title: Text(
            "Async Notifier",
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final asyncValue = ref.watch(appStateNotifierPovider);
            return asyncValue.when(
              data: (meal) => ListView.builder(
                itemCount: meal.categories.length,
                itemBuilder: (context, index) {
                  final cat = meal.categories[index];
                  return CardView(
                    imageUrl: cat.strCategoryThumb,
                    category: cat.strCategory,
                    categoryDes: cat.strCategoryDescription,
                  );
                },
              ),
              error: (error, stack) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
