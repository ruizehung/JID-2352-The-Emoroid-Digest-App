import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VisualSummary {
  final String title;
  final String fellowAuthor;
  final Timestamp dateReleased;
  final List<String> guidelineAuthors;
  final int yearGuidelinePublished;
  final String giSocietyJournal;
  final String organSystem;
  final List<String> keywords;
  final String linkSummaryStorage;
  final String linkSummaryOriginal;
  final String linkThumbnailStorage;
  final String linkThumbnailOriginal;

  const VisualSummary(
      {required this.title,
      required this.fellowAuthor,
      required this.dateReleased,
      required this.guidelineAuthors,
      required this.yearGuidelinePublished,
      required this.giSocietyJournal,
      required this.organSystem,
      required this.keywords,
      required this.linkSummaryStorage,
      required this.linkSummaryOriginal,
      required this.linkThumbnailStorage,
      required this.linkThumbnailOriginal});

  factory VisualSummary.fromJson(Map<String, dynamic> json) {
    return VisualSummary(
        title: json['title'],
        fellowAuthor: json['fellow_author'],
        dateReleased: json['date_released'],
        guidelineAuthors:
            (json['guideline_authors'] as List<dynamic>).cast<String>(),
        yearGuidelinePublished: json['year_guideline_published'],
        giSocietyJournal: json['gi_society_journal'],
        organSystem: json['organ_system'],
        keywords: (json['keywords'] as List<dynamic>).cast<String>(),
        linkSummaryStorage: json['link_summary_storage'],
        linkSummaryOriginal: json['link_summary_original'],
        linkThumbnailStorage: json['link_thumbnail_storage'],
        linkThumbnailOriginal: json['link_thumbnail_original']);
  }
}
