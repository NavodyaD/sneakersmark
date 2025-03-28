import 'package:flutter/material.dart';
import 'package:sneakersmark/presentation/home/widgets/categoris.dart';

import '../widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24,),
            SneakerCategories(),
            SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}
