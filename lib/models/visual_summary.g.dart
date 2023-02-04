// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_summary.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetVisualSummaryCollection on Isar {
  IsarCollection<VisualSummary> get visualSummarys => this.collection();
}

const VisualSummarySchema = CollectionSchema(
  name: r'VisualSummary',
  id: -1946445733404021108,
  properties: {
    r'dateReleased': PropertySchema(
      id: 0,
      name: r'dateReleased',
      type: IsarType.dateTime,
    ),
    r'fellowAuthor': PropertySchema(
      id: 1,
      name: r'fellowAuthor',
      type: IsarType.string,
    ),
    r'giSocietyJournal': PropertySchema(
      id: 2,
      name: r'giSocietyJournal',
      type: IsarType.stringList,
    ),
    r'guidelineAuthors': PropertySchema(
      id: 3,
      name: r'guidelineAuthors',
      type: IsarType.stringList,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.string,
    ),
    r'keywords': PropertySchema(
      id: 5,
      name: r'keywords',
      type: IsarType.stringList,
    ),
    r'linkOriginalManuscript': PropertySchema(
      id: 6,
      name: r'linkOriginalManuscript',
      type: IsarType.string,
    ),
    r'linkTwitter': PropertySchema(
      id: 7,
      name: r'linkTwitter',
      type: IsarType.string,
    ),
    r'linkVisualInfographicSource': PropertySchema(
      id: 8,
      name: r'linkVisualInfographicSource',
      type: IsarType.string,
    ),
    r'linkVisualInfographicStorage': PropertySchema(
      id: 9,
      name: r'linkVisualInfographicStorage',
      type: IsarType.string,
    ),
    r'linkVisualInfographicThumbnailSource': PropertySchema(
      id: 10,
      name: r'linkVisualInfographicThumbnailSource',
      type: IsarType.string,
    ),
    r'linkVisualInfographicThumbnailStorage': PropertySchema(
      id: 11,
      name: r'linkVisualInfographicThumbnailStorage',
      type: IsarType.string,
    ),
    r'linkVisualSummarySource': PropertySchema(
      id: 12,
      name: r'linkVisualSummarySource',
      type: IsarType.string,
    ),
    r'linkVisualSummaryStorage': PropertySchema(
      id: 13,
      name: r'linkVisualSummaryStorage',
      type: IsarType.string,
    ),
    r'linkVisualSummaryThumbnailSource': PropertySchema(
      id: 14,
      name: r'linkVisualSummaryThumbnailSource',
      type: IsarType.string,
    ),
    r'linkVisualSummaryThumbnailStorage': PropertySchema(
      id: 15,
      name: r'linkVisualSummaryThumbnailStorage',
      type: IsarType.string,
    ),
    r'mimeTypeVisualInfographic': PropertySchema(
      id: 16,
      name: r'mimeTypeVisualInfographic',
      type: IsarType.string,
    ),
    r'mimeTypeVisualInfographicThumbnail': PropertySchema(
      id: 17,
      name: r'mimeTypeVisualInfographicThumbnail',
      type: IsarType.string,
    ),
    r'mimeTypeVisualSummary': PropertySchema(
      id: 18,
      name: r'mimeTypeVisualSummary',
      type: IsarType.string,
    ),
    r'mimeTypeVisualSummaryThumbnail': PropertySchema(
      id: 19,
      name: r'mimeTypeVisualSummaryThumbnail',
      type: IsarType.string,
    ),
    r'organSystems': PropertySchema(
      id: 20,
      name: r'organSystems',
      type: IsarType.stringList,
    ),
    r'recordedPodcastTitle': PropertySchema(
      id: 21,
      name: r'recordedPodcastTitle',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 22,
      name: r'title',
      type: IsarType.string,
    ),
    r'yearGuidelinePublished': PropertySchema(
      id: 23,
      name: r'yearGuidelinePublished',
      type: IsarType.long,
    )
  },
  estimateSize: _visualSummaryEstimateSize,
  serialize: _visualSummarySerialize,
  deserialize: _visualSummaryDeserialize,
  deserializeProp: _visualSummaryDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _visualSummaryGetId,
  getLinks: _visualSummaryGetLinks,
  attach: _visualSummaryAttach,
  version: '3.0.5',
);

