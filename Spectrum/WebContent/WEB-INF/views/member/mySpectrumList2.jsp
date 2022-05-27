<%@page import="kr.or.ddit.comm.service.SpectrumAtchFileServiceImpl"%>
<%@page import="javax.xml.stream.Location"%>
<%@page import="java.awt.Window"%>
<%@page import="spectrum.myatc.service.MyAtcServiceImpl"%>
<%@page import="spectrum.myatc.service.IMyAtcService"%>
<%@page import="spectrum.myatc.vo.MyAtcVO"%>
<%@page import="spectrum.member.vo.MemberVO"%>
<%@page import="spectrum.myspectrum.vo.mySpectrumListVO"%>


<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

          

            MemberVO mv = (MemberVO)session.getAttribute("mv");
            List<mySpectrumListVO> memList = (List<mySpectrumListVO>) request.getAttribute("memList");
            
            
            String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
          /*   String memberId= (String)session.getAttribute("memberId"); */
         
            
            IMyAtcService atcService = MyAtcServiceImpl.getInstance(); 
            String myflofileatcId= atcService.getAtcId((String)session.getAttribute("memberId"));
            
            List<MyAtcVO> atcdtlList = atcService.getALLAtcDtlList(myflofileatcId);
                             int atcdtlSize = atcdtlList.size();
                             

                           
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery-3.6.0.min.js"></script>
<title>게시물 목록</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="../css/bootstrap.css" rel="stylesheet">
<style>
#mySpectrumList{
   padding-left: 20%;
   padding-right: 20%;
   padding-top: 0;
   padding-bottom: 15%;
}
</style>
<script>
$('#insert').click(function() {
   location.reload();
   });
</script>

<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">

  <link href="css/common.css" rel="stylesheet" type="text/css" />
  <link href="css/main.css" rel="stylesheet" type="text/css" />
  
  <link href="<%=request.getContextPath() %>/css/summernote/summernote-lite.css" rel="stylesheet" type="text/css">
  <script src="<%=request.getContextPath() %>/js/summernote/summernote-lite.js"></script> 
 



<script>
$('#insert').click(function() {
   location.reload();
   });
   

</script>
 
 <!-- <script type="text/javascript">var __BUNDLE_START_TIME__=this.nativePerformanceNow?nativePerformanceNow():Date.now(),__DEV__=false,process=this.process||{};process.env=process.env||{};process.env.NODE_ENV=process.env.NODE_ENV||"production";!(function(t){"use strict";function e(){return s=Object.create(null)}function r(t){const e=t,r=s[e];return r&&r.isInitialized?r.publicModule.exports:i(e,r)}function n(t){const e=t;if(s[e]&&s[e].importedDefault!==f)return s[e].importedDefault;const n=r(e),o=n&&n.__esModule?n.default:n;return s[e].importedDefault=o}function o(t){const e=t;if(s[e]&&s[e].importedAll!==f)return s[e].importedAll;const n=r(e);let o;if(n&&n.__esModule)o=n;else{if(o={},n)for(const t in n)a.call(n,t)&&(o[t]=n[t]);o.default=n}return s[e].importedAll=o}function i(e,r){if(!p&&t.ErrorUtils){p=!0;let n;try{n=c(e,r)}catch(e){t.ErrorUtils.reportFatalError(e)}return p=!1,n}return c(e,r)}function l(t){return{segmentId:t>>>h,localId:t&m}}function c(e,i){if(!i&&I.length>0){const t=l(e),r=t.segmentId,n=t.localId,o=I[r];null!=o&&(o(n),i=s[e])}const c=t.nativeRequire;if(!i&&c){const t=l(e),r=t.segmentId;c(t.localId,r),i=s[e]}if(!i)throw u(e);if(i.hasError)throw d(e,i.error);i.isInitialized=!0;const f=i,a=f.factory,p=f.dependencyMap;try{const l=i.publicModule;if(l.id=e,g.length>0)for(let t=0;t<g.length;++t)g[t].cb(e,l);return a(t,r,n,o,l,l.exports,p),i.factory=void 0,i.dependencyMap=void 0,l.exports}catch(t){throw i.hasError=!0,i.error=t,i.isInitialized=!1,i.publicModule.exports=void 0,t}}function u(t){let e='Requiring unknown module "'+t+'".';return Error(e)}function d(t,e){const r=t;return Error('Requiring module "'+r+'", which threw an exception: '+e)}t.__r=r,t.__d=function(t,e,r){null==s[e]&&(s[e]={dependencyMap:r,factory:t,hasError:!1,importedAll:f,importedDefault:f,isInitialized:!1,publicModule:{exports:{}}})},t.__c=e,t.__registerSegment=function(t,e){I[t]=e};var s=e();const f={},a={}.hasOwnProperty;r.importDefault=n,r.importAll=o;let p=!1;const h=16,m=65535;r.unpackModuleId=l,r.packModuleId=function(t){return(t.segmentId<<h)+t.localId};const g=[];r.registerHook=function(t){const e={cb:t};return g.push(e),{release:()=>{for(let t=0;t<g.length;++t)if(g[t]===e){g.splice(t,1);break}}}};const I=[]})('undefined'!=typeof global?global:'undefined'!=typeof window?window:this);
