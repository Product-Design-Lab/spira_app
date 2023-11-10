import 'package:flutter/material.dart';

import 'package:spira/constants/colors.dart';
import 'package:spira/constants/text_styles.dart';
import 'package:spira/model/article.dart';

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
                    Column(
                      children: HelpArticles.articles
                          .map((article) => ListItem(
                              title: article.title,
                              description: article.description,
                              onPressed: () => {},
                              foregroundColor: AppColors.greyForeground,
                              backgroundColor: AppColors.greyBackground))
                          .toList(),
                    )
                  ],
                ))));
  }
}
