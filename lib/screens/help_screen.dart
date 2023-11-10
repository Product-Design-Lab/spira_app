import 'package:flutter/material.dart';

import 'package:spira/constants.dart';
import 'package:spira/widgets/list_item.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: AppColors.labelPrimary,
          ),
          backgroundColor: AppColors.background,
          shadowColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Help Guide",
                        style: TextStyles.title,
                      ),
                    ),
                    ListItem(
                        title: "Circular Breathing",
                        description: "Learn to perform circular breathing",
                        onPressed: () => {},
                        foregroundColor: AppColors.greyForeground,
                        backgroundColor: AppColors.greyBackground),
                    ListItem(
                        title: "Getting Started",
                        description: "Learn to use the app and device",
                        onPressed: () => {},
                        foregroundColor: AppColors.greyForeground,
                        backgroundColor: AppColors.greyBackground),
                    ListItem(
                        title: "Getting Started (No App)",
                        description: "Learn to use your device",
                        onPressed: () => {},
                        foregroundColor: AppColors.greyForeground,
                        backgroundColor: AppColors.greyBackground),
                    ListItem(
                        title: "Charging",
                        description: "How to charge your device",
                        onPressed: () => {},
                        foregroundColor: AppColors.greyForeground,
                        backgroundColor: AppColors.greyBackground),
                    ListItem(
                        title: "Changing Mouthpiece",
                        description: "Learn to replace the mouthpiece",
                        onPressed: () => {},
                        foregroundColor: AppColors.greyForeground,
                        backgroundColor: AppColors.greyBackground),
                  ],
                ))));
  }
}
