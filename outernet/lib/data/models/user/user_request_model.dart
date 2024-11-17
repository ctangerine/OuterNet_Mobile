class UploadFileRequestModel {
  final List<String> files;

  UploadFileRequestModel({
    required this.files,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['files'] = files;
    return data;
  }

  UploadFileRequestModel.fromJson(Map<String, dynamic> json)
      : files = json['files'];
}