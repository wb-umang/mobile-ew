import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start MutualWatch Group Code

class MutualWatchGroup {
  static String getBaseUrl() => 'https://api.test.everywatch.com';
  static Map<String, String> headers = {
    'Content-type': 'application/json',
  };
  static ApiAdvisorPOSTCall apiAdvisorPOSTCall = ApiAdvisorPOSTCall();
  static ApiAnalysisGETCall apiAnalysisGETCall = ApiAnalysisGETCall();
  static ApiAnalysisGetAuctionPerformanceGraphGETCall
      apiAnalysisGetAuctionPerformanceGraphGETCall =
      ApiAnalysisGetAuctionPerformanceGraphGETCall();
  static ApiAnalysisGetAnalysisDataGETCall apiAnalysisGetAnalysisDataGETCall =
      ApiAnalysisGetAnalysisDataGETCall();
  static ApiArticleGetArticleTypeListGETCall
      apiArticleGetArticleTypeListGETCall =
      ApiArticleGetArticleTypeListGETCall();
  static ApiArticleGetArticleByArticleTypePOSTCall
      apiArticleGetArticleByArticleTypePOSTCall =
      ApiArticleGetArticleByArticleTypePOSTCall();
  static ApiArticleGetArticleTypeTopDataGETCall
      apiArticleGetArticleTypeTopDataGETCall =
      ApiArticleGetArticleTypeTopDataGETCall();
  static ApiArticleGetLatestArticleDataGETCall
      apiArticleGetLatestArticleDataGETCall =
      ApiArticleGetLatestArticleDataGETCall();
  static ApiArticleslugGETCall apiArticleslugGETCall = ApiArticleslugGETCall();
  static ApiAuctionHouseGetAuctionOverviewPOSTCall
      apiAuctionHouseGetAuctionOverviewPOSTCall =
      ApiAuctionHouseGetAuctionOverviewPOSTCall();
  static ApiAuctionHouseGetOrganizationArticleDetailsByInfoSourceIdGETCall
      apiAuctionHouseGetOrganizationArticleDetailsByInfoSourceIdGETCall =
      ApiAuctionHouseGetOrganizationArticleDetailsByInfoSourceIdGETCall();
  static ApiAuctionHouseGetAuctionByOrgIdPOSTCall
      apiAuctionHouseGetAuctionByOrgIdPOSTCall =
      ApiAuctionHouseGetAuctionByOrgIdPOSTCall();
  static ApiAuctionHouseGetSpotLightAuctionPOSTCall
      apiAuctionHouseGetSpotLightAuctionPOSTCall =
      ApiAuctionHouseGetSpotLightAuctionPOSTCall();
  static ApiAuctionHouseGetAuctionLotDetailPOSTCall
      apiAuctionHouseGetAuctionLotDetailPOSTCall =
      ApiAuctionHouseGetAuctionLotDetailPOSTCall();
  static ApiAuctionHouseGetAuctionHouseGETCall
      apiAuctionHouseGetAuctionHouseGETCall =
      ApiAuctionHouseGetAuctionHouseGETCall();
  static ApiAuctionHouseGetTopUpcomingAuctionLotGETCall
      apiAuctionHouseGetTopUpcomingAuctionLotGETCall =
      ApiAuctionHouseGetTopUpcomingAuctionLotGETCall();
  static ApiAuctionHouseAuctionWiseListingGETCall
      apiAuctionHouseAuctionWiseListingGETCall =
      ApiAuctionHouseAuctionWiseListingGETCall();
  static ApiAuctionHouseMarketPlaceListingGETCall
      apiAuctionHouseMarketPlaceListingGETCall =
      ApiAuctionHouseMarketPlaceListingGETCall();
  static ApiAuthFacebookLoginPOSTCall apiAuthFacebookLoginPOSTCall =
      ApiAuthFacebookLoginPOSTCall();
  static RegisterUserCall registerUserCall = RegisterUserCall();
  static ApiAuthVerifyEmailGETCall apiAuthVerifyEmailGETCall =
      ApiAuthVerifyEmailGETCall();
  static ApiAuthResendVerificationEmailGETCall
      apiAuthResendVerificationEmailGETCall =
      ApiAuthResendVerificationEmailGETCall();
  static ApiAuthChangePasswordPOSTCall apiAuthChangePasswordPOSTCall =
      ApiAuthChangePasswordPOSTCall();
  static ApiAuthForgotPasswordGETCall apiAuthForgotPasswordGETCall =
      ApiAuthForgotPasswordGETCall();
  static ApiAuthResetPasswordPOSTCall apiAuthResetPasswordPOSTCall =
      ApiAuthResetPasswordPOSTCall();
  static ApiAuthUpdateCurrencyPUTCall apiAuthUpdateCurrencyPUTCall =
      ApiAuthUpdateCurrencyPUTCall();
  static ApiAuthUserProfilePOSTCall apiAuthUserProfilePOSTCall =
      ApiAuthUserProfilePOSTCall();
  static ApiAuthGetUserProfileGETCall apiAuthGetUserProfileGETCall =
      ApiAuthGetUserProfileGETCall();
  static LoginUserCall loginUserCall = LoginUserCall();
  static ApiAuthRefreshTokenPOSTCall apiAuthRefreshTokenPOSTCall =
      ApiAuthRefreshTokenPOSTCall();
  static ApiAuthLogoutPOSTCall apiAuthLogoutPOSTCall = ApiAuthLogoutPOSTCall();
  static ApiAuthGoogleLoginPOSTCall apiAuthGoogleLoginPOSTCall =
      ApiAuthGoogleLoginPOSTCall();
  static ApiAuthGoogleSignUpPOSTCall apiAuthGoogleSignUpPOSTCall =
      ApiAuthGoogleSignUpPOSTCall();
  static ApiAuthGetLoginDetailsidGETCall apiAuthGetLoginDetailsidGETCall =
      ApiAuthGetLoginDetailsidGETCall();
  static ApiAuthGETCall apiAuthGETCall = ApiAuthGETCall();
  static ApiAuthGetPhoneCodeListGETCall apiAuthGetPhoneCodeListGETCall =
      ApiAuthGetPhoneCodeListGETCall();
  static ApiAuthUpdateIsLoginPOSTCall apiAuthUpdateIsLoginPOSTCall =
      ApiAuthUpdateIsLoginPOSTCall();
  static ApiAuthAutoLogintokenGETCall apiAuthAutoLogintokenGETCall =
      ApiAuthAutoLogintokenGETCall();
  static ApiBillingPlanGetBillingPlansGETCall
      apiBillingPlanGetBillingPlansGETCall =
      ApiBillingPlanGetBillingPlansGETCall();
  static ApiBillingPlanApplyCodePOSTCall apiBillingPlanApplyCodePOSTCall =
      ApiBillingPlanApplyCodePOSTCall();
  static ApiBillingPlanRemoveCodePOSTCall apiBillingPlanRemoveCodePOSTCall =
      ApiBillingPlanRemoveCodePOSTCall();
  static ApiBuyersPremiumGETCall apiBuyersPremiumGETCall =
      ApiBuyersPremiumGETCall();
  static ApiCollectionGroupGETCall apiCollectionGroupGETCall =
      ApiCollectionGroupGETCall();
  static ApiCollectionGroupPOSTCall apiCollectionGroupPOSTCall =
      ApiCollectionGroupPOSTCall();
  static ApiCollectionGroupPUTCall apiCollectionGroupPUTCall =
      ApiCollectionGroupPUTCall();
  static ApiCollectionGroupDELETECall apiCollectionGroupDELETECall =
      ApiCollectionGroupDELETECall();
  static ApiCollectionGroupCountGETCall apiCollectionGroupCountGETCall =
      ApiCollectionGroupCountGETCall();
  static ApiCollectionGroupAssignMultipleCollectionGroupPUTCall
      apiCollectionGroupAssignMultipleCollectionGroupPUTCall =
      ApiCollectionGroupAssignMultipleCollectionGroupPUTCall();
  static ApiCollectionGroupAssignGroupToMultipleWatchPUTCall
      apiCollectionGroupAssignGroupToMultipleWatchPUTCall =
      ApiCollectionGroupAssignGroupToMultipleWatchPUTCall();
  static ApiCompareWatchGetCompareWatchGETCall
      apiCompareWatchGetCompareWatchGETCall =
      ApiCompareWatchGetCompareWatchGETCall();
  static ApiCompareWatchGetCompareWatchDetailsGETCall
      apiCompareWatchGetCompareWatchDetailsGETCall =
      ApiCompareWatchGetCompareWatchDetailsGETCall();
  static ApiCompareWatchGetCompareGroupsGETCall
      apiCompareWatchGetCompareGroupsGETCall =
      ApiCompareWatchGetCompareGroupsGETCall();
  static ApiCompareWatchAddCompareWatchGroupPOSTCall
      apiCompareWatchAddCompareWatchGroupPOSTCall =
      ApiCompareWatchAddCompareWatchGroupPOSTCall();
  static ApiCompareWatchUpdateCompareWatchGroupPUTCall
      apiCompareWatchUpdateCompareWatchGroupPUTCall =
      ApiCompareWatchUpdateCompareWatchGroupPUTCall();
  static ApiCompareWatchRemoveGroupDELETECall
      apiCompareWatchRemoveGroupDELETECall =
      ApiCompareWatchRemoveGroupDELETECall();
  static ApiContactUsPOSTCall apiContactUsPOSTCall = ApiContactUsPOSTCall();
  static EwEmailImgOpenidGETCall ewEmailImgOpenidGETCall =
      EwEmailImgOpenidGETCall();
  static EwCampainImgOpenGETCall ewCampainImgOpenGETCall =
      EwCampainImgOpenGETCall();
  static ApiEmailWebhookPOSTCall apiEmailWebhookPOSTCall =
      ApiEmailWebhookPOSTCall();
  static ApiEventGetAuctionResultsV2GETCall apiEventGetAuctionResultsV2GETCall =
      ApiEventGetAuctionResultsV2GETCall();
  static ApiEventGetEventDetailsByIdGETCall apiEventGetEventDetailsByIdGETCall =
      ApiEventGetEventDetailsByIdGETCall();
  static ApiFollowGetFollowGETCall apiFollowGetFollowGETCall =
      ApiFollowGetFollowGETCall();
  static ApiFollowPOSTCall apiFollowPOSTCall = ApiFollowPOSTCall();
  static ApiFollowDELETECall apiFollowDELETECall = ApiFollowDELETECall();
  static ApiFollowFollowMixPanelFollowByIdIdGETCall
      apiFollowFollowMixPanelFollowByIdIdGETCall =
      ApiFollowFollowMixPanelFollowByIdIdGETCall();
  static ApiFollowUnfollowMixPanelFollowByIdIdGETCall
      apiFollowUnfollowMixPanelFollowByIdIdGETCall =
      ApiFollowUnfollowMixPanelFollowByIdIdGETCall();
  static WatchFiltersGraphQLCall watchFiltersGraphQLCall =
      WatchFiltersGraphQLCall();
  static ApiHomeGetCurrencyGETCall apiHomeGetCurrencyGETCall =
      ApiHomeGetCurrencyGETCall();
  static ApiHomeGetTopWatchesGETCall apiHomeGetTopWatchesGETCall =
      ApiHomeGetTopWatchesGETCall();
  static ApiInfoSourceGETCall apiInfoSourceGETCall = ApiInfoSourceGETCall();
  static ApiManufacturerGETCall apiManufacturerGETCall =
      ApiManufacturerGETCall();
  static ApiManufacturerDetailsGETCall apiManufacturerDetailsGETCall =
      ApiManufacturerDetailsGETCall();
  static ApiMetaDataGetMetaDataSEOGETCall apiMetaDataGetMetaDataSEOGETCall =
      ApiMetaDataGetMetaDataSEOGETCall();
  static ApiMetaDataModelPOSTCall apiMetaDataModelPOSTCall =
      ApiMetaDataModelPOSTCall();
  static ApiMetaDataManufacturerPOSTCall apiMetaDataManufacturerPOSTCall =
      ApiMetaDataManufacturerPOSTCall();
  static ApiModelGETCall apiModelGETCall = ApiModelGETCall();
  static ApiNotificationGetAccountSettingGETCall
      apiNotificationGetAccountSettingGETCall =
      ApiNotificationGetAccountSettingGETCall();
  static ApiNotificationUpdateAccountSettingPUTCall
      apiNotificationUpdateAccountSettingPUTCall =
      ApiNotificationUpdateAccountSettingPUTCall();
  static ApiNotificationGetTopNotificationsGETCall
      apiNotificationGetTopNotificationsGETCall =
      ApiNotificationGetTopNotificationsGETCall();
  static ApiNotificationGetNotificationsListGETCall
      apiNotificationGetNotificationsListGETCall =
      ApiNotificationGetNotificationsListGETCall();
  static ApiNotificationGetNotificationsListByNotificationTypeGETCall
      apiNotificationGetNotificationsListByNotificationTypeGETCall =
      ApiNotificationGetNotificationsListByNotificationTypeGETCall();
  static ApiNotificationDeleteNotificationPUTCall
      apiNotificationDeleteNotificationPUTCall =
      ApiNotificationDeleteNotificationPUTCall();
  static ApiNotificationReadAllNotificationPUTCall
      apiNotificationReadAllNotificationPUTCall =
      ApiNotificationReadAllNotificationPUTCall();
  static ApiPopulerModelGETCall apiPopulerModelGETCall =
      ApiPopulerModelGETCall();
  static ApiPopulerModelGetModelIdListGETCall
      apiPopulerModelGetModelIdListGETCall =
      ApiPopulerModelGetModelIdListGETCall();
  static ApiReferenceNumberGETCall apiReferenceNumberGETCall =
      ApiReferenceNumberGETCall();
  static ApiReferralGenerateReferralCodeGETCall
      apiReferralGenerateReferralCodeGETCall =
      ApiReferralGenerateReferralCodeGETCall();
  static ApiReferralReferralCodeGETCall apiReferralReferralCodeGETCall =
      ApiReferralReferralCodeGETCall();
  static ApiRoleCreateRolePOSTCall apiRoleCreateRolePOSTCall =
      ApiRoleCreateRolePOSTCall();
  static ApiRoleGetRolesGETCall apiRoleGetRolesGETCall =
      ApiRoleGetRolesGETCall();
  static ApiSaveSearchGETCall apiSaveSearchGETCall = ApiSaveSearchGETCall();
  static ApiSaveSearchPOSTCall apiSaveSearchPOSTCall = ApiSaveSearchPOSTCall();
  static ApiSaveSearchPUTCall apiSaveSearchPUTCall = ApiSaveSearchPUTCall();
  static ApiSaveSearchDELETECall apiSaveSearchDELETECall =
      ApiSaveSearchDELETECall();
  static ApiSaveSearchCountGETCall apiSaveSearchCountGETCall =
      ApiSaveSearchCountGETCall();
  static ApiStripeCheckoutPOSTCall apiStripeCheckoutPOSTCall =
      ApiStripeCheckoutPOSTCall();
  static ApiStripeUpdateSubscriptionPOSTCall
      apiStripeUpdateSubscriptionPOSTCall =
      ApiStripeUpdateSubscriptionPOSTCall();
  static ApiStripeUpdateEmailPOSTCall apiStripeUpdateEmailPOSTCall =
      ApiStripeUpdateEmailPOSTCall();
  static ApiStripeCancelSubscriptionPOSTCall
      apiStripeCancelSubscriptionPOSTCall =
      ApiStripeCancelSubscriptionPOSTCall();
  static ApiStripeWebhookPOSTCall apiStripeWebhookPOSTCall =
      ApiStripeWebhookPOSTCall();
  static ApiUserInterestPOSTCall apiUserInterestPOSTCall =
      ApiUserInterestPOSTCall();
  static ApiUserInterestGetInterestedModelsGETCall
      apiUserInterestGetInterestedModelsGETCall =
      ApiUserInterestGetInterestedModelsGETCall();
  static ApiUserInterestDeleteDELETECall apiUserInterestDeleteDELETECall =
      ApiUserInterestDeleteDELETECall();
  static ApiUserInterestFeedBackPOSTCall apiUserInterestFeedBackPOSTCall =
      ApiUserInterestFeedBackPOSTCall();
  static ApiUserRolesGetURGETCall apiUserRolesGetURGETCall =
      ApiUserRolesGetURGETCall();
  static ApiUserRolesGETCall apiUserRolesGETCall = ApiUserRolesGETCall();
  static ApiUserRolesManagePOSTCall apiUserRolesManagePOSTCall =
      ApiUserRolesManagePOSTCall();
  static ApiUserSubscriptionGetInvoiceGETCall
      apiUserSubscriptionGetInvoiceGETCall =
      ApiUserSubscriptionGetInvoiceGETCall();
  static ApiUserSubscriptionGetCurrentSubscriptionGETCall
      apiUserSubscriptionGetCurrentSubscriptionGETCall =
      ApiUserSubscriptionGetCurrentSubscriptionGETCall();
  static ApiUserWaitingListPOSTCall apiUserWaitingListPOSTCall =
      ApiUserWaitingListPOSTCall();
  static WatchListingCall watchListingCall = WatchListingCall();
  static GetWatchAnalysisByIdCall getWatchAnalysisByIdCall =
      GetWatchAnalysisByIdCall();
  static GetWatchDetailByIdCall getWatchDetailByIdCall =
      GetWatchDetailByIdCall();
  static ApiWatchGetWatchDetailByIdGETCall apiWatchGetWatchDetailByIdGETCall =
      ApiWatchGetWatchDetailByIdGETCall();
  static ApiWatchGetWatchAnalysisByIdGETCall
      apiWatchGetWatchAnalysisByIdGETCall =
      ApiWatchGetWatchAnalysisByIdGETCall();
  static ApiWatchGetTotalWatchCountGETCall apiWatchGetTotalWatchCountGETCall =
      ApiWatchGetTotalWatchCountGETCall();
  static ApiWatchCollectionGetSourceGETCall apiWatchCollectionGetSourceGETCall =
      ApiWatchCollectionGetSourceGETCall();
  static ApiWatchCollectionGetWatchCollectionDetailsGETCall
      apiWatchCollectionGetWatchCollectionDetailsGETCall =
      ApiWatchCollectionGetWatchCollectionDetailsGETCall();
  static ApiWatchCollectionIdGETCall apiWatchCollectionIdGETCall =
      ApiWatchCollectionIdGETCall();
  static ApiWatchCollectionPOSTCall apiWatchCollectionPOSTCall =
      ApiWatchCollectionPOSTCall();
  static ApiWatchCollectionPUTCall apiWatchCollectionPUTCall =
      ApiWatchCollectionPUTCall();
  static ApiWatchCollectionDELETECall apiWatchCollectionDELETECall =
      ApiWatchCollectionDELETECall();
  static ApiWatchCollectionDeleteWatchCollectionImageIdDELETECall
      apiWatchCollectionDeleteWatchCollectionImageIdDELETECall =
      ApiWatchCollectionDeleteWatchCollectionImageIdDELETECall();
  static ApiWatchCollectionGetMyCollectionWatchIdsGETCall
      apiWatchCollectionGetMyCollectionWatchIdsGETCall =
      ApiWatchCollectionGetMyCollectionWatchIdsGETCall();
  static ApiWatchCollectionUpdateWatchCollectionGroupPUTCall
      apiWatchCollectionUpdateWatchCollectionGroupPUTCall =
      ApiWatchCollectionUpdateWatchCollectionGroupPUTCall();
}

class ApiAdvisorPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "image": "",
  "comment": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Advisor POST',
      apiUrl: '$baseUrl/api/Advisor',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAnalysisGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Analysis GET',
      apiUrl: '$baseUrl/api/Analysis',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAnalysisGetAuctionPerformanceGraphGETCall {
  Future<ApiCallResponse> call({
    int? type,
    int? flag,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Analysis/GetAuctionPerformanceGraph GET',
      apiUrl: '$baseUrl/api/Analysis/GetAuctionPerformanceGraph',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'type': type,
        'flag': flag,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAnalysisGetAnalysisDataGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Analysis/GetAnalysisData GET',
      apiUrl: '$baseUrl/api/Analysis/GetAnalysisData',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiArticleGetArticleTypeListGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Article/GetArticleTypeList GET',
      apiUrl: '$baseUrl/api/Article/GetArticleTypeList',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiArticleGetArticleByArticleTypePOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "slug": "",
  "all": false,
  "brandTaggingId": 0,
  "pageNumber": 0,
  "pageSize": 0,
  "search": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Article/GetArticleByArticleType POST',
      apiUrl: '$baseUrl/api/Article/GetArticleByArticleType',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiArticleGetArticleTypeTopDataGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Article/GetArticleTypeTopData GET',
      apiUrl: '$baseUrl/api/Article/GetArticleTypeTopData',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiArticleGetLatestArticleDataGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Article/GetLatestArticleData GET',
      apiUrl: '$baseUrl/api/Article/GetLatestArticleData',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiArticleslugGETCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Article/{slug} GET',
      apiUrl: '$baseUrl/api/Article/$slug',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseGetAuctionOverviewPOSTCall {
  Future<ApiCallResponse> call({
    int? organizationId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/AuctionHouse/GetAuctionOverview POST',
      apiUrl: '$baseUrl/api/AuctionHouse/GetAuctionOverview',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseGetOrganizationArticleDetailsByInfoSourceIdGETCall {
  Future<ApiCallResponse> call({
    int? infoSourceId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName:
          '/api/AuctionHouse/GetOrganizationArticleDetailsByInfoSourceId GET',
      apiUrl:
          '$baseUrl/api/AuctionHouse/GetOrganizationArticleDetailsByInfoSourceId',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'infoSourceId': infoSourceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseGetAuctionByOrgIdPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "organizationId": 0,
  "pageNumber": 0,
  "pageSize": 0,
  "sortColumn": "",
  "sortType": "",
  "currency": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/AuctionHouse/GetAuctionByOrgId POST',
      apiUrl: '$baseUrl/api/AuctionHouse/GetAuctionByOrgId',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseGetSpotLightAuctionPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "eventId": 0,
  "pageNumber": 0,
  "pageSize": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/AuctionHouse/GetSpotLightAuction POST',
      apiUrl: '$baseUrl/api/AuctionHouse/GetSpotLightAuction',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseGetAuctionLotDetailPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "watchId": 0,
  "userId": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/AuctionHouse/GetAuctionLotDetail POST',
      apiUrl: '$baseUrl/api/AuctionHouse/GetAuctionLotDetail',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseGetAuctionHouseGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/AuctionHouse/GetAuctionHouse GET',
      apiUrl: '$baseUrl/api/AuctionHouse/GetAuctionHouse',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseGetTopUpcomingAuctionLotGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/AuctionHouse/GetTopUpcomingAuctionLot GET',
      apiUrl: '$baseUrl/api/AuctionHouse/GetTopUpcomingAuctionLot',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseAuctionWiseListingGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/AuctionHouse/AuctionWiseListing GET',
      apiUrl: '$baseUrl/api/AuctionHouse/AuctionWiseListing',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuctionHouseMarketPlaceListingGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/AuctionHouse/MarketPlaceListing GET',
      apiUrl: '$baseUrl/api/AuctionHouse/MarketPlaceListing',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthFacebookLoginPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "idToken": "",
  "rememberMe": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/FacebookLogin POST',
      apiUrl: '$baseUrl/api/Auth/FacebookLogin',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? firstName = '',
    String? lastName = '',
    String? invitationCode = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "firstname": "$firstName",
  "lastname": "$lastName",
  "invitationCode": "$invitationCode"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerUser',
      apiUrl: '$baseUrl/api/Auth/Register',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthVerifyEmailGETCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? token = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/verify-email GET',
      apiUrl: '$baseUrl/api/Auth/verify-email',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'userId': userId,
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthResendVerificationEmailGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/resend-verification-email GET',
      apiUrl: '$baseUrl/api/Auth/resend-verification-email',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthChangePasswordPOSTCall {
  Future<ApiCallResponse> call({
    String? oldPassword = '',
    String? newPassword = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/ChangePassword POST',
      apiUrl: '$baseUrl/api/Auth/ChangePassword',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthForgotPasswordGETCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/ForgotPassword GET',
      apiUrl: '$baseUrl/api/Auth/ForgotPassword',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthResetPasswordPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "password": "",
  "email": "",
  "token": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/ResetPassword POST',
      apiUrl: '$baseUrl/api/Auth/ResetPassword',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthUpdateCurrencyPUTCall {
  Future<ApiCallResponse> call({
    String? currencyName = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/UpdateCurrency PUT',
      apiUrl: '$baseUrl/api/Auth/UpdateCurrency',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthUserProfilePOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "userId": 0,
  "gender": "",
  "occupation": "",
  "aboutMe": "",
  "phoneNumber": "",
  "phoneCode": "",
  "role": "",
  "collector": "",
  "industryProfessional": "",
  "lookingFor": "",
  "firstName": "",
  "lastName": "",
  "allowChangePassword": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/UserProfile POST',
      apiUrl: '$baseUrl/api/Auth/UserProfile',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthGetUserProfileGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/GetUserProfile GET',
      apiUrl: '$baseUrl/api/Auth/GetUserProfile',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "username": "$username",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginUser',
      apiUrl: '$baseUrl/api/Auth/Login',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthRefreshTokenPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
""''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/RefreshToken POST',
      apiUrl: '$baseUrl/api/Auth/RefreshToken',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthLogoutPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/Logout POST',
      apiUrl: '$baseUrl/api/Auth/Logout',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthGoogleLoginPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "idToken": "",
  "rememberMe": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/GoogleLogin POST',
      apiUrl: '$baseUrl/api/Auth/GoogleLogin',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthGoogleSignUpPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "idToken": "",
  "rememberMe": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/GoogleSignUp POST',
      apiUrl: '$baseUrl/api/Auth/GoogleSignUp',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthGetLoginDetailsidGETCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/GetLoginDetails/{id} GET',
      apiUrl: '$baseUrl/api/Auth/GetLoginDetails/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthGETCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth GET',
      apiUrl: '$baseUrl/api/Auth',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'accessToken': accessToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthGetPhoneCodeListGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/GetPhoneCodeList GET',
      apiUrl: '$baseUrl/api/Auth/GetPhoneCodeList',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthUpdateIsLoginPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/UpdateIsLogin POST',
      apiUrl: '$baseUrl/api/Auth/UpdateIsLogin',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiAuthAutoLogintokenGETCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Auth/AutoLogin/{token} GET',
      apiUrl: '$baseUrl/api/Auth/AutoLogin/$token',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiBillingPlanGetBillingPlansGETCall {
  Future<ApiCallResponse> call({
    String? promoCode = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/BillingPlan/GetBillingPlans GET',
      apiUrl: '$baseUrl/api/BillingPlan/GetBillingPlans',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'promoCode': promoCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiBillingPlanApplyCodePOSTCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/BillingPlan/ApplyCode POST',
      apiUrl: '$baseUrl/api/BillingPlan/ApplyCode',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiBillingPlanRemoveCodePOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/BillingPlan/RemoveCode POST',
      apiUrl: '$baseUrl/api/BillingPlan/RemoveCode',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiBuyersPremiumGETCall {
  Future<ApiCallResponse> call({
    int? organizationId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/BuyersPremium GET',
      apiUrl: '$baseUrl/api/BuyersPremium',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'organizationId': organizationId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCollectionGroupGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/CollectionGroup GET',
      apiUrl: '$baseUrl/api/CollectionGroup',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCollectionGroupPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "id": 0,
  "name": "",
  "description": "",
  "userId": 0,
  "createdDate": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/CollectionGroup POST',
      apiUrl: '$baseUrl/api/CollectionGroup',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCollectionGroupPUTCall {
  Future<ApiCallResponse> call({
    int? groupId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "id": 0,
  "name": "",
  "description": "",
  "userId": 0,
  "createdDate": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/CollectionGroup PUT',
      apiUrl: '$baseUrl/api/CollectionGroup',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCollectionGroupDELETECall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/CollectionGroup DELETE',
      apiUrl: '$baseUrl/api/CollectionGroup',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCollectionGroupCountGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/CollectionGroup/Count GET',
      apiUrl: '$baseUrl/api/CollectionGroup/Count',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCollectionGroupAssignMultipleCollectionGroupPUTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "collectionGroupIds": [
    0
  ],
  "watchCollectionId": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/CollectionGroup/AssignMultipleCollectionGroup PUT',
      apiUrl: '$baseUrl/api/CollectionGroup/AssignMultipleCollectionGroup',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCollectionGroupAssignGroupToMultipleWatchPUTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "watchCollectionIds": [
    0
  ],
  "collectionGroupId": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/CollectionGroup/AssignGroupToMultipleWatch PUT',
      apiUrl: '$baseUrl/api/CollectionGroup/AssignGroupToMultipleWatch',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCompareWatchGetCompareWatchGETCall {
  Future<ApiCallResponse> call({
    String? watchIds = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/CompareWatch/GetCompareWatch GET',
      apiUrl: '$baseUrl/api/CompareWatch/GetCompareWatch',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'watchIds': watchIds,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCompareWatchGetCompareWatchDetailsGETCall {
  Future<ApiCallResponse> call({
    String? watchIds = '',
    int? groupId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/CompareWatch/GetCompareWatchDetails GET',
      apiUrl: '$baseUrl/api/CompareWatch/GetCompareWatchDetails',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'WatchIds': watchIds,
        'GroupId': groupId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCompareWatchGetCompareGroupsGETCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? sortColumn = '',
    String? sortType = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/CompareWatch/GetCompareGroups GET',
      apiUrl: '$baseUrl/api/CompareWatch/GetCompareGroups',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'PageNumber': pageNumber,
        'PageSize': pageSize,
        'SortColumn': sortColumn,
        'SortType': sortType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCompareWatchAddCompareWatchGroupPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "watchIds": "",
  "groupName": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/CompareWatch/AddCompareWatchGroup POST',
      apiUrl: '$baseUrl/api/CompareWatch/AddCompareWatchGroup',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCompareWatchUpdateCompareWatchGroupPUTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "groupId": 0,
  "groupName": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/CompareWatch/UpdateCompareWatchGroup PUT',
      apiUrl: '$baseUrl/api/CompareWatch/UpdateCompareWatchGroup',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiCompareWatchRemoveGroupDELETECall {
  Future<ApiCallResponse> call({
    int? groupId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/CompareWatch/RemoveGroup DELETE',
      apiUrl: '$baseUrl/api/CompareWatch/RemoveGroup',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'groupId': groupId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiContactUsPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "title": "",
  "country": "",
  "firstName": "",
  "lastName": "",
  "email": "",
  "phoneNumber": "",
  "note": "",
  "typeOfBusiness": "",
  "contactUsTypeId": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/ContactUs POST',
      apiUrl: '$baseUrl/api/ContactUs',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EwEmailImgOpenidGETCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/ew/email-img-open/{id} GET',
      apiUrl: '$baseUrl/ew/email-img-open/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EwCampainImgOpenGETCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    String? campaign = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/ew/campain-img-open GET',
      apiUrl: '$baseUrl/ew/campain-img-open',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'email': email,
        'name': name,
        'campaign': campaign,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiEmailWebhookPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/EmailWebhook POST',
      apiUrl: '$baseUrl/api/EmailWebhook',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiEventGetAuctionResultsV2GETCall {
  Future<ApiCallResponse> call({
    String? variables = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Event/GetAuctionResults_v2 GET',
      apiUrl: '$baseUrl/api/Event/GetAuctionResults_v2',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'variables': variables,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiEventGetEventDetailsByIdGETCall {
  Future<ApiCallResponse> call({
    String? variables = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Event/GetEventDetailsById GET',
      apiUrl: '$baseUrl/api/Event/GetEventDetailsById',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'variables': variables,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiFollowGetFollowGETCall {
  Future<ApiCallResponse> call({
    String? type = '',
    int? pageNumber,
    int? pageSize,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Follow/GetFollow GET',
      apiUrl: '$baseUrl/api/Follow/GetFollow',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'Type': type,
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiFollowPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "type": "",
  "masterId": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Follow POST',
      apiUrl: '$baseUrl/api/Follow',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiFollowDELETECall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Follow DELETE',
      apiUrl: '$baseUrl/api/Follow',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiFollowFollowMixPanelFollowByIdIdGETCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Follow/FollowMixPanelFollowById/{Id} GET',
      apiUrl: '$baseUrl/api/Follow/FollowMixPanelFollowById/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiFollowUnfollowMixPanelFollowByIdIdGETCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Follow/UnfollowMixPanelFollowById/{Id} GET',
      apiUrl: '$baseUrl/api/Follow/UnfollowMixPanelFollowById/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WatchFiltersGraphQLCall {
  Future<ApiCallResponse> call({
    String? queryName = '',
    dynamic variablesJson,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    final variables = _serializeJson(variablesJson);

    return ApiManager.instance.makeApiCall(
      callName: 'watchFiltersGraphQL',
      apiUrl: '$baseUrl/api/GraphQL',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'queryName': queryName,
        'variables': variables,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiHomeGetCurrencyGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Home/GetCurrency GET',
      apiUrl: '$baseUrl/api/Home/GetCurrency',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiHomeGetTopWatchesGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Home/GetTopWatches GET',
      apiUrl: '$baseUrl/api/Home/GetTopWatches',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiInfoSourceGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/InfoSource GET',
      apiUrl: '$baseUrl/api/InfoSource',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiManufacturerGETCall {
  Future<ApiCallResponse> call({
    int? manufacturerId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Manufacturer GET',
      apiUrl: '$baseUrl/api/Manufacturer',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'manufacturerId': manufacturerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiManufacturerDetailsGETCall {
  Future<ApiCallResponse> call({
    int? manufacturerId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/ManufacturerDetails GET',
      apiUrl: '$baseUrl/api/ManufacturerDetails',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'manufacturerId': manufacturerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiMetaDataGetMetaDataSEOGETCall {
  Future<ApiCallResponse> call({
    int? id,
    int? masterId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/MetaData/GetMetaDataSEO GET',
      apiUrl: '$baseUrl/api/MetaData/GetMetaDataSEO',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'id': id,
        'masterId': masterId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiMetaDataModelPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "slug": "",
  "id": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/MetaData/model POST',
      apiUrl: '$baseUrl/api/MetaData/model',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiMetaDataManufacturerPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "slug": "",
  "id": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/MetaData/manufacturer POST',
      apiUrl: '$baseUrl/api/MetaData/manufacturer',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiModelGETCall {
  Future<ApiCallResponse> call({
    int? modelId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Model GET',
      apiUrl: '$baseUrl/api/Model',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'modelId': modelId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiNotificationGetAccountSettingGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Notification/GetAccountSetting GET',
      apiUrl: '$baseUrl/api/Notification/GetAccountSetting',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiNotificationUpdateAccountSettingPUTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
[
  {
    "notificationTypeId": 0,
    "isMail": false,
    "name": ""
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Notification/UpdateAccountSetting PUT',
      apiUrl: '$baseUrl/api/Notification/UpdateAccountSetting',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiNotificationGetTopNotificationsGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Notification/GetTopNotifications GET',
      apiUrl: '$baseUrl/api/Notification/GetTopNotifications',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiNotificationGetNotificationsListGETCall {
  Future<ApiCallResponse> call({
    int? totalRecords,
    int? userId,
    int? pageNumber,
    int? pageSize,
    int? notificationTypeId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Notification/GetNotificationsList GET',
      apiUrl: '$baseUrl/api/Notification/GetNotificationsList',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'TotalRecords': totalRecords,
        'UserId': userId,
        'PageNumber': pageNumber,
        'PageSize': pageSize,
        'NotificationTypeId': notificationTypeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiNotificationGetNotificationsListByNotificationTypeGETCall {
  Future<ApiCallResponse> call({
    int? totalRecords,
    int? userId,
    int? pageNumber,
    int? pageSize,
    String? notificationType = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Notification/GetNotificationsListByNotificationType GET',
      apiUrl:
          '$baseUrl/api/Notification/GetNotificationsListByNotificationType',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'TotalRecords': totalRecords,
        'UserId': userId,
        'PageNumber': pageNumber,
        'PageSize': pageSize,
        'NotificationType': notificationType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiNotificationDeleteNotificationPUTCall {
  Future<ApiCallResponse> call({
    int? notificationId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Notification/DeleteNotification PUT',
      apiUrl: '$baseUrl/api/Notification/DeleteNotification',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiNotificationReadAllNotificationPUTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Notification/ReadAllNotification PUT',
      apiUrl: '$baseUrl/api/Notification/ReadAllNotification',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPopulerModelGETCall {
  Future<ApiCallResponse> call({
    int? modelId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/PopulerModel GET',
      apiUrl: '$baseUrl/api/PopulerModel',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'modelId': modelId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPopulerModelGetModelIdListGETCall {
  Future<ApiCallResponse> call({
    int? manufacturerId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/PopulerModel/GetModelIdList GET',
      apiUrl: '$baseUrl/api/PopulerModel/GetModelIdList',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'manufacturerId': manufacturerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiReferenceNumberGETCall {
  Future<ApiCallResponse> call({
    int? referenceNumberId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/ReferenceNumber GET',
      apiUrl: '$baseUrl/api/ReferenceNumber',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'referenceNumberId': referenceNumberId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiReferralGenerateReferralCodeGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Referral/GenerateReferralCode GET',
      apiUrl: '$baseUrl/api/Referral/GenerateReferralCode',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiReferralReferralCodeGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Referral/ReferralCode GET',
      apiUrl: '$baseUrl/api/Referral/ReferralCode',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiRoleCreateRolePOSTCall {
  Future<ApiCallResponse> call({
    String? roleName = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Role/CreateRole POST',
      apiUrl: '$baseUrl/api/Role/CreateRole',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiRoleGetRolesGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Role/GetRoles GET',
      apiUrl: '$baseUrl/api/Role/GetRoles',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiSaveSearchGETCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/SaveSearch GET',
      apiUrl: '$baseUrl/api/SaveSearch',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiSaveSearchPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "",
  "queryString": "",
  "saveSearchTypeIds": [
    0
  ],
  "notifyInDays": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/SaveSearch POST',
      apiUrl: '$baseUrl/api/SaveSearch',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiSaveSearchPUTCall {
  Future<ApiCallResponse> call({
    int? searchId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "",
  "queryString": "",
  "saveSearchTypeIds": [
    0
  ],
  "notifyInDays": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/SaveSearch PUT',
      apiUrl: '$baseUrl/api/SaveSearch',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiSaveSearchDELETECall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/SaveSearch DELETE',
      apiUrl: '$baseUrl/api/SaveSearch',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiSaveSearchCountGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/SaveSearch/Count GET',
      apiUrl: '$baseUrl/api/SaveSearch/Count',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiStripeCheckoutPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "",
  "email": "",
  "billingPlanId": 0,
  "oldSubscriptionId": 0,
  "couponId": "",
  "successUrl": "",
  "cancelUrl": "",
  "referral": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Stripe/checkout POST',
      apiUrl: '$baseUrl/api/Stripe/checkout',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiStripeUpdateSubscriptionPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "",
  "email": "",
  "billingPlanId": 0,
  "oldSubscriptionId": 0,
  "couponId": "",
  "successUrl": "",
  "cancelUrl": "",
  "referral": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/Stripe/updateSubscription POST',
      apiUrl: '$baseUrl/api/Stripe/updateSubscription',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiStripeUpdateEmailPOSTCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Stripe/updateEmail POST',
      apiUrl: '$baseUrl/api/Stripe/updateEmail',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiStripeCancelSubscriptionPOSTCall {
  Future<ApiCallResponse> call({
    int? subscriptionId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Stripe/cancelSubscription POST',
      apiUrl: '$baseUrl/api/Stripe/cancelSubscription',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiStripeWebhookPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Stripe/webhook POST',
      apiUrl: '$baseUrl/api/Stripe/webhook',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserInterestPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "caseSize": [
    0
  ],
  "caseMaterial": [
    0
  ],
  "yearOfProductionType": [
    0
  ],
  "manufacturerId": [
    0
  ],
  "modelId": [
    0
  ],
  "role": "",
  "collector": "",
  "industryProfessional": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/UserInterest POST',
      apiUrl: '$baseUrl/api/UserInterest',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserInterestGetInterestedModelsGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/UserInterest/GetInterestedModels GET',
      apiUrl: '$baseUrl/api/UserInterest/GetInterestedModels',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserInterestDeleteDELETECall {
  Future<ApiCallResponse> call({
    String? intrestIds = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/UserInterest/Delete DELETE',
      apiUrl: '$baseUrl/api/UserInterest/Delete',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'intrestIds': intrestIds,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserInterestFeedBackPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "feedbackText": "",
  "feedbackEnumId": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/UserInterest/FeedBack POST',
      apiUrl: '$baseUrl/api/UserInterest/FeedBack',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserRolesGetURGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/UserRoles/GetUR GET',
      apiUrl: '$baseUrl/api/UserRoles/GetUR',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserRolesGETCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/UserRoles GET',
      apiUrl: '$baseUrl/api/UserRoles',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserRolesManagePOSTCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
[
  {
    "roleId": 0,
    "roleName": "",
    "selected": false
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/UserRoles/Manage POST',
      apiUrl: '$baseUrl/api/UserRoles/Manage',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserSubscriptionGetInvoiceGETCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? sortColumn = '',
    String? sortType = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/UserSubscription/GetInvoice GET',
      apiUrl: '$baseUrl/api/UserSubscription/GetInvoice',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'PageNumber': pageNumber,
        'PageSize': pageSize,
        'SortColumn': sortColumn,
        'SortType': sortType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserSubscriptionGetCurrentSubscriptionGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/UserSubscription/GetCurrentSubscription GET',
      apiUrl: '$baseUrl/api/UserSubscription/GetCurrentSubscription',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiUserWaitingListPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "email": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/UserWaitingList POST',
      apiUrl: '$baseUrl/api/UserWaitingList',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WatchListingCall {
  Future<ApiCallResponse> call({
    dynamic variablesJson,
    String? accessToken = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    final variables = _serializeJson(variablesJson);

    return ApiManager.instance.makeApiCall(
      callName: 'watchListing',
      apiUrl: '$baseUrl/api/Watch/WatchListing',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'variables': variables,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWatchAnalysisByIdCall {
  Future<ApiCallResponse> call({
    dynamic variablesJson,
    String? accessToken = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    final variables = _serializeJson(variablesJson);

    return ApiManager.instance.makeApiCall(
      callName: 'getWatchAnalysisById',
      apiUrl: '$baseUrl/api/Watch/GetWatchAnalysisById',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'variables': variables,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWatchDetailByIdCall {
  Future<ApiCallResponse> call({
    dynamic variablesJson,
    String? accessToken = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    final variables = _serializeJson(variablesJson);

    return ApiManager.instance.makeApiCall(
      callName: 'getWatchDetailById',
      apiUrl: '$baseUrl/api/Watch/GetWatchDetailById',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {
        'variables': variables,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchGetWatchDetailByIdGETCall {
  Future<ApiCallResponse> call({
    String? variables = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Watch/GetWatchDetailById GET',
      apiUrl: '$baseUrl/api/Watch/GetWatchDetailById',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'variables': variables,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchGetWatchAnalysisByIdGETCall {
  Future<ApiCallResponse> call({
    String? variables = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Watch/GetWatchAnalysisById GET',
      apiUrl: '$baseUrl/api/Watch/GetWatchAnalysisById',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'variables': variables,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchGetTotalWatchCountGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/Watch/GetTotalWatchCount GET',
      apiUrl: '$baseUrl/api/Watch/GetTotalWatchCount',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionGetSourceGETCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection/GetSource GET',
      apiUrl: '$baseUrl/api/WatchCollection/GetSource',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionGetWatchCollectionDetailsGETCall {
  Future<ApiCallResponse> call({
    String? search = '',
    int? collectionGroupId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection/GetWatchCollectionDetails GET',
      apiUrl: '$baseUrl/api/WatchCollection/GetWatchCollectionDetails',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'search': search,
        'collectionGroupId': collectionGroupId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionIdGETCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection/{Id} GET',
      apiUrl: '$baseUrl/api/WatchCollection/$id',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionPOSTCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "watchCollectionId": 0,
  "manufacturerId": 0,
  "modelId": 0,
  "referenceNumberId": 0,
  "manufacturerName": "",
  "modelName": "",
  "referenceNumber": "",
  "serialNumber": "",
  "date": "",
  "year": 0,
  "month": 0,
  "day": 0,
  "purchasePrice": 0,
  "currencyId": 0,
  "sourceId": 0,
  "condition": "",
  "conditionNote": "",
  "box": false,
  "papers": false,
  "caseCondition": "",
  "braceletCondition": "",
  "dialCondition": "",
  "crystalCondition": "",
  "moreAccessories": "",
  "aboutWatch": "",
  "storyOfWatch": "",
  "image": "",
  "caseMaterialId": "",
  "dialColorId": "",
  "braceletMaterialId": 0,
  "caseMaterialName": "",
  "dialColorName": "",
  "braceletMaterialName": "",
  "watchId": 0,
  "collectionGroups": [
    {
      "watchCollectionId": 0,
      "collectionGroupId": 0,
      "collectionGroupName": ""
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection POST',
      apiUrl: '$baseUrl/api/WatchCollection',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionPUTCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "watchCollectionId": 0,
  "manufacturerId": 0,
  "modelId": 0,
  "referenceNumberId": 0,
  "manufacturerName": "",
  "modelName": "",
  "referenceNumber": "",
  "serialNumber": "",
  "date": "",
  "year": 0,
  "month": 0,
  "day": 0,
  "purchasePrice": 0,
  "currencyId": 0,
  "sourceId": 0,
  "condition": "",
  "conditionNote": "",
  "box": false,
  "papers": false,
  "caseCondition": "",
  "braceletCondition": "",
  "dialCondition": "",
  "crystalCondition": "",
  "moreAccessories": "",
  "aboutWatch": "",
  "storyOfWatch": "",
  "image": "",
  "caseMaterialId": "",
  "dialColorId": "",
  "braceletMaterialId": 0,
  "caseMaterialName": "",
  "dialColorName": "",
  "braceletMaterialName": "",
  "watchId": 0,
  "collectionGroups": [
    {
      "watchCollectionId": 0,
      "collectionGroupId": 0,
      "collectionGroupName": ""
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection PUT',
      apiUrl: '$baseUrl/api/WatchCollection',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionDELETECall {
  Future<ApiCallResponse> call({
    int? collectionId,
    int? watchId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection DELETE',
      apiUrl: '$baseUrl/api/WatchCollection',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'collectionId': collectionId,
        'watchId': watchId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionDeleteWatchCollectionImageIdDELETECall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection/DeleteWatchCollectionImage/{Id} DELETE',
      apiUrl: '$baseUrl/api/WatchCollection/DeleteWatchCollectionImage/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionGetMyCollectionWatchIdsGETCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection/GetMyCollectionWatchIds GET',
      apiUrl: '$baseUrl/api/WatchCollection/GetMyCollectionWatchIds',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {
        'type': type,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiWatchCollectionUpdateWatchCollectionGroupPUTCall {
  Future<ApiCallResponse> call({
    int? watchCollectionId,
    int? groupId,
    String? authorization = '',
  }) async {
    final baseUrl = MutualWatchGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: '/api/WatchCollection/UpdateWatchCollectionGroup PUT',
      apiUrl: '$baseUrl/api/WatchCollection/UpdateWatchCollectionGroup',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json',
        'Authorization': '$authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End MutualWatch Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
