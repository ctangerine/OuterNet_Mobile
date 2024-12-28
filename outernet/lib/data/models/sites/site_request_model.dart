import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/env/log_service.dart';

part 'site_request_model.g.dart';

final logger = LogService().logger;

@JsonSerializable(explicitToJson: true)
class OpeningTime {
  final String? dayOfWeek;
  final String? openTime;
  final String? closeTime;

  OpeningTime({
    this.dayOfWeek,
    this.openTime,
    this.closeTime,
  });

  factory OpeningTime.fromJson(Map<String, dynamic> json) {
    return OpeningTime(
      dayOfWeek: json['dayOfWeek'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dayOfWeek': dayOfWeek,
      'openTime': openTime,
      'closeTime': closeTime,
    };
  }

  static OpeningTime defaultInstance = OpeningTime(
    dayOfWeek: '0',
    openTime: '${TimeOfDay.now().hour.toString().padLeft(2, '0')}:${TimeOfDay.now().minute.toString().padLeft(2, '0')}',
    closeTime: '${TimeOfDay.now().hour.toString().padLeft(2, '0')}:${TimeOfDay.now().minute.toString().padLeft(2, '0')}',
  );

  OpeningTime copyWith({
    String? dayOfWeek,
    String? openTime,
    String? closeTime,
  }) {
    return OpeningTime(
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
    );
  }

  // conver to TimeOfDay method
  TimeOfDay getOpenTime() {
    if (openTime == null) return TimeOfDay.now();
    final List<String> time = openTime!.split(':');
    return TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1]));
  }

  TimeOfDay getCloseTime() {
    if (closeTime == null) return TimeOfDay.now();
    final time = closeTime!.split(':');
    return TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1]));
  }

  // convert to String from TimeOfDay parameter
  static String convertTimeOfDay(TimeOfDay time) {
    final String hour = time.hour.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  static String convertToStringDay(int day) {
    switch (day) {
      case 1:
        return 'MO';
      case 2:
        return 'TU';
      case 3:
        return 'WE';
      case 4:
        return 'TH';
      case 5:
        return 'FR';
      case 6:
        return 'SA';
      case 7:
        return 'SU';
      default:
        return 'MO';
    }
  }
}

@JsonSerializable(explicitToJson: true)
class Media {
  final String? id;
  final String? url;

