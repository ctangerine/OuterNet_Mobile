import 'package:outernet/data/models/user/user_request_model.dart';

class UserEvents {}

class AddUserName extends UserEvents {
  final String name;

  AddUserName(this.name);
}

class ChangePasswordEvent extends UserEvents {
  final ChangePasswordRequestModel request;

  ChangePasswordEvent(this.request);
}

class UpdateAvatarEvent extends UserEvents {
  final UpdateAvatarRequestModel request;

  UpdateAvatarEvent(this.request);
}

class UpdateBasicInfoEvent extends UserEvents {
  final UpdateBasicInfoRequestModel request;

  UpdateBasicInfoEvent(this.request);
}

class UpdateDetailInfoEvent extends UserEvents {
  final UpdateDetailInfoRequestModel request;

  UpdateDetailInfoEvent(this.request);
}

class UpdateEmailEvent extends UserEvents {
  final UpdateEmailRequestModel request;

  UpdateEmailEvent(this.request);
}

class DeactivateAccountEvent extends UserEvents {}

class GetUserDetailEvent extends UserEvents {}

class GetOtherUserEvent extends UserEvents {
  final int userId;

  GetOtherUserEvent(this.userId);
}

class  SearchUserEvent extends UserEvents {
  final SearchUserRequestModel request;

  SearchUserEvent(this.request);
}