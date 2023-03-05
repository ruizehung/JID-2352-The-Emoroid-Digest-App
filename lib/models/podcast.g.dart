// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPodcastCollection on Isar {
  IsarCollection<Podcast> get podcasts => this.collection();
}

const PodcastSchema = CollectionSchema(
  name: r'Podcast',
  id: -1143728065732125040,
  properties: {
    r'dateReleased': PropertySchema(
      id: 0,
      name: r'dateReleased',
      type: IsarType.dateTime,
    ),
    r'giSocietyJournal': PropertySchema(
      id: 1,
      name: r'giSocietyJournal',
      type: IsarType.string,
    ),
    r'guest': PropertySchema(
      id: 2,
      name: r'guest',
      type: IsarType.string,
    ),
    r'guidelineAuthors': PropertySchema(
      id: 3,
      name: r'guidelineAuthors',
      type: IsarType.stringList,
    ),
    r'hasListened': PropertySchema(
      id: 4,
      name: r'hasListened',
      type: IsarType.bool,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 6,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'keywords': PropertySchema(
      id: 7,
      name: r'keywords',
      type: IsarType.stringList,
    ),
    r'linkGuest': PropertySchema(
      id: 8,
      name: r'linkGuest',
      type: IsarType.string,
    ),
    r'mediaStorage': PropertySchema(
      id: 9,
      name: r'mediaStorage',
      type: IsarType.string,
    ),
    r'mediaUrl': PropertySchema(
      id: 10,
      name: r'mediaUrl',
      type: IsarType.string,
    ),
    r'organSystems': PropertySchema(
      id: 11,
      name: r'organSystems',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 12,
      name: r'title',
      type: IsarType.string,
    ),
    r'twitterPodcastLink': PropertySchema(
      id: 13,
      name: r'twitterPodcastLink',
      type: IsarType.string,
    ),
    r'yearGuidelinePublished': PropertySchema(
      id: 14,
      name: r'yearGuidelinePublished',
      type: IsarType.long,
    )
  },
  estimateSize: _podcastEstimateSize,
  serialize: _podcastSerialize,
  deserialize: _podcastDeserialize,
  deserializeProp: _podcastDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _podcastGetId,
  getLinks: _podcastGetLinks,
  attach: _podcastAttach,
  version: '3.0.5',
);

int _podcastEstimateSize(
  Podcast object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.giSocietyJournal.length * 3;
  bytesCount += 3 + object.guest.length * 3;
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
  bytesCount += 3 + object.linkGuest.length * 3;
  {
    final value = object.mediaStorage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mediaUrl;
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
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.twitterPodcastLink.length * 3;
  return bytesCount;
}

void _podcastSerialize(
  Podcast object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateReleased);
  writer.writeString(offsets[1], object.giSocietyJournal);
  writer.writeString(offsets[2], object.guest);
  writer.writeStringList(offsets[3], object.guidelineAuthors);
  writer.writeBool(offsets[4], object.hasListened);
  writer.writeString(offsets[5], object.id);
  writer.writeBool(offsets[6], object.isFavorite);
  writer.writeStringList(offsets[7], object.keywords);
  writer.writeString(offsets[8], object.linkGuest);
  writer.writeString(offsets[9], object.mediaStorage);
  writer.writeString(offsets[10], object.mediaUrl);
  writer.writeStringList(offsets[11], object.organSystems);
  writer.writeString(offsets[12], object.title);
  writer.writeString(offsets[13], object.twitterPodcastLink);
  writer.writeLong(offsets[14], object.yearGuidelinePublished);
}

Podcast _podcastDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Podcast();
  object.dateReleased = reader.readDateTime(offsets[0]);
  object.giSocietyJournal = reader.readString(offsets[1]);
  object.guest = reader.readString(offsets[2]);
  object.guidelineAuthors = reader.readStringList(offsets[3]) ?? [];
  object.hasListened = reader.readBool(offsets[4]);
  object.id = reader.readStringOrNull(offsets[5]);
  object.isFavorite = reader.readBool(offsets[6]);
  object.keywords = reader.readStringList(offsets[7]) ?? [];
  object.linkGuest = reader.readString(offsets[8]);
  object.mediaStorage = reader.readStringOrNull(offsets[9]);
  object.mediaUrl = reader.readStringOrNull(offsets[10]);
  object.organSystems = reader.readStringList(offsets[11]) ?? [];
  object.title = reader.readString(offsets[12]);
  object.twitterPodcastLink = reader.readString(offsets[13]);
  object.yearGuidelinePublished = reader.readLong(offsets[14]);
  return object;
}

