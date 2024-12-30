class ApiEndpoints {
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String verifyRegister = '/api/auth/confirm-registration';
  static const String resetPassword = '/api/auth/reset-password';
  static const String refreshToken = '/api/auth/refresh-token';
  static const String updload = '/api/upload';
  static const String searchUser = '/api/users/search';

  static const String site = '/api/sites';
  static const String siteType = '/api/site-types';
  static const String siteReview = '/api/site-reviews';
  static const String discover = '/api/sites/discover';
  
  static const String changePassword = '/api/users/auth/change-password';
  static const String avatar = '/api/users/avatar';
  static const String basicInfo = '/api/users/basic-info';
  static const String detailInfo = '/api/users/detail';
  static const String email = '/api/users/email';
  static const String unactivated = '/api/users/unactivated';
  static const String user = '/api/users';

  static const String plan = '/api/travel-plans';
  static const String addMemberSubDomain = '/add-member';
  static const String removeMemberSubDomain = '/remove-member';
  static const String changeRoleSubDomain = '/change-role';
  static const String addSiteSubDomain = '/add-site';
  static const String updateSiteSubDomain = '/update-site';
  static const String removeSiteSubDomain = '/remove-site'; 
}