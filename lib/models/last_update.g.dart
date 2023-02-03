// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_update.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLastUpdateCollection on Isar {
  IsarCollection<LastUpdate> get lastUpdates => this.collection();
}

const LastUpdateSchema = CollectionSchema(
  name: r'LastUpdate',
  id: -802484343025480049,
  properties: {
    r'podcasts': PropertySchema(
      id: 0,
      name: r'podcasts',
      type: IsarType.dateTime,
    ),
    r'visualSummaries': PropertySchema(
      id: 1,
      name: r'visualSummaries',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _lastUpdateEstimateSize,
  serialize: _lastUpdateSerialize,
  deserialize: _lastUpdateDeserialize,
  deserializeProp: _lastUpdateDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _lastUpdateGetId,
  getLinks: _lastUpdateGetLinks,
  attach: _lastUpdateAttach,
  version: '3.0.5',
);

int _lastUpdateEstimateSize(
  LastUpdate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _lastUpdateSerialize(
  LastUpdate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.podcasts);
  writer.writeDateTime(offsets[1], object.visualSummaries);
}

LastUpdate _lastUpdateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LastUpdate();
  object.id = id;
  object.podcasts = reader.readDateTimeOrNull(offsets[0]);
  object.visualSummaries = reader.readDateTimeOrNull(offsets[1]);
  return object;
}

P _lastUpdateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lastUpdateGetId(LastUpdate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lastUpdateGetLinks(LastUpdate object) {
  return [];
}

void _lastUpdateAttach(IsarCollection<dynamic> col, Id id, LastUpdate object) {
  object.id = id;
}

extension LastUpdateQueryWhereSort
    on QueryBuilder<LastUpdate, LastUpdate, QWhere> {
  QueryBuilder<LastUpdate, LastUpdate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LastUpdateQueryWhere
    on QueryBuilder<LastUpdate, LastUpdate, QWhereClause> {
  QueryBuilder<LastUpdate, LastUpdate, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LastUpdateQueryFilter
    on QueryBuilder<LastUpdate, LastUpdate, QFilterCondition> {
  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition> podcastsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'podcasts',
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition>
      podcastsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'podcasts',
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition> podcastsEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'podcasts',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition>
      podcastsGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'podcasts',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition> podcastsLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'podcasts',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition> podcastsBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'podcasts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition>
      visualSummariesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visualSummaries',
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition>
      visualSummariesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visualSummaries',
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition>
      visualSummariesEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visualSummaries',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition>
      visualSummariesGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visualSummaries',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition>
      visualSummariesLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visualSummaries',
        value: value,
      ));
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterFilterCondition>
      visualSummariesBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visualSummaries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LastUpdateQueryObject
    on QueryBuilder<LastUpdate, LastUpdate, QFilterCondition> {}

extension LastUpdateQueryLinks
    on QueryBuilder<LastUpdate, LastUpdate, QFilterCondition> {}

extension LastUpdateQuerySortBy
    on QueryBuilder<LastUpdate, LastUpdate, QSortBy> {
  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy> sortByPodcasts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'podcasts', Sort.asc);
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy> sortByPodcastsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'podcasts', Sort.desc);
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy> sortByVisualSummaries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualSummaries', Sort.asc);
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy>
      sortByVisualSummariesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualSummaries', Sort.desc);
    });
  }
}

extension LastUpdateQuerySortThenBy
    on QueryBuilder<LastUpdate, LastUpdate, QSortThenBy> {
  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy> thenByPodcasts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'podcasts', Sort.asc);
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy> thenByPodcastsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'podcasts', Sort.desc);
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy> thenByVisualSummaries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualSummaries', Sort.asc);
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QAfterSortBy>
      thenByVisualSummariesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualSummaries', Sort.desc);
    });
  }
}

extension LastUpdateQueryWhereDistinct
    on QueryBuilder<LastUpdate, LastUpdate, QDistinct> {
  QueryBuilder<LastUpdate, LastUpdate, QDistinct> distinctByPodcasts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'podcasts');
    });
  }

  QueryBuilder<LastUpdate, LastUpdate, QDistinct> distinctByVisualSummaries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visualSummaries');
    });
  }
}

extension LastUpdateQueryProperty
    on QueryBuilder<LastUpdate, LastUpdate, QQueryProperty> {
  QueryBuilder<LastUpdate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LastUpdate, DateTime?, QQueryOperations> podcastsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'podcasts');
    });
  }

  QueryBuilder<LastUpdate, DateTime?, QQueryOperations>
      visualSummariesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visualSummaries');
    });
  }
}
