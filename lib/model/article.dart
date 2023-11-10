import 'package:flutter/material.dart';
import 'package:spira/constants/text_styles.dart';

class HelpArticle {
  final String title;
  final String description;
  final List<Widget> content;

  HelpArticle(this.title, this.description, this.content);
}

class HelpArticles {
  static List<HelpArticle> articles = [
    HelpArticle("Circular Breathing", "Learn to perform circular breathing", [
      const Text("Step 1", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
      const Text("Step 2", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
    ]),
    HelpArticle("Getting Started", "Learn to use the app and your device", [
      const Text("Step 1", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
      const Text("Step 2", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
    ]),
    HelpArticle("Getting Started (Device-Only)",
        "Learn to use your device without the app", [
      const Text("Step 1", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
      const Text("Step 2", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
    ]),
    HelpArticle("Charging", "How to charge your device", [
      const Text("Step 1", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
      const Text("Step 2", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
    ]),
    HelpArticle("Replacing Mouthpiece", "How to replace the mouthpiece", [
      const Text("Step 1", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
      const Text("Step 2", style: TextStyles.subtitle),
      const Text("Text goes here", style: TextStyles.body),
    ]),
  ];
}
