import 'package:flutter/material.dart';

import 'package:spira/constants/text_styles.dart';

import 'package:spira/model/article.dart';

import 'package:spira/widgets/base.dart';

class ArticleScreen extends StatelessWidget {
  final HelpArticle article;

  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Base(
        showBackButton: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                article.title,
                style: TextStyles.title,
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: article.content
                    .map((widget) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: widget,
                        ))
                    .toList())
          ],
        ));
  }
}