  Media({
    this.id,
    this.url,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);

  static Media defaultInstance = Media(
    id: '',
    url: '',
  );

  Media copyWith({
    String? id,
    String? url,
  }) {
    return Media(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Aspect {
  final int? id;
  final int? typeId;
  final String? aspectName;

  Aspect({
    this.id,
    this.typeId,
    this.aspectName,
  });

  factory Aspect.fromJson(Map<String, dynamic> json) => _$AspectFromJson(json);

  Map<String, dynamic> toJson() => _$AspectToJson(this);

  static Aspect defaultInstance = Aspect(
    id: 0,
    typeId: 0,
    aspectName: '',
  );

  Aspect copyWith({
    int? id,
    int? typeId,
    String? aspectName,
  }) {
    return Aspect(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      aspectName: aspectName ?? this.aspectName,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Fee {
  int? id;
  Aspect? aspect;
  double? feeLow;
  double? feeHigh;

  Fee({
    this.id,
    this.aspect,
    this.feeLow,
    this.feeHigh,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => _$FeeFromJson(json);

  Map<String, dynamic> toJson() => _$FeeToJson(this);

  static Fee defaultInstance = Fee(
    id: 0,
    aspect: Aspect.defaultInstance,
    feeLow: 0.0,
    feeHigh: 0.0,
  );

  Fee? copyWith({
    int? id,
    Aspect? aspect,
    double? feeLow,
    double? feeHigh,
    Fee? requestModel
  }) {
    if (requestModel != null) {
      requestModel.id = id ?? requestModel.id;
      requestModel.aspect = aspect ?? requestModel.aspect;
      requestModel.feeLow = feeLow ?? requestModel.feeLow;
      requestModel.feeHigh = feeHigh ?? requestModel.feeHigh;
      return null;
    }
    return Fee(
      id: id ?? this.id,
      aspect: aspect ?? this.aspect,
      feeLow: feeLow ?? this.feeLow,
      feeHigh: feeHigh ?? this.feeHigh,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AddNewSiteRequestModel {
  String? siteName;
  double? lat;
  double? lng;
  String? resolvedAddress;
  String? website;
  int? typeId;
  List<String>? phoneNumbers;
  List<int>? services;
  List<Fee>? fees;
  List<OpeningTime>? openingTimes;
  List<Media>? medias;
  String? description;

  AddNewSiteRequestModel({
    this.siteName,
    this.lat,
    this.lng,
    this.resolvedAddress,
    this.website,
    this.typeId,
    this.phoneNumbers,
    this.services,
    this.fees,
    this.openingTimes,
    this.medias,
    this.description,
  }) {
    logger.i('AddNewSiteRequestModel: using for create new site in server database');
    logger.i(toJson());
  }

  factory AddNewSiteRequestModel.fromJson(Map<String, dynamic> json) => _$AddNewSiteRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewSiteRequestModelToJson(this);

  static AddNewSiteRequestModel defaultInstance = AddNewSiteRequestModel(
    siteName: '',
    lat: 0.0,
    lng: 0.0,
    resolvedAddress: '',
    website: '',
    typeId: 0,
    phoneNumbers: [],
    services: [],
    fees: [],
    openingTimes: [],
    medias: [],
    description: '',
  );

  AddNewSiteRequestModel? copyWith({
    String? siteName,
    double? lat,
    double? lng,
    String? resolvedAddress,
    String? website,
    int? typeId,
    List<String>? phoneNumbers,
    List<int>? services,
    List<Fee>? fees,
    List<OpeningTime>? openingTimes,
    List<Media>? medias,
    String? description,
    AddNewSiteRequestModel? requestModel, 
  }) {
    if (requestModel != null) {
      requestModel.siteName = siteName ?? requestModel.siteName;
      requestModel.lat = lat ?? requestModel.lat;
      requestModel.lng = lng ?? requestModel.lng;
      requestModel.resolvedAddress = resolvedAddress ?? requestModel.resolvedAddress;
      requestModel.website = website ?? requestModel.website;
      requestModel.typeId = typeId ?? requestModel.typeId;
      requestModel.phoneNumbers = phoneNumbers ?? requestModel.phoneNumbers;
      requestModel.services = services ?? requestModel.services;
      requestModel.fees = fees ?? requestModel.fees;
      requestModel.openingTimes = openingTimes ?? requestModel.openingTimes;
      requestModel.medias = medias ?? requestModel.medias;
      requestModel.description = description ?? requestModel.description;
      return null;
    }

    return AddNewSiteRequestModel(
      siteName: siteName ?? this.siteName,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      resolvedAddress: resolvedAddress ?? this.resolvedAddress,
      website: website ?? this.website,
      typeId: typeId ?? this.typeId,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      services: services ?? this.services,
      fees: fees ?? this.fees,
      openingTimes: openingTimes ?? this.openingTimes,
      medias: medias ?? this.medias,
      description: description ?? this.description,
    );
  }
}


@JsonSerializable(explicitToJson: true)
class UpdateSiteRequestModel {
  final int siteId;
  final String? newSiteName;
  final double? newLat;
  final double? newLng;
  final String? newResolvedAddress;
  final String? newWebSite;
  final int? newTypeId;
  final List<String>? newPhoneNumbers;
  final List<OpeningTime>? newOpeningTimes;
  final List<int>? newServices;
  final List<int>? mediaIds;
  final List<Media>? newMedias;

  UpdateSiteRequestModel({
    required this.siteId,
    this.newSiteName,
    this.newLat,
    this.newLng,
    this.newResolvedAddress,
    this.newWebSite,
    this.newTypeId,
    this.newPhoneNumbers,
    this.newOpeningTimes,
    this.newServices,
    this.mediaIds,
    this.newMedias,
  });

  factory UpdateSiteRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateSiteRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSiteRequestModelToJson(this);

  static UpdateSiteRequestModel defaultInstance = UpdateSiteRequestModel(
    siteId: 0,
    newSiteName: '',
    newLat: 0.0,
    newLng: 0.0,
    newResolvedAddress: '',
    newWebSite: '',
    newTypeId: 0,
    newPhoneNumbers: [],
    newOpeningTimes: [],
    newServices: [],
    mediaIds: [],
    newMedias: [],
  );

  UpdateSiteRequestModel copyWith({
    int? siteId,
    String? newSiteName,
    double? newLat,
    double? newLng,
    String? newResolvedAddress,
    String? newWebSite,
    int? newTypeId,
    List<String>? newPhoneNumbers,
    List<OpeningTime>? newOpeningTimes,
    List<int>? newServices,
    List<int>? mediaIds,
    List<Media>? newMedias,
  }) {
    return UpdateSiteRequestModel(
      siteId: siteId ?? this.siteId,
      newSiteName: newSiteName ?? this.newSiteName,
      newLat: newLat ?? this.newLat,
      newLng: newLng ?? this.newLng,
      newResolvedAddress: newResolvedAddress ?? this.newResolvedAddress,
      newWebSite: newWebSite ?? this.newWebSite,
      newTypeId: newTypeId ?? this.newTypeId,
      newPhoneNumbers: newPhoneNumbers ?? this.newPhoneNumbers,
      newOpeningTimes: newOpeningTimes ?? this.newOpeningTimes,
      newServices: newServices ?? this.newServices,
      mediaIds: mediaIds ?? this.mediaIds,
      newMedias: newMedias ?? this.newMedias,
    );
  }
}


class GetSitesByAreaRequestModel {
  final double? lat;
  final double? lng;
  final double? degRadius;

  GetSitesByAreaRequestModel({
    this.lat,
    this.lng,
    this.degRadius,
  }) {
    logger.i('GetSiteRequestModel: using for get location by using site lat and long');
    logger.i(toJson());
  }

  factory GetSitesByAreaRequestModel.fromJson(Map<String, dynamic> json) {
    return GetSitesByAreaRequestModel(
      lat: json['lat'],
      lng: json['lng'],
      degRadius: json['degRadius'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
      'degRadius': degRadius,
    };
  }
}

class SearchParams {
  final String? q;
  final int? page;

  SearchParams({
    this.q,
    this.page,
  });

  factory SearchParams.fromJson(Map<String, dynamic> json) {
    return SearchParams(
      q: json['q'],
      page: json['page'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['q'] = q;
    data['page'] = page;
    return data;
  }

  SearchParams copyWith({
    String? q,
    int? page,
  }) {
    return SearchParams(
      q: q ?? this.q,
      page: page ?? this.page,
    );
  }

  static SearchParams defaultInstance = SearchParams(
    q: '',
    page: 0,
  );
}