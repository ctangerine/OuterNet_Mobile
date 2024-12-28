import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/plan_entity.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/domain/entities/user_entity.dart';

part 'drift_database.g.dart';

// Table Generic for Entities
class Plans extends Table {
  IntColumn get localId => integer().autoIncrement()(); // Local auto-increment ID
  IntColumn get id => integer().nullable()(); // Remote ID
  TextColumn get json => text()(); // JSON data
}

class Sites extends Table {
  IntColumn get localId => integer().autoIncrement()();
  IntColumn get id => integer().nullable()();
  TextColumn get json => text()();
}

class Users extends Table {
  IntColumn get localId => integer().autoIncrement()();
  IntColumn get id => integer().nullable()();
  TextColumn get json => text()();
}

class Medias extends Table {
  IntColumn get localId => integer().autoIncrement()();
  IntColumn get id => integer().nullable()();
  TextColumn get json => text()();
}

class Reviews extends Table {
  IntColumn get localId => integer().autoIncrement()();
  IntColumn get id => integer().nullable()();
  TextColumn get json => text()();
}

@DriftDatabase(
  tables: [Plans, Sites, Users, Medias, Reviews],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  static QueryExecutor _openConnection() {
    // driftDatabase from package:drift_flutter stores the database in
    // getApplicationDocumentsDirectory().
    return driftDatabase(name: 'my_database');
  }

  // Insert or Update data
  Future<bool> upsertPlan(int? id, PlanEntity plan) async {
    if (id != null) {
      final existingPlan = await (select(plans)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      if (existingPlan != null) {
        await (update(plans)..where((tbl) => tbl.id.equals(id))).write(
          PlansCompanion(
            json: Value(jsonEncode(plan.toJson())),
          ),
        );
        return true;
      }
    }
    await into(plans).insert(PlansCompanion(
      id: Value(id),
      json: Value(jsonEncode(plan.toJson())),
    ));
    return true;
  }

  // Load Plan by remote id
  Future<PlanEntity?> loadPlanById(int id) async {
    final row = await (select(plans)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return PlanEntity.fromJson(jsonDecode(row.json));
  }

  // Insert or Update data for Sites
  Future<bool> upsertSite(int? id, SiteEntity site) async {
    if (id != null) {
      final existingSite = await (select(sites)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      if (existingSite != null) {
        await (update(sites)..where((tbl) => tbl.id.equals(id))).write(
          SitesCompanion(
            json: Value(jsonEncode(site.toJson())),
          ),
        );
        return true;
      }
    }
    await into(sites).insert(SitesCompanion(
      id: Value(id),
      json: Value(jsonEncode(site.toJson())),
    ));
    return true;
  }

  // Load Site by remote id
  Future<SiteEntity?> loadSiteById(int id) async {
    final row = await (select(sites)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return SiteEntity.fromJson(jsonDecode(row.json));
  }

  // Insert or Update data for Users
  Future<bool> upsertUser(int? id, UserEntity user) async {
    if (id != null) {
      final existingUser = await (select(users)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      if (existingUser != null) {
        await (update(users)..where((tbl) => tbl.id.equals(id))).write(
          UsersCompanion(
            json: Value(jsonEncode(user.toJson())),
          ),
        );
        return true;
      }
    }
    await into(users).insert(UsersCompanion(
      id: Value(id),
      json: Value(jsonEncode(user.toJson())),
    ));
    return true;
  }

  // Load User by remote id
  Future<UserEntity?> loadUserById(int id) async {
    final row = await (select(users)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return UserEntity.fromJson(jsonDecode(row.json));
  }

  // Insert or Update data for Medias
  Future<bool> upsertMedia(int? id, MediaEntity media) async {
    if (id != null) {
      final existingMedia = await (select(medias)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      if (existingMedia != null) {
        await (update(medias)..where((tbl) => tbl.id.equals(id))).write(
          MediasCompanion(
            json: Value(jsonEncode(media.toJson())),
          ),
        );
        return true;
      }
    }
    await into(medias).insert(MediasCompanion(
      id: Value(id),
      json: Value(jsonEncode(media.toJson())),
    ));
    return true;
  }

  // Load Media by remote id
  Future<MediaEntity?> loadMediaById(int id) async {
    final row = await (select(medias)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return MediaEntity.fromJson(jsonDecode(row.json));
  }

  // Insert or Update data for Reviews
  Future<bool> upsertReview(int? id, ReviewEntity review) async {
    if (id != null) {
      final existingReview = await (select(reviews)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      if (existingReview != null) {
        await (update(reviews)..where((tbl) => tbl.id.equals(id))).write(
          ReviewsCompanion(
            json: Value(jsonEncode(review.toJson())),
          ),
        );
        return true;
      }
    }
    await into(reviews).insert(ReviewsCompanion(
      id: Value(id),
      json: Value(jsonEncode(review.toJson())),
    ));
    return true;
  }

  // Load Review by remote id
  Future<ReviewEntity?> loadReviewById(int id) async {
    final row = await (select(reviews)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return ReviewEntity.fromJson(jsonDecode(row.json));
  }

  // define remove methods for each table
  Future<bool> removePlan(int id) async {
    await (delete(plans)..where((tbl) => tbl.id.equals(id))).go();
    return true;
  }

  Future<bool> removeSite(int id) async {
    await (delete(sites)..where((tbl) => tbl.id.equals(id))).go();
    return true;
  }

  Future<bool> removeUser(int id) async {
    await (delete(users)..where((tbl) => tbl.id.equals(id))).go();
    return true;
  }

  Future<bool> removeMedia(int id) async {
    await (delete(medias)..where((tbl) => tbl.id.equals(id))).go();
    return true;
  }

  Future<bool> removeReview(int id) async {
    await (delete(reviews)..where((tbl) => tbl.id.equals(id))).go();
    return true;
  }

  // define remove all methods for each table
  Future<bool> removeAllPlans() async {
    await delete(plans).go();
    return true;
  }

  Future<bool> removeAllSites() async {
    await delete(sites).go();
    return true;
  }

  Future<bool> removeAllUsers() async {
    await delete(users).go();
    return true;
  }

  Future<bool> removeAllMedias() async {
    await delete(medias).go();
    return true;
  }

  Future<bool> removeAllReviews() async {
    await delete(reviews).go();
    return true;
  }

  // Define remove all data method
  Future<bool> removeAllData() async {
    final plansResult = await removeAllPlans();
    final sitesResult = await removeAllSites();
    final usersResult = await removeAllUsers();
    final mediasResult = await removeAllMedias();
    final reviewsResult = await removeAllReviews();
    return plansResult && sitesResult && usersResult && mediasResult && reviewsResult;
  }

  // Get current user (the first row in Users table)
  Future<UserEntity?> getCurrentUser() async {
    final row = await (select(users)..limit(1)).getSingleOrNull();
    if (row == null) return null;
    return UserEntity.fromJson(jsonDecode(row.json));
  }

  // Get all plans
  Future<List<PlanEntity>> getAllPlans() async {
    final rows = await select(plans).get();
    return rows.map((row) => PlanEntity.fromJson(jsonDecode(row.json))).toList();
  }
}