__s={"js":{"51":"/static/bundles/es6/oz-player.main.js/a33dfcba3ca2.js","52":"/static/bundles/es6/DebugInfoNub.js/dce73b4969bb.js","54":"/static/bundles/es6/BDClientSignalCollectionTrigger.js/92b1e7498665.js","55":"/static/bundles/es6/DirectMQTT.js/cf79d59a6da6.js","56":"/static/bundles/es6/AvenyFont.js/9744dac053f3.js","57":"/static/bundles/es6/StoriesDebugInfoNub.js/4a804a1c0556.js","58":"/static/bundles/es6/DesktopStoriesPage.js/dd38aa9647b2.js","59":"/static/bundles/es6/MobileStoriesPage.js/aff6684a5a64.js","60":"/static/bundles/es6/ActivityFeedBox.js/aace195da19b.js","61":"/static/bundles/es6/MobileStoriesLoginPage.js/7bd0e1664cc0.js","62":"/static/bundles/es6/DesktopStoriesLoginPage.js/d0f1f422e816.js","63":"/static/bundles/es6/ActivityFeedPage.js/739af0a707b1.js","64":"/static/bundles/es6/AdsSettingsPage.js/808d9162df99.js","65":"/static/bundles/es6/DonateCheckoutPage.js/073b1442920a.js","66":"/static/bundles/es6/FundraiserWebView.js/48e740bfe802.js","67":"/static/bundles/es6/FBPayConnectLearnMorePage.js/28c907d3cd31.js","68":"/static/bundles/es6/FBPayHubCometPage.js/6717765f4cab.js","69":"/static/bundles/es6/MWIGDInboxPage.js/bb56f5f12bf7.js","70":"/static/bundles/es6/CameraPage.js/853c94f4ed8e.js","71":"/static/bundles/es6/SettingsModules.js/77fa02fb6c94.js","72":"/static/bundles/es6/ContactHistoryPage.js/bdce1574bcc7.js","73":"/static/bundles/es6/AccessToolPage.js/dbcebd8b5cbd.js","74":"/static/bundles/es6/AccessToolViewAllPage.js/d3e74c5afbcb.js","75":"/static/bundles/es6/AccountPrivacyBugPage.js/74652264d0cc.js","76":"/static/bundles/es6/FirstPartyPlaintextPasswordLandingPage.js/272c6538dddf.js","77":"/static/bundles/es6/ThirdPartyPlaintextPasswordLandingPage.js/74f40314b2b9.js","78":"/static/bundles/es6/ShoppingBagLandingPage.js/e6ccf5980abb.js","79":"/static/bundles/es6/PlaintextPasswordBugPage.js/bf4ca1868a43.js","80":"/static/bundles/es6/PrivateAccountMadePublicBugPage.js/8a47c4233a57.js","81":"/static/bundles/es6/PublicAccountNotMadePrivateBugPage.js/1eeb335d1740.js","82":"/static/bundles/es6/BlockedAccountsBugPage.js/9e616840c6f0.js","83":"/static/bundles/es6/AndroidBetaPrivacyBugPage.js/a89c0fefa148.js","84":"/static/bundles/es6/DataControlsSupportPage.js/dedd3030b01b.js","85":"/static/bundles/es6/DataDownloadRequestPage.js/95ea5e030903.js","86":"/static/bundles/es6/DataDownloadRequestConfirmPage.js/e28fe591e221.js","87":"/static/bundles/es6/CheckpointUnderageAppealPage.js/85d2b23e8532.js","88":"/static/bundles/es6/AccountRecoveryLandingPage.js/8b9ff3085b8b.js","89":"/static/bundles/es6/ParentalConsentPage.js/60986bfcbb8b.js","90":"/static/bundles/es6/ParentalConsentNotParentPage.js/7dde0a318a19.js","91":"/static/bundles/es6/TermsAcceptPage.js/ba2405ea8705.js","92":"/static/bundles/es6/PrivacyChecksPage.js/e2c863c147e8.js","93":"/static/bundles/es6/PrivacyConsentPage.js/cbc1bd6f51e5.js","94":"/static/bundles/es6/TermsUnblockPage.js/832c0b5885f9.js","95":"/static/bundles/es6/NewTermsConfirmPage.js/af5c210bb948.js","96":"/static/bundles/es6/CreationModules.js/33adcda72c11.js","97":"/static/bundles/es6/StoryCreationPage.js/9c3f51e97749.js","98":"/static/bundles/es6/PostCommentInput.js/36a0979a4f09.js","99":"/static/bundles/es6/PostModalEntrypoint.js/950f1d74ca76.js","100":"/static/bundles/es6/PostComments.js/ebbf9b63854c.js","101":"/static/bundles/es6/LikedByListContainer.js/6a2147681073.js","102":"/static/bundles/es6/CommentLikedByListContainer.js/850838f6a274.js","103":"/static/bundles/es6/DynamicExploreMediaPage.js/68dbb64642ea.js","104":"/static/bundles/es6/DiscoverPeoplePageContainer.js/e622f9c8088b.js","105":"/static/bundles/es6/EmailConfirmationPage.js/88d611b68cdf.js","106":"/static/bundles/es6/EmailReportBadPasswordResetPage.js/3593afa1f9ac.js","107":"/static/bundles/es6/FBSignupPage.js/e3ccfe57695a.js","108":"/static/bundles/es6/ReclaimAccountPage.js/823ada6d0140.js","109":"/static/bundles/es6/MultiStepSignupPage.js/27d7cb8ff965.js","110":"/static/bundles/es6/EmptyFeedPage.js/70d4aac63125.js","111":"/static/bundles/es6/NewUserActivatorsUnit.js/3d2d86bcc4af.js","112":"/static/bundles/es6/FeedEndSuggestedUserUnit.js/a1b40cb2a538.js","113":"/static/bundles/es6/FeedSidebarContainer.js/e75f57823700.js","114":"/static/bundles/es6/SuggestedUserFeedUnitContainer.js/07b42ac077e1.js","115":"/static/bundles/es6/InFeedStoryTray.js/2deae8039eb8.js","116":"/static/bundles/es6/FeedPageContainer.js/09bd68d508e0.js","117":"/static/bundles/es6/FollowListModal.js/fa3902a7ab4a.js","118":"/static/bundles/es6/FollowListPage.js/055c7a67ab46.js","119":"/static/bundles/es6/SimilarAccountsPage.js/b919b2f3092a.js","120":"/static/bundles/es6/LiveBroadcastPage.js/7608775959fc.js","121":"/static/bundles/es6/VotingInformationCenterPage.js/fe77dd697e0c.js","122":"/static/bundles/es6/WifiAuthLoginPage.js/596834990437.js","123":"/static/bundles/es6/FalseInformationLandingPage.js/6b1698b2db6f.js","125":"/static/bundles/es6/LocationsDirectoryCountryPage.js/381201c0710d.js","126":"/static/bundles/es6/LocationsDirectoryCityPage.js/72028acd1a06.js","127":"/static/bundles/es6/LocationPageContainer.js/70433e132dd7.js","128":"/static/bundles/es6/LocationsDirectoryLandingPage.js/73cb4d42805f.js","129":"/static/bundles/es6/LoginAndSignupPage.js/801b98b56a93.js","130":"/static/bundles/es6/FXCalDisclosurePage.js/a013a6e27852.js","131":"/static/bundles/es6/FXCalLinkingAuthForm.js/9c8f2784f047.js","132":"/static/bundles/es6/FXAuthLoginPage.js/2c4d032c2261.js","133":"/static/bundles/es6/FXIABSettingsLoginPage.js/68e2235c074b.js","134":"/static/bundles/es6/FXCalPasswordlessConfirmPasswordForm.js/a42d5fe047ea.js","135":"/static/bundles/es6/FXCalReauthLoginForm.js/f2ebc6f57fa0.js","136":"/static/bundles/es6/FXIdentitySwitcherPlaceholderCometPage.js/1ef0f4ec8d5e.js","138":"/static/bundles/es6/UpdateIGAppForHelpPage.js/a2ac4a1b3ff6.js","139":"/static/bundles/es6/ResetPasswordPageContainer.js/4fa3f4b0dba7.js","140":"/static/bundles/es6/MobileAllCommentsPage.js/4ed6d11c4f34.js","141":"/static/bundles/es6/KeywordSearchExploreChainingPage.js/1d122bbd50b8.js","142":"/static/bundles/es6/MediaChainingPageContainer.js/379d3ff4384e.js","143":"/static/bundles/es6/PostPageContainer.js/e9a4e5a2fed7.js","144":"/static/bundles/es6/ProfilesDirectoryLandingPage.js/1bbfebe880de.js","145":"/static/bundles/es6/HashtagsDirectoryLandingPage.js/2115d808ab9b.js","146":"/static/bundles/es6/SuggestedDirectoryLandingPage.js/a6901c7933f9.js","147":"/static/bundles/es6/ConsentWithdrawPage.js/fc13a5d50dc1.js","148":"/static/bundles/es6/SurveyConfirmUserPage.js/575f2857d018.js","149":"/static/bundles/es6/ProductDetailsPage.js/bc2d02de4526.js","150":"/static/bundles/es6/ShoppingCartPage.js/fcbf6796ebf3.js","151":"/static/bundles/es6/ShoppingDestinationLandingPage.js/c44bebc8ea47.js","152":"/static/bundles/es6/ShoppingCartDetailsPage.js/05b908b5df8e.js","153":"/static/bundles/es6/ShopsCometCollection.js/56676e2f1895.js","156":"/static/bundles/es6/ProfessionalConversionPage.js/03686a8019d9.js","157":"/static/bundles/es6/TagPageContainer.js/95e9545a0be2.js","158":"/static/bundles/es6/TwoFactorAuthenticationShell.js/37955ea3e16a.js","159":"/static/bundles/es6/SimilarAccountsModal.js/9af02402c9af.js","160":"/static/bundles/es6/ProfilePageContainer.js/0fbe79d35802.js","161":"/static/bundles/es6/HttpErrorPage.js/19d45cb28a7f.js","162":"/static/bundles/es6/HttpGatedContentPage.js/2af18eb6eca6.js","163":"/static/bundles/es6/IGTVVideoDraftsPage.js/0c1331a66e67.js","164":"/static/bundles/es6/IGTVVideoUploadPageContainer.js/fa115ed1f9d6.js","165":"/static/bundles/es6/MobileDirectPage.js/6c4436d084b4.js","166":"/static/bundles/es6/DesktopDirectPage.js/bb913d4d4b05.js","167":"/static/bundles/es6/GuideModalEntrypoint.js/bc748d64c5e2.js","168":"/static/bundles/es6/GuidePage.js/dc4c36e539e8.js","169":"/static/bundles/es6/SavedCollectionPage.js/f76030e45fcc.js","170":"/static/bundles/es6/RestrictionDemoPage.js/c6ae48855161.js","171":"/static/bundles/es6/SentryBlockDemoPage.js/c0434ecc1366.js","172":"/static/bundles/es6/ChallengeInfoPage.js/20ae25aacf56.js","173":"/static/bundles/es6/EnforcementInfoHomePage.js/d3a42b686dc7.js","174":"/static/bundles/es6/OneTapUpsell.js/29f8e5c00fb3.js","175":"/static/bundles/es6/BirthdayLearnMorePage.js/fc25757def4d.js","176":"/static/bundles/es6/BirthdayAddBirthdayPage.js/75012b94e451.js","177":"/static/bundles/es6/AvenyMediumFont.js/155e5a30926a.js","178":"/static/bundles/es6/NametagLandingPage.js/65db15b24e74.js","179":"/static/bundles/es6/LocalDevTransactionToolSelectorPage.js/dd2ea1bb8d83.js","180":"/static/bundles/es6/FBEAppStoreErrorPage.js/3e986404fdb9.js","181":"/static/bundles/es6/BloksShellPage.js/46048a2acd9b.js","182":"/static/bundles/es6/BusinessCategoryPage.js/44acd0a649f0.js","184":"/static/bundles/es6/BloksPage.js/1eab0bca2bff.js","185":"/static/bundles/es6/ClipsAudioPage.js/421c0c00a662.js","186":"/static/bundles/es6/ClipsTabPage.js/fcf2a1057c16.js","187":"/static/bundles/es6/InfoSharingDisclaimerPage.js/d618008e1a04.js","188":"/static/bundles/es6/KeywordSearchExplorePage.js/a2948f29fa15.js","189":"/static/bundles/es6/LoggedOutPasswordResetPage.js/6ecf99e86318.js","190":"/static/bundles/es6/EmailRevokeWrongEmailPage.js/9fb084af4384.js","191":"/static/bundles/es6/IGLiteCarbonSideload.js/0d901d992a3d.js","192":"/static/bundles/es6/CreatorShopOnboardingWebView.js/dfc9e5ca2fe2.js","193":"/static/bundles/es6/AffiliateCreatorOnboardingWebView.js/6170042caa34.js","194":"/static/bundles/es6/SettingsMenuPage.js/4dbd208e7ce7.js","195":"/static/bundles/es6/ExploreMapPage.js/79dd9cb871ae.js","196":"/static/bundles/es6/InterAppRedirectPage.js/7cc06ec70099.js","197":"/static/bundles/es6/PaymentsPayPalRedirectPage.js/c4be05cdc952.js","198":"/static/bundles/es6/AccountPrivacyPage.js/04b40a156020.js","199":"/static/bundles/es6/PhoneConfirmPage.js/eed88a00f76a.js","200":"/static/bundles/es6/NewUserInterstitial.js/d67b4e8535ea.js","201":"/static/bundles/es6/AsyncBloksIGLineChartV2.js/6cefabc8d7e0.js","202":"/static/bundles/es6/Consumer.js/bc83c366fbf2.js","203":"/static/bundles/es6/Challenge.js/c79c6986d829.js","204":"/static/bundles/es6/NotificationLandingPage.js/08d01cd31e8f.js","220":"/static/bundles/es6/EmbedRich.js/315d51d69c28.js","221":"/static/bundles/es6/EmbedVideoWrapper.js/19ada2d50408.js","222":"/static/bundles/es6/EmbedSidecarEntrypoint.js/657900c87eb9.js","223":"/static/bundles/es6/EmbedGuideEntrypoint.js/1afedc77e7fa.js","224":"/static/bundles/es6/EmbedProfileEntrypoint.js/b371df29bae4.js","225":"/static/bundles/es6/EmbedAsyncLogger.js/604ab7cd8888.js"},"css":{"52":"/static/bundles/es6/DebugInfoNub.css/9806279ce814.css","56":"/static/bundles/es6/AvenyFont.css/25fd69ff2266.css","57":"/static/bundles/es6/StoriesDebugInfoNub.css/1994090560de.css","58":"/static/bundles/es6/DesktopStoriesPage.css/0ce6001dd912.css","59":"/static/bundles/es6/MobileStoriesPage.css/7ec2ed3f46ae.css","60":"/static/bundles/es6/ActivityFeedBox.css/9ec1633e9ba9.css","61":"/static/bundles/es6/MobileStoriesLoginPage.css/e61dd54632ff.css","62":"/static/bundles/es6/DesktopStoriesLoginPage.css/35bddc7c884e.css","63":"/static/bundles/es6/ActivityFeedPage.css/df6cd08dac7a.css","64":"/static/bundles/es6/AdsSettingsPage.css/ca6cdbeb3b56.css","65":"/static/bundles/es6/DonateCheckoutPage.css/a3c5d4cd6e9a.css","67":"/static/bundles/es6/FBPayConnectLearnMorePage.css/6efdeda42570.css","70":"/static/bundles/es6/CameraPage.css/995d56145986.css","71":"/static/bundles/es6/SettingsModules.css/40304dc4224b.css","72":"/static/bundles/es6/ContactHistoryPage.css/d0056a59b26a.css","73":"/static/bundles/es6/AccessToolPage.css/30b05ac779ed.css","74":"/static/bundles/es6/AccessToolViewAllPage.css/54a5c6cb1b36.css","75":"/static/bundles/es6/AccountPrivacyBugPage.css/b084aece73a3.css","76":"/static/bundles/es6/FirstPartyPlaintextPasswordLandingPage.css/d4c180511b0e.css","77":"/static/bundles/es6/ThirdPartyPlaintextPasswordLandingPage.css/d4c180511b0e.css","78":"/static/bundles/es6/ShoppingBagLandingPage.css/13a8fbf026fb.css","79":"/static/bundles/es6/PlaintextPasswordBugPage.css/d4c180511b0e.css","80":"/static/bundles/es6/PrivateAccountMadePublicBugPage.css/d4c180511b0e.css","81":"/static/bundles/es6/PublicAccountNotMadePrivateBugPage.css/d4c180511b0e.css","82":"/static/bundles/es6/BlockedAccountsBugPage.css/d4c180511b0e.css","83":"/static/bundles/es6/AndroidBetaPrivacyBugPage.css/158f7ff45015.css","84":"/static/bundles/es6/DataControlsSupportPage.css/7d84cae38f76.css","85":"/static/bundles/es6/DataDownloadRequestPage.css/dec5b3666f19.css","86":"/static/bundles/es6/DataDownloadRequestConfirmPage.css/34ec83ec7457.css","87":"/static/bundles/es6/CheckpointUnderageAppealPage.css/0dfde7fcc39c.css","88":"/static/bundles/es6/AccountRecoveryLandingPage.css/b881ef5abf23.css","89":"/static/bundles/es6/ParentalConsentPage.css/c5f1e68fdc65.css","90":"/static/bundles/es6/ParentalConsentNotParentPage.css/6308e4086754.css","91":"/static/bundles/es6/TermsAcceptPage.css/14b0bd420229.css","94":"/static/bundles/es6/TermsUnblockPage.css/a75f4ca6a7b3.css","95":"/static/bundles/es6/NewTermsConfirmPage.css/eefd956746e6.css","96":"/static/bundles/es6/CreationModules.css/d6d0275a2b8c.css","97":"/static/bundles/es6/StoryCreationPage.css/648990507536.css","98":"/static/bundles/es6/PostCommentInput.css/8d0bb5115761.css","99":"/static/bundles/es6/PostModalEntrypoint.css/6cf8077f53e4.css","100":"/static/bundles/es6/PostComments.css/2ce5c9d66b4a.css","101":"/static/bundles/es6/LikedByListContainer.css/afae07d29ddc.css","102":"/static/bundles/es6/CommentLikedByListContainer.css/afae07d29ddc.css","103":"/static/bundles/es6/DynamicExploreMediaPage.css/b5563fab09ad.css","104":"/static/bundles/es6/DiscoverPeoplePageContainer.css/593906d2aed9.css","106":"/static/bundles/es6/EmailReportBadPasswordResetPage.css/e4462019534b.css","107":"/static/bundles/es6/FBSignupPage.css/55ba8f05e763.css","108":"/static/bundles/es6/ReclaimAccountPage.css/d4c180511b0e.css","109":"/static/bundles/es6/MultiStepSignupPage.css/648c8626d660.css","110":"/static/bundles/es6/EmptyFeedPage.css/e9d19641bb15.css","111":"/static/bundles/es6/NewUserActivatorsUnit.css/f97addf4029d.css","112":"/static/bundles/es6/FeedEndSuggestedUserUnit.css/72dd9c4501f4.css","113":"/static/bundles/es6/FeedSidebarContainer.css/ee6be16499a1.css","114":"/static/bundles/es6/SuggestedUserFeedUnitContainer.css/1000d4df053e.css","115":"/static/bundles/es6/InFeedStoryTray.css/a5571cccec0e.css","116":"/static/bundles/es6/FeedPageContainer.css/fe2f77f2b145.css","117":"/static/bundles/es6/FollowListModal.css/ee62a427eb60.css","118":"/static/bundles/es6/FollowListPage.css/17ab35c802e9.css","119":"/static/bundles/es6/SimilarAccountsPage.css/f82826442120.css","120":"/static/bundles/es6/LiveBroadcastPage.css/a062843a8c25.css","121":"/static/bundles/es6/VotingInformationCenterPage.css/70cd56205b85.css","122":"/static/bundles/es6/WifiAuthLoginPage.css/f7561461b909.css","125":"/static/bundles/es6/LocationsDirectoryCountryPage.css/d9a8820cd0ec.css","126":"/static/bundles/es6/LocationsDirectoryCityPage.css/d9a8820cd0ec.css","127":"/static/bundles/es6/LocationPageContainer.css/dc86501186ec.css","128":"/static/bundles/es6/LocationsDirectoryLandingPage.css/e9743fdef94d.css","129":"/static/bundles/es6/LoginAndSignupPage.css/3ce984c47339.css","130":"/static/bundles/es6/FXCalDisclosurePage.css/a3e453e69f58.css","131":"/static/bundles/es6/FXCalLinkingAuthForm.css/23baa3a02454.css","132":"/static/bundles/es6/FXAuthLoginPage.css/ded4169aef48.css","133":"/static/bundles/es6/FXIABSettingsLoginPage.css/0462312e103c.css","134":"/static/bundles/es6/FXCalPasswordlessConfirmPasswordForm.css/07c5cb8975c1.css","135":"/static/bundles/es6/FXCalReauthLoginForm.css/187ea10a82bf.css","138":"/static/bundles/es6/UpdateIGAppForHelpPage.css/6fb2336f846b.css","139":"/static/bundles/es6/ResetPasswordPageContainer.css/d4c180511b0e.css","140":"/static/bundles/es6/MobileAllCommentsPage.css/6ac3f83a7809.css","141":"/static/bundles/es6/KeywordSearchExploreChainingPage.css/e264d4c81857.css","142":"/static/bundles/es6/MediaChainingPageContainer.css/bf2a790147c1.css","143":"/static/bundles/es6/PostPageContainer.css/aa5aab408183.css","144":"/static/bundles/es6/ProfilesDirectoryLandingPage.css/b406e80cc262.css","145":"/static/bundles/es6/HashtagsDirectoryLandingPage.css/b406e80cc262.css","146":"/static/bundles/es6/SuggestedDirectoryLandingPage.css/b406e80cc262.css","149":"/static/bundles/es6/ProductDetailsPage.css/8fc89e39de10.css","150":"/static/bundles/es6/ShoppingCartPage.css/4f156f96c1cc.css","151":"/static/bundles/es6/ShoppingDestinationLandingPage.css/beb9c8f65f5d.css","152":"/static/bundles/es6/ShoppingCartDetailsPage.css/e46b3f8df994.css","156":"/static/bundles/es6/ProfessionalConversionPage.css/fd5ed707a4ce.css","157":"/static/bundles/es6/TagPageContainer.css/0b1a10f6b2fc.css","158":"/static/bundles/es6/TwoFactorAuthenticationShell.css/ba3d6dfeee5b.css","160":"/static/bundles/es6/ProfilePageContainer.css/7c870849c831.css","161":"/static/bundles/es6/HttpErrorPage.css/e0fae2661c95.css","163":"/static/bundles/es6/IGTVVideoDraftsPage.css/d8d5106027bd.css","164":"/static/bundles/es6/IGTVVideoUploadPageContainer.css/7520383699bb.css","165":"/static/bundles/es6/MobileDirectPage.css/bb1e697491b8.css","166":"/static/bundles/es6/DesktopDirectPage.css/f031e6edf45a.css","168":"/static/bundles/es6/GuidePage.css/c4f81517b160.css","169":"/static/bundles/es6/SavedCollectionPage.css/c9307f5c771b.css","174":"/static/bundles/es6/OneTapUpsell.css/39d537c63ff6.css","176":"/static/bundles/es6/BirthdayAddBirthdayPage.css/61fbd6c67e77.css","177":"/static/bundles/es6/AvenyMediumFont.css/410fb2643dbe.css","178":"/static/bundles/es6/NametagLandingPage.css/0c3f6c69e197.css","179":"/static/bundles/es6/LocalDevTransactionToolSelectorPage.css/3f8f9bb4c8a7.css","180":"/static/bundles/es6/FBEAppStoreErrorPage.css/37c4f5efdab6.css","182":"/static/bundles/es6/BusinessCategoryPage.css/3f8017c957ee.css","184":"/static/bundles/es6/BloksPage.css/793257cbef02.css","185":"/static/bundles/es6/ClipsAudioPage.css/784bc409603f.css","186":"/static/bundles/es6/ClipsTabPage.css/4f7dc8c57720.css","187":"/static/bundles/es6/InfoSharingDisclaimerPage.css/014603d4e2f4.css","188":"/static/bundles/es6/KeywordSearchExplorePage.css/63eafec02761.css","189":"/static/bundles/es6/LoggedOutPasswordResetPage.css/ec5b6ca06fa9.css","191":"/static/bundles/es6/IGLiteCarbonSideload.css/1e5108197bda.css","195":"/static/bundles/es6/ExploreMapPage.css/06cf5e7b4874.css","196":"/static/bundles/es6/InterAppRedirectPage.css/d4c180511b0e.css","198":"/static/bundles/es6/AccountPrivacyPage.css/d4c180511b0e.css","199":"/static/bundles/es6/PhoneConfirmPage.css/b83c315af914.css","200":"/static/bundles/es6/NewUserInterstitial.css/80cd3dd40d64.css","202":"/static/bundles/es6/Consumer.css/45ecb935c0ed.css","203":"/static/bundles/es6/Challenge.css/20408754b827.css","204":"/static/bundles/es6/NotificationLandingPage.css/9b3a813e4d77.css","220":"/static/bundles/es6/EmbedRich.css/9dedcca0f077.css","221":"/static/bundles/es6/EmbedVideoWrapper.css/656cdc4c1ac0.css","222":"/static/bundles/es6/EmbedSidecarEntrypoint.css/530da609b6a7.css","223":"/static/bundles/es6/EmbedGuideEntrypoint.css/a72313815d8b.css","224":"/static/bundles/es6/EmbedProfileEntrypoint.css/dfd881c5cccf.css"}}</script>
  -->
 
