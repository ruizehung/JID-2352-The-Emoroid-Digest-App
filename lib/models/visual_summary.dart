import 'package:cloud_firestore/cloud_firestore.dart';

class VisualSummary {
  final String title;
  final String fellowAuthor;
  final Timestamp dateReleased;
  final List<String> guidelineAuthors;
  final int yearGuidelinePublished;
  final String giSocietyJournal;
  final List<String> organSystems;
  final List<String> keywords;

  final String recordedPodcastTitle;
  final String linkOriginalManuscript;
  final String linkTwitter;

  final String mimeTypeVisualSummary;
  final String mimeTypeVisualSummaryThumbnail;
  final String mimeTypeVisualInfographic;
  final String mimeTypeVisualInfographicThumbnail;

  final String linkVisualSummaryStorage;
  final String linkVisualSummarySource;
  final String linkVisualSummaryThumbnailStorage;
  final String linkVisualSummaryThumbnailSource;

  final String linkVisualInfographicStorage;
  final String linkVisualInfographicSource;
  final String linkVisualInfographicThumbnailStorage;
  final String linkVisualInfographicThumbnailSource;

  const VisualSummary(
      {required this.title,
      required this.fellowAuthor,
      required this.dateReleased,
      required this.guidelineAuthors,
      required this.yearGuidelinePublished,
      required this.giSocietyJournal,
      required this.organSystems,
      required this.keywords,
      required this.recordedPodcastTitle,
      required this.linkOriginalManuscript,
      required this.linkTwitter,
      required this.mimeTypeVisualSummary,
      required this.mimeTypeVisualSummaryThumbnail,
      required this.mimeTypeVisualInfographic,
      required this.mimeTypeVisualInfographicThumbnail,
      required this.linkVisualSummaryStorage,
      required this.linkVisualSummarySource,
      required this.linkVisualSummaryThumbnailStorage,
      required this.linkVisualSummaryThumbnailSource,
      required this.linkVisualInfographicStorage,
      required this.linkVisualInfographicSource,
      required this.linkVisualInfographicThumbnailStorage,
      required this.linkVisualInfographicThumbnailSource});

  factory VisualSummary.fromJson(Map<String, dynamic> json) {
    return VisualSummary(
        title: json['title'],
        fellowAuthor: json['fellowAuthor'],
        dateReleased: json['dateReleased'],
        guidelineAuthors:
            (json['guidelineAuthors'] as List<dynamic>).cast<String>(),
        yearGuidelinePublished: json['yearGuidelinePublished'],
        giSocietyJournal: json['giSocietyJournal'],
        organSystems: (json['organSystems'] as List<dynamic>).cast<String>(),
        keywords: (json['keywords'] as List<dynamic>).cast<String>(),
        recordedPodcastTitle: json['recordedPodcastTitle'],
        linkOriginalManuscript: json['linkOriginalManuscript'],
        linkTwitter: json['linkTwitter'],
        mimeTypeVisualSummary: json['mimeTypeVisualSummary'],
        mimeTypeVisualSummaryThumbnail: json['mimeTypeVisualSummaryThumbnail'],
        mimeTypeVisualInfographic: json['mimeTypeVisualInfographic'],
        mimeTypeVisualInfographicThumbnail:
            json['mimeTypeVisualInfographicThumbnail'],
        linkVisualSummaryStorage: json['linkVisualSummaryStorage'],
        linkVisualSummarySource: json['linkVisualSummarySource'],
        linkVisualSummaryThumbnailStorage:
            json['linkVisualSummaryThumbnailStorage'],
        linkVisualSummaryThumbnailSource:
            json['linkVisualSummaryThumbnailSource'],
        linkVisualInfographicStorage: json['linkVisualInfographicStorage'],
        linkVisualInfographicSource: json['linkVisualInfographicSource'],
        linkVisualInfographicThumbnailStorage:
            json['linkVisualInfographicThumbnailStorage'],
        linkVisualInfographicThumbnailSource:
            json['linkVisualInfographicThumbnailSource']);
  }
}