int _visualSummaryEstimateSize(
  VisualSummary object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fellowAuthor.length * 3;
  bytesCount += 3 + object.giSocietyJournal.length * 3;
  {
    for (var i = 0; i < object.giSocietyJournal.length; i++) {
      final value = object.giSocietyJournal[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.guidelineAuthors.length * 3;
  {
    for (var i = 0; i < object.guidelineAuthors.length; i++) {
      final value = object.guidelineAuthors[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.keywords.length * 3;
  {
    for (var i = 0; i < object.keywords.length; i++) {
      final value = object.keywords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.linkOriginalManuscript.length * 3;
  {
    final value = object.linkTwitter;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkVisualInfographicSource;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkVisualInfographicStorage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkVisualInfographicThumbnailSource;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkVisualInfographicThumbnailStorage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkVisualSummarySource;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkVisualSummaryStorage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkVisualSummaryThumbnailSource;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkVisualSummaryThumbnailStorage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mimeTypeVisualInfographic;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mimeTypeVisualInfographicThumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mimeTypeVisualSummary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mimeTypeVisualSummaryThumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.organSystems.length * 3;
  {
    for (var i = 0; i < object.organSystems.length; i++) {
      final value = object.organSystems[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.recordedPodcastTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _visualSummarySerialize(
  VisualSummary object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateReleased);
  writer.writeString(offsets[1], object.fellowAuthor);
  writer.writeStringList(offsets[2], object.giSocietyJournal);
  writer.writeStringList(offsets[3], object.guidelineAuthors);
  writer.writeString(offsets[4], object.id);
  writer.writeStringList(offsets[5], object.keywords);
  writer.writeString(offsets[6], object.linkOriginalManuscript);
  writer.writeString(offsets[7], object.linkTwitter);
  writer.writeString(offsets[8], object.linkVisualInfographicSource);
  writer.writeString(offsets[9], object.linkVisualInfographicStorage);
  writer.writeString(offsets[10], object.linkVisualInfographicThumbnailSource);
  writer.writeString(offsets[11], object.linkVisualInfographicThumbnailStorage);
  writer.writeString(offsets[12], object.linkVisualSummarySource);
  writer.writeString(offsets[13], object.linkVisualSummaryStorage);
  writer.writeString(offsets[14], object.linkVisualSummaryThumbnailSource);
  writer.writeString(offsets[15], object.linkVisualSummaryThumbnailStorage);
  writer.writeString(offsets[16], object.mimeTypeVisualInfographic);
  writer.writeString(offsets[17], object.mimeTypeVisualInfographicThumbnail);
  writer.writeString(offsets[18], object.mimeTypeVisualSummary);
  writer.writeString(offsets[19], object.mimeTypeVisualSummaryThumbnail);
  writer.writeStringList(offsets[20], object.organSystems);
  writer.writeString(offsets[21], object.recordedPodcastTitle);
  writer.writeString(offsets[22], object.title);
  writer.writeLong(offsets[23], object.yearGuidelinePublished);
}

VisualSummary _visualSummaryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VisualSummary();
  object.dateReleased = reader.readDateTime(offsets[0]);
  object.fellowAuthor = reader.readString(offsets[1]);
  object.giSocietyJournal = reader.readStringList(offsets[2]) ?? [];
  object.guidelineAuthors = reader.readStringList(offsets[3]) ?? [];
  object.id = reader.readStringOrNull(offsets[4]);
  object.keywords = reader.readStringList(offsets[5]) ?? [];
  object.linkOriginalManuscript = reader.readString(offsets[6]);
  object.linkTwitter = reader.readStringOrNull(offsets[7]);
  object.linkVisualInfographicSource = reader.readStringOrNull(offsets[8]);
  object.linkVisualInfographicStorage = reader.readStringOrNull(offsets[9]);
  object.linkVisualInfographicThumbnailSource =
      reader.readStringOrNull(offsets[10]);
  object.linkVisualInfographicThumbnailStorage =
      reader.readStringOrNull(offsets[11]);
  object.linkVisualSummarySource = reader.readStringOrNull(offsets[12]);
  object.linkVisualSummaryStorage = reader.readStringOrNull(offsets[13]);
  object.linkVisualSummaryThumbnailSource =
      reader.readStringOrNull(offsets[14]);
  object.linkVisualSummaryThumbnailStorage =
      reader.readStringOrNull(offsets[15]);
  object.mimeTypeVisualInfographic = reader.readStringOrNull(offsets[16]);
  object.mimeTypeVisualInfographicThumbnail =
      reader.readStringOrNull(offsets[17]);
  object.mimeTypeVisualSummary = reader.readStringOrNull(offsets[18]);
  object.mimeTypeVisualSummaryThumbnail = reader.readStringOrNull(offsets[19]);
  object.organSystems = reader.readStringList(offsets[20]) ?? [];
  object.recordedPodcastTitle = reader.readStringOrNull(offsets[21]);
  object.title = reader.readString(offsets[22]);
  object.yearGuidelinePublished = reader.readLong(offsets[23]);
  return object;
}

P _visualSummaryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringList(offset) ?? []) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _visualSummaryGetId(VisualSummary object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _visualSummaryGetLinks(VisualSummary object) {
  return [];
}

void _visualSummaryAttach(
    IsarCollection<dynamic> col, Id id, VisualSummary object) {}

extension VisualSummaryQueryWhereSort
    on QueryBuilder<VisualSummary, VisualSummary, QWhere> {
  QueryBuilder<VisualSummary, VisualSummary, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VisualSummaryQueryWhere
    on QueryBuilder<VisualSummary, VisualSummary, QWhereClause> {
  QueryBuilder<VisualSummary, VisualSummary, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VisualSummaryQueryFilter
    on QueryBuilder<VisualSummary, VisualSummary, QFilterCondition> {
  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      dateReleasedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateReleased',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      dateReleasedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateReleased',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      dateReleasedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateReleased',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      dateReleasedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateReleased',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fellowAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fellowAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fellowAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fellowAuthor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fellowAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fellowAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fellowAuthor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fellowAuthor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fellowAuthor',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      fellowAuthorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fellowAuthor',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'giSocietyJournal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'giSocietyJournal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'giSocietyJournal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'giSocietyJournal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'giSocietyJournal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'giSocietyJournal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'giSocietyJournal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'giSocietyJournal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'giSocietyJournal',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'giSocietyJournal',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'giSocietyJournal',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'giSocietyJournal',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'giSocietyJournal',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'giSocietyJournal',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'giSocietyJournal',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      giSocietyJournalLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'giSocietyJournal',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guidelineAuthors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'guidelineAuthors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'guidelineAuthors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'guidelineAuthors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'guidelineAuthors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'guidelineAuthors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'guidelineAuthors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'guidelineAuthors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guidelineAuthors',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'guidelineAuthors',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guidelineAuthors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guidelineAuthors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guidelineAuthors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guidelineAuthors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guidelineAuthors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      guidelineAuthorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'guidelineAuthors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keywords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'keywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'keywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keywords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keywords',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keywords',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keywords',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keywords',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keywords',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keywords',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keywords',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      keywordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keywords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkOriginalManuscript',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkOriginalManuscript',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkOriginalManuscript',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkOriginalManuscript',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkOriginalManuscript',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkOriginalManuscript',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkOriginalManuscript',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkOriginalManuscript',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkOriginalManuscript',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkOriginalManuscriptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkOriginalManuscript',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkTwitter',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkTwitter',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkTwitter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkTwitter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkTwitter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkTwitter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkTwitter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkTwitter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkTwitter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkTwitter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkTwitter',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkTwitterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkTwitter',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkVisualInfographicSource',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkVisualInfographicSource',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualInfographicSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkVisualInfographicSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkVisualInfographicSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkVisualInfographicSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkVisualInfographicSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkVisualInfographicSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkVisualInfographicSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkVisualInfographicSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualInfographicSource',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkVisualInfographicSource',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkVisualInfographicStorage',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkVisualInfographicStorage',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualInfographicStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkVisualInfographicStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkVisualInfographicStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkVisualInfographicStorage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkVisualInfographicStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkVisualInfographicStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkVisualInfographicStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkVisualInfographicStorage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualInfographicStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicStorageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkVisualInfographicStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkVisualInfographicThumbnailSource',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkVisualInfographicThumbnailSource',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualInfographicThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkVisualInfographicThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkVisualInfographicThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkVisualInfographicThumbnailSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkVisualInfographicThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkVisualInfographicThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkVisualInfographicThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkVisualInfographicThumbnailSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualInfographicThumbnailSource',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkVisualInfographicThumbnailSource',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkVisualInfographicThumbnailStorage',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkVisualInfographicThumbnailStorage',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualInfographicThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkVisualInfographicThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkVisualInfographicThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkVisualInfographicThumbnailStorage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkVisualInfographicThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkVisualInfographicThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkVisualInfographicThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkVisualInfographicThumbnailStorage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualInfographicThumbnailStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualInfographicThumbnailStorageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkVisualInfographicThumbnailStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkVisualSummarySource',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkVisualSummarySource',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualSummarySource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkVisualSummarySource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkVisualSummarySource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkVisualSummarySource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkVisualSummarySource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkVisualSummarySource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkVisualSummarySource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkVisualSummarySource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualSummarySource',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummarySourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkVisualSummarySource',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkVisualSummaryStorage',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkVisualSummaryStorage',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualSummaryStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkVisualSummaryStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkVisualSummaryStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkVisualSummaryStorage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkVisualSummaryStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkVisualSummaryStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkVisualSummaryStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkVisualSummaryStorage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualSummaryStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryStorageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkVisualSummaryStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkVisualSummaryThumbnailSource',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkVisualSummaryThumbnailSource',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualSummaryThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkVisualSummaryThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkVisualSummaryThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkVisualSummaryThumbnailSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkVisualSummaryThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkVisualSummaryThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkVisualSummaryThumbnailSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkVisualSummaryThumbnailSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualSummaryThumbnailSource',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkVisualSummaryThumbnailSource',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkVisualSummaryThumbnailStorage',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkVisualSummaryThumbnailStorage',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualSummaryThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkVisualSummaryThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkVisualSummaryThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkVisualSummaryThumbnailStorage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkVisualSummaryThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkVisualSummaryThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkVisualSummaryThumbnailStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkVisualSummaryThumbnailStorage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkVisualSummaryThumbnailStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      linkVisualSummaryThumbnailStorageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkVisualSummaryThumbnailStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mimeTypeVisualInfographic',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mimeTypeVisualInfographic',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mimeTypeVisualInfographic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mimeTypeVisualInfographic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mimeTypeVisualInfographic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mimeTypeVisualInfographic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mimeTypeVisualInfographic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mimeTypeVisualInfographic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mimeTypeVisualInfographic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mimeTypeVisualInfographic',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mimeTypeVisualInfographic',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mimeTypeVisualInfographic',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mimeTypeVisualInfographicThumbnail',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mimeTypeVisualInfographicThumbnail',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mimeTypeVisualInfographicThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mimeTypeVisualInfographicThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mimeTypeVisualInfographicThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mimeTypeVisualInfographicThumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mimeTypeVisualInfographicThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mimeTypeVisualInfographicThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mimeTypeVisualInfographicThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mimeTypeVisualInfographicThumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mimeTypeVisualInfographicThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualInfographicThumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mimeTypeVisualInfographicThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mimeTypeVisualSummary',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mimeTypeVisualSummary',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mimeTypeVisualSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mimeTypeVisualSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mimeTypeVisualSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mimeTypeVisualSummary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mimeTypeVisualSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mimeTypeVisualSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mimeTypeVisualSummary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mimeTypeVisualSummary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mimeTypeVisualSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mimeTypeVisualSummary',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mimeTypeVisualSummaryThumbnail',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mimeTypeVisualSummaryThumbnail',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mimeTypeVisualSummaryThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mimeTypeVisualSummaryThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mimeTypeVisualSummaryThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mimeTypeVisualSummaryThumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mimeTypeVisualSummaryThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mimeTypeVisualSummaryThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mimeTypeVisualSummaryThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mimeTypeVisualSummaryThumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mimeTypeVisualSummaryThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      mimeTypeVisualSummaryThumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mimeTypeVisualSummaryThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organSystems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'organSystems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'organSystems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'organSystems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'organSystems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'organSystems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'organSystems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'organSystems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organSystems',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'organSystems',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'organSystems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'organSystems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'organSystems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'organSystems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'organSystems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      organSystemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'organSystems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recordedPodcastTitle',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recordedPodcastTitle',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedPodcastTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordedPodcastTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordedPodcastTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordedPodcastTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recordedPodcastTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recordedPodcastTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordedPodcastTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordedPodcastTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedPodcastTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      recordedPodcastTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordedPodcastTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      yearGuidelinePublishedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearGuidelinePublished',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      yearGuidelinePublishedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yearGuidelinePublished',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      yearGuidelinePublishedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yearGuidelinePublished',
        value: value,
      ));
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterFilterCondition>
      yearGuidelinePublishedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yearGuidelinePublished',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VisualSummaryQueryObject
    on QueryBuilder<VisualSummary, VisualSummary, QFilterCondition> {}

extension VisualSummaryQueryLinks
    on QueryBuilder<VisualSummary, VisualSummary, QFilterCondition> {}

extension VisualSummaryQuerySortBy
    on QueryBuilder<VisualSummary, VisualSummary, QSortBy> {
  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByDateReleased() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByDateReleasedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByFellowAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fellowAuthor', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByFellowAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fellowAuthor', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkOriginalManuscript() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkOriginalManuscript', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkOriginalManuscriptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkOriginalManuscript', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> sortByLinkTwitter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkTwitter', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkTwitterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkTwitter', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualInfographicSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicSource', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualInfographicSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicSource', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualInfographicStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicStorage', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualInfographicStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicStorage', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualInfographicThumbnailSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicThumbnailSource', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualInfographicThumbnailSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'linkVisualInfographicThumbnailSource', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualInfographicThumbnailStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'linkVisualInfographicThumbnailStorage', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualInfographicThumbnailStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'linkVisualInfographicThumbnailStorage', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualSummarySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummarySource', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualSummarySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummarySource', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualSummaryStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryStorage', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualSummaryStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryStorage', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualSummaryThumbnailSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryThumbnailSource', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualSummaryThumbnailSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryThumbnailSource', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualSummaryThumbnailStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryThumbnailStorage', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByLinkVisualSummaryThumbnailStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryThumbnailStorage', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByMimeTypeVisualInfographic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualInfographic', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByMimeTypeVisualInfographicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualInfographic', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByMimeTypeVisualInfographicThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualInfographicThumbnail', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByMimeTypeVisualInfographicThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualInfographicThumbnail', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByMimeTypeVisualSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualSummary', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByMimeTypeVisualSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualSummary', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByMimeTypeVisualSummaryThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualSummaryThumbnail', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByMimeTypeVisualSummaryThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualSummaryThumbnail', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByRecordedPodcastTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedPodcastTitle', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByRecordedPodcastTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedPodcastTitle', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByYearGuidelinePublished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearGuidelinePublished', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      sortByYearGuidelinePublishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearGuidelinePublished', Sort.desc);
    });
  }
}

extension VisualSummaryQuerySortThenBy
    on QueryBuilder<VisualSummary, VisualSummary, QSortThenBy> {
  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByDateReleased() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByDateReleasedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByFellowAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fellowAuthor', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByFellowAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fellowAuthor', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkOriginalManuscript() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkOriginalManuscript', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkOriginalManuscriptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkOriginalManuscript', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> thenByLinkTwitter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkTwitter', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkTwitterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkTwitter', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualInfographicSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicSource', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualInfographicSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicSource', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualInfographicStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicStorage', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualInfographicStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicStorage', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualInfographicThumbnailSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualInfographicThumbnailSource', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualInfographicThumbnailSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'linkVisualInfographicThumbnailSource', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualInfographicThumbnailStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'linkVisualInfographicThumbnailStorage', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualInfographicThumbnailStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'linkVisualInfographicThumbnailStorage', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualSummarySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummarySource', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualSummarySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummarySource', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualSummaryStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryStorage', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualSummaryStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryStorage', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualSummaryThumbnailSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryThumbnailSource', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualSummaryThumbnailSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryThumbnailSource', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualSummaryThumbnailStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryThumbnailStorage', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByLinkVisualSummaryThumbnailStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkVisualSummaryThumbnailStorage', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByMimeTypeVisualInfographic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualInfographic', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByMimeTypeVisualInfographicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualInfographic', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByMimeTypeVisualInfographicThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualInfographicThumbnail', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByMimeTypeVisualInfographicThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualInfographicThumbnail', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByMimeTypeVisualSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualSummary', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByMimeTypeVisualSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualSummary', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByMimeTypeVisualSummaryThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualSummaryThumbnail', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByMimeTypeVisualSummaryThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mimeTypeVisualSummaryThumbnail', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByRecordedPodcastTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedPodcastTitle', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByRecordedPodcastTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedPodcastTitle', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByYearGuidelinePublished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearGuidelinePublished', Sort.asc);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QAfterSortBy>
      thenByYearGuidelinePublishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearGuidelinePublished', Sort.desc);
    });
  }
}

extension VisualSummaryQueryWhereDistinct
    on QueryBuilder<VisualSummary, VisualSummary, QDistinct> {
  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByDateReleased() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateReleased');
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct> distinctByFellowAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fellowAuthor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByGiSocietyJournal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'giSocietyJournal');
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByGuidelineAuthors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guidelineAuthors');
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct> distinctByKeywords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keywords');
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkOriginalManuscript({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkOriginalManuscript',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct> distinctByLinkTwitter(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkTwitter', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkVisualInfographicSource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkVisualInfographicSource',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkVisualInfographicStorage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkVisualInfographicStorage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkVisualInfographicThumbnailSource(
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkVisualInfographicThumbnailSource',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkVisualInfographicThumbnailStorage(
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkVisualInfographicThumbnailStorage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkVisualSummarySource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkVisualSummarySource',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkVisualSummaryStorage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkVisualSummaryStorage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkVisualSummaryThumbnailSource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkVisualSummaryThumbnailSource',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByLinkVisualSummaryThumbnailStorage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkVisualSummaryThumbnailStorage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByMimeTypeVisualInfographic({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mimeTypeVisualInfographic',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByMimeTypeVisualInfographicThumbnail(
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mimeTypeVisualInfographicThumbnail',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByMimeTypeVisualSummary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mimeTypeVisualSummary',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByMimeTypeVisualSummaryThumbnail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mimeTypeVisualSummaryThumbnail',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByOrganSystems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'organSystems');
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByRecordedPodcastTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedPodcastTitle',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisualSummary, VisualSummary, QDistinct>
      distinctByYearGuidelinePublished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearGuidelinePublished');
    });
  }
}

extension VisualSummaryQueryProperty
    on QueryBuilder<VisualSummary, VisualSummary, QQueryProperty> {
  QueryBuilder<VisualSummary, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<VisualSummary, DateTime, QQueryOperations>
      dateReleasedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateReleased');
    });
  }

  QueryBuilder<VisualSummary, String, QQueryOperations> fellowAuthorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fellowAuthor');
    });
  }

  QueryBuilder<VisualSummary, List<String>, QQueryOperations>
      giSocietyJournalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'giSocietyJournal');
    });
  }

  QueryBuilder<VisualSummary, List<String>, QQueryOperations>
      guidelineAuthorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guidelineAuthors');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VisualSummary, List<String>, QQueryOperations>
      keywordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keywords');
    });
  }

  QueryBuilder<VisualSummary, String, QQueryOperations>
      linkOriginalManuscriptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkOriginalManuscript');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations> linkTwitterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkTwitter');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      linkVisualInfographicSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkVisualInfographicSource');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      linkVisualInfographicStorageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkVisualInfographicStorage');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      linkVisualInfographicThumbnailSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkVisualInfographicThumbnailSource');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      linkVisualInfographicThumbnailStorageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkVisualInfographicThumbnailStorage');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      linkVisualSummarySourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkVisualSummarySource');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      linkVisualSummaryStorageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkVisualSummaryStorage');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      linkVisualSummaryThumbnailSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkVisualSummaryThumbnailSource');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      linkVisualSummaryThumbnailStorageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkVisualSummaryThumbnailStorage');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      mimeTypeVisualInfographicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mimeTypeVisualInfographic');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      mimeTypeVisualInfographicThumbnailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mimeTypeVisualInfographicThumbnail');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      mimeTypeVisualSummaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mimeTypeVisualSummary');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      mimeTypeVisualSummaryThumbnailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mimeTypeVisualSummaryThumbnail');
    });
  }

  QueryBuilder<VisualSummary, List<String>, QQueryOperations>
      organSystemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'organSystems');
    });
  }

  QueryBuilder<VisualSummary, String?, QQueryOperations>
      recordedPodcastTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedPodcastTitle');
    });
  }

  QueryBuilder<VisualSummary, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<VisualSummary, int, QQueryOperations>
      yearGuidelinePublishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearGuidelinePublished');
    });
  }
}
