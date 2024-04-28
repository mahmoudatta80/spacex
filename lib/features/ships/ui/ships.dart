import 'package:flutter/material.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/features/ships/ui/widgets/ship_container.dart';
import '../../../../../core/themes/text_styles.dart';

class ShipsScreen extends StatelessWidget {
  const ShipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkBlue,
        title: const Text('Ships', style: MyTextStyles.font25WhiteBoldW500),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: [
          shipContainer(context),
          shipContainer(context),
          shipContainer(context),
        ],
      ),
    );
  }
}