P _podcastDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _podcastGetId(Podcast object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _podcastGetLinks(Podcast object) {
  return [];
}

void _podcastAttach(IsarCollection<dynamic> col, Id id, Podcast object) {}

extension PodcastQueryWhereSort on QueryBuilder<Podcast, Podcast, QWhere> {
  QueryBuilder<Podcast, Podcast, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PodcastQueryWhere on QueryBuilder<Podcast, Podcast, QWhereClause> {
  QueryBuilder<Podcast, Podcast, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<Podcast, Podcast, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterWhereClause> isarIdBetween(
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

extension PodcastQueryFilter
    on QueryBuilder<Podcast, Podcast, QFilterCondition> {
  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> dateReleasedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateReleased',
        value: value,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> dateReleasedGreaterThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> dateReleasedLessThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> dateReleasedBetween(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> giSocietyJournalEqualTo(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      giSocietyJournalGreaterThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      giSocietyJournalLessThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> giSocietyJournalBetween(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      giSocietyJournalStartsWith(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      giSocietyJournalEndsWith(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      giSocietyJournalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'giSocietyJournal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> giSocietyJournalMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'giSocietyJournal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      giSocietyJournalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'giSocietyJournal',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      giSocietyJournalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'giSocietyJournal',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'guest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'guest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'guest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'guest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'guest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'guest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'guest',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guest',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> guestIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'guest',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      guidelineAuthorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guidelineAuthors',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      guidelineAuthorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'guidelineAuthors',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> hasListenedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasListened',
        value: value,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idMatches(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsElementEqualTo(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsElementLessThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsElementBetween(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsElementEndsWith(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keywords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keywords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      keywordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keywords',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      keywordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keywords',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsLengthEqualTo(
      int length) {
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsIsEmpty() {
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsIsNotEmpty() {
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsLengthLessThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> keywordsLengthBetween(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkGuest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkGuest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkGuest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkGuest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkGuest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkGuest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkGuest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkGuest',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkGuest',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> linkGuestIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkGuest',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mediaStorage',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      mediaStorageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mediaStorage',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mediaStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mediaStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mediaStorage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mediaStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mediaStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mediaStorage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mediaStorage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaStorageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      mediaStorageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mediaStorage',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mediaUrl',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mediaUrl',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mediaUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mediaUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> mediaUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mediaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      organSystemsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'organSystems',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      organSystemsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'organSystems',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      organSystemsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organSystems',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      organSystemsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'organSystems',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> organSystemsIsEmpty() {
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twitterPodcastLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'twitterPodcastLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'twitterPodcastLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'twitterPodcastLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'twitterPodcastLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'twitterPodcastLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'twitterPodcastLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'twitterPodcastLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twitterPodcastLink',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      twitterPodcastLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'twitterPodcastLink',
        value: '',
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
      yearGuidelinePublishedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearGuidelinePublished',
        value: value,
      ));
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

  QueryBuilder<Podcast, Podcast, QAfterFilterCondition>
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

extension PodcastQueryObject
    on QueryBuilder<Podcast, Podcast, QFilterCondition> {}

extension PodcastQueryLinks
    on QueryBuilder<Podcast, Podcast, QFilterCondition> {}

extension PodcastQuerySortBy on QueryBuilder<Podcast, Podcast, QSortBy> {
  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByDateReleased() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByDateReleasedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByGiSocietyJournal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giSocietyJournal', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByGiSocietyJournalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giSocietyJournal', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByGuest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guest', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByGuestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guest', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByHasListened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListened', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByHasListenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListened', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByLinkGuest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkGuest', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByLinkGuestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkGuest', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByMediaStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaStorage', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByMediaStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaStorage', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByMediaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaUrl', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByMediaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaUrl', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByTwitterPodcastLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twitterPodcastLink', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByTwitterPodcastLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twitterPodcastLink', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> sortByYearGuidelinePublished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearGuidelinePublished', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy>
      sortByYearGuidelinePublishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearGuidelinePublished', Sort.desc);
    });
  }
}

extension PodcastQuerySortThenBy
    on QueryBuilder<Podcast, Podcast, QSortThenBy> {
  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByDateReleased() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByDateReleasedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByGiSocietyJournal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giSocietyJournal', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByGiSocietyJournalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giSocietyJournal', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByGuest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guest', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByGuestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guest', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByHasListened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListened', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByHasListenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListened', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByLinkGuest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkGuest', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByLinkGuestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkGuest', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByMediaStorage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaStorage', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByMediaStorageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaStorage', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByMediaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaUrl', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByMediaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaUrl', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByTwitterPodcastLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twitterPodcastLink', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByTwitterPodcastLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twitterPodcastLink', Sort.desc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy> thenByYearGuidelinePublished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearGuidelinePublished', Sort.asc);
    });
  }

  QueryBuilder<Podcast, Podcast, QAfterSortBy>
      thenByYearGuidelinePublishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearGuidelinePublished', Sort.desc);
    });
  }
}

extension PodcastQueryWhereDistinct
    on QueryBuilder<Podcast, Podcast, QDistinct> {
  QueryBuilder<Podcast, Podcast, QDistinct> distinctByDateReleased() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateReleased');
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByGiSocietyJournal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'giSocietyJournal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByGuest(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guest', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByGuidelineAuthors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guidelineAuthors');
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByHasListened() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasListened');
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByKeywords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keywords');
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByLinkGuest(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkGuest', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByMediaStorage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mediaStorage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByMediaUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mediaUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByOrganSystems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'organSystems');
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByTwitterPodcastLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'twitterPodcastLink',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Podcast, Podcast, QDistinct> distinctByYearGuidelinePublished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearGuidelinePublished');
    });
  }
}

extension PodcastQueryProperty
    on QueryBuilder<Podcast, Podcast, QQueryProperty> {
  QueryBuilder<Podcast, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Podcast, DateTime, QQueryOperations> dateReleasedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateReleased');
    });
  }

  QueryBuilder<Podcast, String, QQueryOperations> giSocietyJournalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'giSocietyJournal');
    });
  }

  QueryBuilder<Podcast, String, QQueryOperations> guestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guest');
    });
  }

  QueryBuilder<Podcast, List<String>, QQueryOperations>
      guidelineAuthorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guidelineAuthors');
    });
  }

  QueryBuilder<Podcast, bool, QQueryOperations> hasListenedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasListened');
    });
  }

  QueryBuilder<Podcast, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Podcast, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<Podcast, List<String>, QQueryOperations> keywordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keywords');
    });
  }

  QueryBuilder<Podcast, String, QQueryOperations> linkGuestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkGuest');
    });
  }

  QueryBuilder<Podcast, String?, QQueryOperations> mediaStorageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mediaStorage');
    });
  }

  QueryBuilder<Podcast, String?, QQueryOperations> mediaUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mediaUrl');
    });
  }

  QueryBuilder<Podcast, List<String>, QQueryOperations> organSystemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'organSystems');
    });
  }

  QueryBuilder<Podcast, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Podcast, String, QQueryOperations> twitterPodcastLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twitterPodcastLink');
    });
  }

  QueryBuilder<Podcast, int, QQueryOperations>
      yearGuidelinePublishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearGuidelinePublished');
    });
  }
}