</head>


    <body>
    
    <div id="header">
    <%@include file="/navbar.jsp" %>
    
</div>

<div id="detailPadding" style="padding-top: 100px"></div>
    
        <%
       int memSize = memList.size();
      %>

  <div id="mySpectrumList">
        <div id="react-root">
            <section class="_9eogI E3X2T">
                <div></div>
  
                <!-- 메인시작 -->
                  <main class="SCxLW o64aR" role="main">
                    <div class="v9tJq AAaSh VfzDr">
                        <header class="ys3F7">
                            <div class="eC4Dz">
                                <div class="RR-M-" aria-disabled="true" role="button" tabindex="-1">
                                    <canvas class="CfWVH" height="69" width="69" style="position: absolute; top: -7px; left: -7px; width: 91px; height: 91px;"></canvas>
                                    <span class="_2dbep" role="link" tabindex="-1" style="width: 77px; height: 77px;">
                                        <img
                                            alt=""
                                            class="_6q-tv"
                                            crossorigin="anonymous"
                                            data-testid="user-avatar"
                                            draggable="false"
                                            src="<%=request.getContextPath() %>/imeges/기본프로필.jpg"
                                        />
                             <!--       <form action="mySpectrumList.do" method="post">
                             <textarea id="summernote" name="content"></textarea>
                             <input type="submit" value="전송">
                           </form> - -->
                                    </span>
                                </div>
                            </div>
                            <section class="wW3k-">
                                <div class="XBGH5">
                           
