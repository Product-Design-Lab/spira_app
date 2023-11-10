import 'package:flutter/material.dart';

import 'package:spira/constants/colors.dart';
import 'package:spira/constants/text_styles.dart';

import 'package:spira/model/article.dart';
import 'package:spira/screens/article_screen.dart';

import 'package:spira/widgets/base.dart';
import 'package:spira/widgets/list_item.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
        showBackButton: true,
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: HelpArticles.articles
                  .map((article) => ListItem(
                      title: article.title,
                      description: article.description,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleScreen(
                                    article: article,
                                  ))),
                      foregroundColor: AppColors.greyForeground,
                      backgroundColor: AppColors.greyBackground))
                  .toList(),
            )
          ],
        ));
  }
}
