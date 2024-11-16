
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
}

class AddNewSiteRequestModel {
  final int ownerId;
  final String? siteName;
  final double lat;
  final double lng;
  final String? resolvedAddress;
  final String? website;
  final int? typeId;
  final List<String>? phoneNumbers;
  final List<OpeningTime>? openingTimes;

  AddNewSiteRequestModel({
    required this.ownerId,
    this.siteName,
    required this.lat,
    required this.lng,
    this.resolvedAddress,
    this.website,
    this.typeId,
    this.phoneNumbers,
    this.openingTimes,
  });

  factory AddNewSiteRequestModel.fromJson(Map<String, dynamic> json) {
    var phoneNumbersFromJson = json['phoneNumbers'];
    List<String> phoneNumbersList = phoneNumbersFromJson != null ? List<String>.from(phoneNumbersFromJson) : [];

    var openingTimesFromJson = json['openingTimes'] as List?;
    List<OpeningTime> openingTimesList = openingTimesFromJson != null
        ? openingTimesFromJson.map((i) => OpeningTime.fromJson(i)).toList()
        : [];

    return AddNewSiteRequestModel(
      ownerId: json['ownerId'],
      siteName: json['siteName'],
      lat: json['lat'],
      lng: json['lng'],
      resolvedAddress: json['resolvedAddress'],
      website: json['website'],
      typeId: json['typeId'],
      phoneNumbers: phoneNumbersList,
      openingTimes: openingTimesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerId': ownerId,
      'siteName': siteName,
      'lat': lat,
      'lng': lng,
      'resolvedAddress': resolvedAddress,
      'website': website,
      'typeId': typeId,
      'phoneNumbers': phoneNumbers,
      'openingTimes': openingTimes?.map((e) => e.toJson()).toList(),
    };
  }
}


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
  final List<String>? newServices;

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
  });

  factory UpdateSiteRequestModel.fromJson(Map<String, dynamic> json) {
    var phoneNumbersFromJson = json['newPhoneNumbers'];
    List<String> phoneNumbersList = phoneNumbersFromJson != null ? List<String>.from(phoneNumbersFromJson) : [];

    var openingTimesFromJson = json['newOpeningTimes'] as List?;
    List<OpeningTime> openingTimesList = openingTimesFromJson != null
        ? openingTimesFromJson.map((i) => OpeningTime.fromJson(i)).toList()
        : [];

    var servicesFromJson = json['newServices'];
    List<String> servicesList = servicesFromJson != null ? List<String>.from(servicesFromJson) : [];

    return UpdateSiteRequestModel(
      siteId: json['siteId'],
      newSiteName: json['newSiteName'],
      newLat: json['newLat'],
      newLng: json['newLng'],
      newResolvedAddress: json['newResolvedAddress'],
      newWebSite: json['newWebSite'],
      newTypeId: json['newTypeId'],
      newPhoneNumbers: phoneNumbersList,
      newOpeningTimes: openingTimesList,
      newServices: servicesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'siteId': siteId,
      'newSiteName': newSiteName,
      'newLat': newLat,
      'newLng': newLng,
      'newResolvedAddress': newResolvedAddress,
      'newWebSite': newWebSite,
      'newTypeId': newTypeId,
      'newPhoneNumbers': newPhoneNumbers,
      'newOpeningTimes': newOpeningTimes?.map((e) => e.toJson()).toList(),
      'newServices': newServices,
    };
  }
}