<h6 class="g47SY lOXF2">닉네임</h6><h2 class="_7UhW9       fKFbl yUEEX   KV-D4              fDxYl     "><%=mv.getMemberNickname() %></h2><br>
<h6 class="g47SY lOXF2">MBTI</h6><h2 class="_7UhW9       fKFbl yUEEX   KV-D4              fDxYl     "><%=mv.getMbticode() %></h2><br>

<!-- <button type="button" onclick="location.href='myFriendsList.do';">MY FRIENDS</button><p> -->
 
  </p></div></section></header>
  
  <div class="QGPIr">
  <h6 class="g47SY lOXF2">아이디</h6><h2 class="Yk1V7"><%=mv.getMemberId() %></h2><br><br>
   <a class="_32eiM">
   <h4><%=mv.getMemberProfileimagepath()%></h4><br>
   </a></div>
   
   

                       <!-- 게시물 시작 -->
                        <ul class="_3dEHb">
                            <li class="LH36I">
                                <span class="_81NM2">게시물<span class="g47SY lOXF2"><%=memSize %></span></span>
                            </li>
                            <li class="LH36I">
                                <a class="_81NM2" href="myFriendsList.do" tabindex="0">FRIENDS LIST<span class="g47SY lOXF2" title="26"></span></a>
                            </li>
                           
                        </ul>
                        <div class="fx7hk" role="tablist">
                            <a aria-selected="true" class="_9VEo1 T-jvg" role="tab" href="/kimreo88/" tabindex="0">
                                <svg aria-label="게시물" class="_8-yf5" color="#0095f6" fill="#0095f6" height="24" role="img" viewBox="0 0 24 24" width="24">
                                    <rect fill="none" height="18" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" width="18" x="3" y="3"></rect>
                                    <line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="9.015" x2="9.015" y1="3" y2="21"></line>
                                    <line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="14.985" x2="14.985" y1="3" y2="21"></line>
                                    <line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="21" x2="3" y1="9.015" y2="9.015"></line>
                                    <line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="21" x2="3" y1="14.985" y2="14.985"></line>
                                </svg>
                            </a>
                            <a aria-selected="false" class="_9VEo1" role="tab" href="/kimreo88/tagged/" tabindex="0">
                                <svg aria-label="태그됨" class="_8-yf5" color="#8e8e8e" fill="#8e8e8e" height="24" role="img" viewBox="0 0 24 24" width="24">
                                    <path
                                        d="M10.201 3.797L12 1.997l1.799 1.8a1.59 1.59 0 001.124.465h5.259A1.818 1.818 0 0122 6.08v14.104a1.818 1.818 0 01-1.818 1.818H3.818A1.818 1.818 0 012 20.184V6.08a1.818 1.818 0 011.818-1.818h5.26a1.59 1.59 0 001.123-.465z"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                    ></path>
                                    <path d="M18.598 22.002V21.4a3.949 3.949 0 00-3.948-3.949H9.495A3.949 3.949 0 005.546 21.4v.603" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                                    <circle cx="12.072" cy="11.075" fill="none" r="3.556" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle>
                                </svg>
                            </a>
                        </div>
                        
                        
                        
                        
                        
                           <form action="myatcinsert.do" method="post" enctype="multipart/form-data">
      
      
   <%--    <input type="submit" value="프로필사진등록" id="insert">
    <button type="button" onclick="location.href='myatcinsert.do?memId=<%=memberId%>';">PROFILE UPDATE</button> --%>
                        
                        <% 
                        if(memSize == 0){  %>
                        <div class="_2z6nI">
                            <article class="ySN3v">
                                <div class="DPiy6 qF0y9 Igw0E rBNOH eGOV_ ybXk5 _4EzTm lC6p0 XTCZH">
                                    <div class="FuWoR -wdIA x7xX2" style="width: 44px; height: 44px;"><span aria-label="카메라" class="glyphsSpriteCamera__outline__24__grey_9 u-__7"></span></div>
                                    <div class="qF0y9 Igw0E IwRSH eGOV_ ui_ht lC6p0 HVWg4">
                                        <div class="qF0y9 Igw0E IwRSH eGOV_ _4EzTm XTCZH"><div class="_7UhW9 xLCgt qyrsm KV-D4 uL8Hv">게시물 없음</div></div>
                                        <div class="qF0y9 Igw0E IwRSH eGOV_ _4EzTm XTCZH"><div class="_7UhW9 xLCgt MMzan _0PwGv uL8Hv"><%=mv.getMemberNickname() %>님이 게시하는 사진과 동영상이 여기에 표시됩니다.</div></div>
                                    </div>
                                </div>
                                <hr class="W4P49" />
                               <div class="       tHaIX      qF0y9          Igw0E     IwRSH      eGOV_        vwCYk                                                                                                 HcJZg              ">
                         </div>
                         </article>
                         </div>
                         <%
                         }
                         %>
          
          
                        </div>
                    </div>
                </main>










       <%
      memSize = memList.size();
      if(memSize > 0){
         for(int i=0; i<memSize; i++){
            if(memList.get(i).getMemberId().equals(memberId)){
      %>
   

 <div class="card">
  <div class="card-body">
 <!--    <h4 class="card-title">Card title</h4>
    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
     -->
     
   <%--  <a href="mySpectrumDetail.do?postNum=<%=memList.get(i).getSpecbrdSrlnmbr()%>" class="card-link"><%= memList.get(i).getSpecbrdCn()%></a>  --%>
   
  </div>
   </div>

   

      <%
            }
         }
      }
      %>


   








































   <script type="text/javascript">

$("#friend").click(function(){

     $.ajax({
             type : 'get'
            ,url : "/Spectrum/friendinsert.jsp"      //요청
            ,dataType : 'html'  
            ,data : {requestId : "<%=memList.get(0).getMemberId()%>"}  //응답(필수)
            ,success : function(data){
             
            }   //응답(필수)
            ,error : function(xhr){
               alert("상태 >> " + xhr.status);
            }                  //응답(필수)
            });
           });



</script>
   
</body>
</html>