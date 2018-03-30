--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Storage;
with Windows.Foundation.Collections;
limited with Windows.Globalization;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.System.UserProfile is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AccountPictureKind is (
      SmallImage,
      LargeImage,
      Video
   );
   for AccountPictureKind use (
      SmallImage => 0,
      LargeImage => 1,
      Video => 2
   );
   for AccountPictureKind'Size use 32;
   
   type AccountPictureKind_Ptr is access AccountPictureKind;
   
   type SetAccountPictureResult is (
      Success,
      ChangeDisabled,
      LargeOrDynamicError,
      VideoFrameSizeError,
      FileSizeError,
      Failure
   );
   for SetAccountPictureResult use (
      Success => 0,
      ChangeDisabled => 1,
      LargeOrDynamicError => 2,
      VideoFrameSizeError => 3,
      FileSizeError => 4,
      Failure => 5
   );
   for SetAccountPictureResult'Size use 32;
   
   type SetAccountPictureResult_Ptr is access SetAccountPictureResult;
   
   type SetImageFeedResult is (
      Success,
      ChangeDisabled,
      UserCanceled
   );
   for SetImageFeedResult use (
      Success => 0,
      ChangeDisabled => 1,
      UserCanceled => 2
   );
   for SetImageFeedResult'Size use 32;
   
   type SetImageFeedResult_Ptr is access SetImageFeedResult;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type UserProfileContract is null record;
   pragma Convention (C_Pass_By_Copy , UserProfileContract);
   
   type UserProfileContract_Ptr is access UserProfileContract;
   
   type UserProfileLockScreenContract is null record;
   pragma Convention (C_Pass_By_Copy , UserProfileLockScreenContract);
   
   type UserProfileLockScreenContract_Ptr is access UserProfileLockScreenContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_SetAccountPictureResult_Interface;
   type AsyncOperationCompletedHandler_SetAccountPictureResult is access all AsyncOperationCompletedHandler_SetAccountPictureResult_Interface'Class;
   type AsyncOperationCompletedHandler_SetAccountPictureResult_Ptr is access all AsyncOperationCompletedHandler_SetAccountPictureResult;
   type AsyncOperationCompletedHandler_SetImageFeedResult_Interface;
   type AsyncOperationCompletedHandler_SetImageFeedResult is access all AsyncOperationCompletedHandler_SetImageFeedResult_Interface'Class;
   type AsyncOperationCompletedHandler_SetImageFeedResult_Ptr is access all AsyncOperationCompletedHandler_SetImageFeedResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAdvertisingManagerStatics_Interface;
   type IAdvertisingManagerStatics is access all IAdvertisingManagerStatics_Interface'Class;
   type IAdvertisingManagerStatics_Ptr is access all IAdvertisingManagerStatics;
   type IAdvertisingManagerForUser_Interface;
   type IAdvertisingManagerForUser is access all IAdvertisingManagerForUser_Interface'Class;
   type IAdvertisingManagerForUser_Ptr is access all IAdvertisingManagerForUser;
   type IAdvertisingManagerStatics2_Interface;
   type IAdvertisingManagerStatics2 is access all IAdvertisingManagerStatics2_Interface'Class;
   type IAdvertisingManagerStatics2_Ptr is access all IAdvertisingManagerStatics2;
   type IDiagnosticsSettingsStatics_Interface;
   type IDiagnosticsSettingsStatics is access all IDiagnosticsSettingsStatics_Interface'Class;
   type IDiagnosticsSettingsStatics_Ptr is access all IDiagnosticsSettingsStatics;
   type IDiagnosticsSettings_Interface;
   type IDiagnosticsSettings is access all IDiagnosticsSettings_Interface'Class;
   type IDiagnosticsSettings_Ptr is access all IDiagnosticsSettings;
   type IUserProfilePersonalizationSettings_Interface;
   type IUserProfilePersonalizationSettings is access all IUserProfilePersonalizationSettings_Interface'Class;
   type IUserProfilePersonalizationSettings_Ptr is access all IUserProfilePersonalizationSettings;
   type IUserProfilePersonalizationSettingsStatics_Interface;
   type IUserProfilePersonalizationSettingsStatics is access all IUserProfilePersonalizationSettingsStatics_Interface'Class;
   type IUserProfilePersonalizationSettingsStatics_Ptr is access all IUserProfilePersonalizationSettingsStatics;
   type IGlobalizationPreferencesStatics_Interface;
   type IGlobalizationPreferencesStatics is access all IGlobalizationPreferencesStatics_Interface'Class;
   type IGlobalizationPreferencesStatics_Ptr is access all IGlobalizationPreferencesStatics;
   type IGlobalizationPreferencesStatics2_Interface;
   type IGlobalizationPreferencesStatics2 is access all IGlobalizationPreferencesStatics2_Interface'Class;
   type IGlobalizationPreferencesStatics2_Ptr is access all IGlobalizationPreferencesStatics2;
   type IFirstSignInSettings_Interface;
   type IFirstSignInSettings is access all IFirstSignInSettings_Interface'Class;
   type IFirstSignInSettings_Ptr is access all IFirstSignInSettings;
   type IFirstSignInSettingsStatics_Interface;
   type IFirstSignInSettingsStatics is access all IFirstSignInSettingsStatics_Interface'Class;
   type IFirstSignInSettingsStatics_Ptr is access all IFirstSignInSettingsStatics;
   type IMapView_String_Object_Interface;
   type IMapView_String_Object is access all IMapView_String_Object_Interface'Class;
   type IMapView_String_Object_Ptr is access all IMapView_String_Object;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type IUserInformationStatics_Interface;
   type IUserInformationStatics is access all IUserInformationStatics_Interface'Class;
   type IUserInformationStatics_Ptr is access all IUserInformationStatics;
   type ILockScreenStatics_Interface;
   type ILockScreenStatics is access all ILockScreenStatics_Interface'Class;
   type ILockScreenStatics_Ptr is access all ILockScreenStatics;
   type ILockScreenImageFeedStatics_Interface;
   type ILockScreenImageFeedStatics is access all ILockScreenImageFeedStatics_Interface'Class;
   type ILockScreenImageFeedStatics_Ptr is access all ILockScreenImageFeedStatics;
   type IAsyncOperation_SetAccountPictureResult_Interface;
   type IAsyncOperation_SetAccountPictureResult is access all IAsyncOperation_SetAccountPictureResult_Interface'Class;
   type IAsyncOperation_SetAccountPictureResult_Ptr is access all IAsyncOperation_SetAccountPictureResult;
   type IAsyncOperation_SetImageFeedResult_Interface;
   type IAsyncOperation_SetImageFeedResult is access all IAsyncOperation_SetImageFeedResult_Interface'Class;
   type IAsyncOperation_SetImageFeedResult_Ptr is access all IAsyncOperation_SetImageFeedResult;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IAdvertisingManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AdvertisingId
   (
      This       : access IAdvertisingManagerStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdvertisingManagerStatics : aliased constant Windows.IID := (2916304524, 41587, 18635, (179, 70, 53, 68, 82, 45, 85, 129 ));
   
   ------------------------------------------------------------------------
   type IAdvertisingManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AdvertisingId
   (
      This       : access IAdvertisingManagerForUser_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IAdvertisingManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdvertisingManagerForUser : aliased constant Windows.IID := (2458645456, 53116, 19120, (167, 220, 109, 197, 188, 212, 66, 82 ));
   
   ------------------------------------------------------------------------
   type IAdvertisingManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IAdvertisingManagerStatics2_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.System.UserProfile.IAdvertisingManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IAdvertisingManagerStatics2 : aliased constant Windows.IID := (3708372911, 6765, 18096, (149, 188, 243, 249, 214, 190, 185, 251 ));
   
   ------------------------------------------------------------------------
   type IDiagnosticsSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IDiagnosticsSettingsStatics_Interface
      ; RetVal : access Windows.System.UserProfile.IDiagnosticsSettings
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IDiagnosticsSettingsStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.System.UserProfile.IDiagnosticsSettings
   )
   return Windows.HRESULT is abstract;
   
   IID_IDiagnosticsSettingsStatics : aliased constant Windows.IID := (1926424591, 21392, 18323, (153, 11, 60, 204, 125, 106, 201, 200 ));
   
   ------------------------------------------------------------------------
   type IDiagnosticsSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanUseDiagnosticsToTailorExperiences
   (
      This       : access IDiagnosticsSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IDiagnosticsSettings_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IDiagnosticsSettings : aliased constant Windows.IID := (3857312973, 10001, 17632, (151, 60, 73, 29, 120, 4, 141, 36 ));
   
   ------------------------------------------------------------------------
   type IUserProfilePersonalizationSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function TrySetLockScreenImageAsync
   (
      This       : access IUserProfilePersonalizationSettings_Interface
      ; imageFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetWallpaperImageAsync
   (
      This       : access IUserProfilePersonalizationSettings_Interface
      ; imageFile : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserProfilePersonalizationSettings : aliased constant Windows.IID := (2364398260, 31128, 18133, (141, 211, 24, 79, 28, 95, 154, 185 ));
   
   ------------------------------------------------------------------------
   type IUserProfilePersonalizationSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IUserProfilePersonalizationSettingsStatics_Interface
      ; RetVal : access Windows.System.UserProfile.IUserProfilePersonalizationSettings
   )
   return Windows.HRESULT is abstract;
   
   function IsSupported
   (
      This       : access IUserProfilePersonalizationSettingsStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserProfilePersonalizationSettingsStatics : aliased constant Windows.IID := (2444015681, 20535, 17739, (152, 131, 187, 119, 45, 8, 221, 22 ));
   
   ------------------------------------------------------------------------
   type IGlobalizationPreferencesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Calendars
   (
      This       : access IGlobalizationPreferencesStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Clocks
   (
      This       : access IGlobalizationPreferencesStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Currencies
   (
      This       : access IGlobalizationPreferencesStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Languages
   (
      This       : access IGlobalizationPreferencesStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HomeGeographicRegion
   (
      This       : access IGlobalizationPreferencesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WeekStartsOn
   (
      This       : access IGlobalizationPreferencesStatics_Interface
      ; RetVal : access Windows.Globalization.DayOfWeek
   )
   return Windows.HRESULT is abstract;
   
   IID_IGlobalizationPreferencesStatics : aliased constant Windows.IID := (29311782, 60727, 20118, (176, 233, 193, 52, 13, 30, 161, 88 ));
   
   ------------------------------------------------------------------------
   type IGlobalizationPreferencesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function TrySetHomeGeographicRegion
   (
      This       : access IGlobalizationPreferencesStatics2_Interface
      ; region : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TrySetLanguages
   (
      This       : access IGlobalizationPreferencesStatics2_Interface
      ; languageTags : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IGlobalizationPreferencesStatics2 : aliased constant Windows.IID := (4241393137, 17152, 19664, (156, 172, 26, 142, 123, 126, 24, 244 ));
   
   ------------------------------------------------------------------------
   type IFirstSignInSettings_Interface is interface and Windows.IInspectable_Interface;
   
   IID_IFirstSignInSettings : aliased constant Windows.IID := (1049907539, 14942, 17710, (166, 1, 245, 186, 173, 42, 72, 112 ));
   
   ------------------------------------------------------------------------
   type IFirstSignInSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IFirstSignInSettingsStatics_Interface
      ; RetVal : access Windows.System.UserProfile.IFirstSignInSettings
   )
   return Windows.HRESULT is abstract;
   
   IID_IFirstSignInSettingsStatics : aliased constant Windows.IID := (484544271, 7233, 20128, (183, 162, 111, 12, 28, 126, 132, 56 ));
   
   ------------------------------------------------------------------------
   type IMapView_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_String_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_String_Object_Interface
      ; first : access Windows.Object
      ; second : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   IID_IMapView_String_Object : aliased constant Windows.IID := (3145224234, 63389, 21754, (146, 201, 144, 197, 3, 159, 223, 126 ));
   
   ------------------------------------------------------------------------
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IUserInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AccountPictureChangeEnabled
   (
      This       : access IUserInformationStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NameAccessAllowed
   (
      This       : access IUserInformationStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetAccountPicture
   (
      This       : access IUserInformationStatics_Interface
      ; kind : Windows.System.UserProfile.AccountPictureKind
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function SetAccountPictureAsync
   (
      This       : access IUserInformationStatics_Interface
      ; image : Windows.Storage.IStorageFile
      ; RetVal : access Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetAccountPicturesAsync
   (
      This       : access IUserInformationStatics_Interface
      ; smallImage : Windows.Storage.IStorageFile
      ; largeImage : Windows.Storage.IStorageFile
      ; video : Windows.Storage.IStorageFile
      ; RetVal : access Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetAccountPictureFromStreamAsync
   (
      This       : access IUserInformationStatics_Interface
      ; image : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetAccountPicturesFromStreamsAsync
   (
      This       : access IUserInformationStatics_Interface
      ; smallImage : Windows.Storage.Streams.IRandomAccessStream
      ; largeImage : Windows.Storage.Streams.IRandomAccessStream
      ; video : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_AccountPictureChanged
   (
      This       : access IUserInformationStatics_Interface
      ; changeHandler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccountPictureChanged
   (
      This       : access IUserInformationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetDisplayNameAsync
   (
      This       : access IUserInformationStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFirstNameAsync
   (
      This       : access IUserInformationStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetLastNameAsync
   (
      This       : access IUserInformationStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPrincipalNameAsync
   (
      This       : access IUserInformationStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSessionInitiationProtocolUriAsync
   (
      This       : access IUserInformationStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDomainNameAsync
   (
      This       : access IUserInformationStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserInformationStatics : aliased constant Windows.IID := (2012457232, 18682, 18588, (147, 78, 42, 232, 91, 168, 247, 114 ));
   
   ------------------------------------------------------------------------
   type ILockScreenStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OriginalImageFile
   (
      This       : access ILockScreenStatics_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function GetImageStream
   (
      This       : access ILockScreenStatics_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function SetImageFileAsync
   (
      This       : access ILockScreenStatics_Interface
      ; value : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetImageStreamAsync
   (
      This       : access ILockScreenStatics_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_ILockScreenStatics : aliased constant Windows.IID := (1055511469, 46599, 16558, (180, 38, 118, 49, 217, 130, 18, 105 ));
   
   ------------------------------------------------------------------------
   type ILockScreenImageFeedStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestSetImageFeedAsync
   (
      This       : access ILockScreenImageFeedStatics_Interface
      ; syndicationFeedUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.System.UserProfile.IAsyncOperation_SetImageFeedResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryRemoveImageFeed
   (
      This       : access ILockScreenImageFeedStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ILockScreenImageFeedStatics : aliased constant Windows.IID := (739079158, 937, 16806, (155, 1, 73, 82, 81, 255, 81, 213 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_SetAccountPictureResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SetAccountPictureResult_Interface
      ; handler : Windows.System.UserProfile.AsyncOperationCompletedHandler_SetAccountPictureResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SetAccountPictureResult_Interface
      ; RetVal : access Windows.System.UserProfile.AsyncOperationCompletedHandler_SetAccountPictureResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SetAccountPictureResult_Interface
      ; RetVal : access Windows.System.UserProfile.SetAccountPictureResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_SetAccountPictureResult : aliased constant Windows.IID := (1745478662, 27963, 20836, (143, 50, 184, 69, 176, 120, 20, 5 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_SetImageFeedResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SetImageFeedResult_Interface
      ; handler : Windows.System.UserProfile.AsyncOperationCompletedHandler_SetImageFeedResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SetImageFeedResult_Interface
      ; RetVal : access Windows.System.UserProfile.AsyncOperationCompletedHandler_SetImageFeedResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SetImageFeedResult_Interface
      ; RetVal : access Windows.System.UserProfile.SetImageFeedResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_SetImageFeedResult : aliased constant Windows.IID := (1398915017, 1856, 21578, (151, 151, 31, 254, 94, 115, 197, 78 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_SetAccountPictureResult_Interface(Callback : access procedure (asyncInfo : Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_SetAccountPictureResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SetAccountPictureResult_Interface
      ; asyncInfo : Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_SetAccountPictureResult : aliased constant Windows.IID := (1614757425, 31313, 20876, (146, 128, 193, 136, 234, 66, 19, 216 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_SetImageFeedResult_Interface(Callback : access procedure (asyncInfo : Windows.System.UserProfile.IAsyncOperation_SetImageFeedResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_SetImageFeedResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SetImageFeedResult_Interface
      ; asyncInfo : Windows.System.UserProfile.IAsyncOperation_SetImageFeedResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_SetImageFeedResult : aliased constant Windows.IID := (4061426458, 4869, 23364, (147, 44, 175, 154, 30, 77, 120, 201 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AdvertisingManagerForUser is Windows.System.UserProfile.IAdvertisingManagerForUser;
   subtype DiagnosticsSettings is Windows.System.UserProfile.IDiagnosticsSettings;
   subtype UserProfilePersonalizationSettings is Windows.System.UserProfile.IUserProfilePersonalizationSettings;
   subtype FirstSignInSettings is Windows.System.UserProfile.IFirstSignInSettings;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.System.UserProfile.IAdvertisingManagerForUser;
   
   function get_AdvertisingId
   return Windows.String;
   
   function GetDefault
   return Windows.System.UserProfile.IDiagnosticsSettings;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.System.UserProfile.IDiagnosticsSettings;
   
   function get_Current
   return Windows.System.UserProfile.IUserProfilePersonalizationSettings;
   
   function IsSupported
   return Windows.Boolean;
   
   function get_Calendars
   return Windows.Foundation.Collections.IVectorView_String;
   
   function get_Clocks
   return Windows.Foundation.Collections.IVectorView_String;
   
   function get_Currencies
   return Windows.Foundation.Collections.IVectorView_String;
   
   function get_Languages
   return Windows.Foundation.Collections.IVectorView_String;
   
   function get_HomeGeographicRegion
   return Windows.String;
   
   function get_WeekStartsOn
   return Windows.Globalization.DayOfWeek;
   
   function TrySetHomeGeographicRegion
   (
      region : Windows.String
   )
   return Windows.Boolean;
   
   function TrySetLanguages
   (
      languageTags : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Boolean;
   
   function GetDefault
   return Windows.System.UserProfile.IFirstSignInSettings;
   
   function get_AccountPictureChangeEnabled
   return Windows.Boolean;
   
   function get_NameAccessAllowed
   return Windows.Boolean;
   
   function GetAccountPicture
   (
      kind : Windows.System.UserProfile.AccountPictureKind
   )
   return Windows.Storage.IStorageFile;
   
   function SetAccountPictureAsync
   (
      image : Windows.Storage.IStorageFile
   )
   return Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult;
   
   function SetAccountPicturesAsync
   (
      smallImage : Windows.Storage.IStorageFile
      ; largeImage : Windows.Storage.IStorageFile
      ; video : Windows.Storage.IStorageFile
   )
   return Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult;
   
   function SetAccountPictureFromStreamAsync
   (
      image : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult;
   
   function SetAccountPicturesFromStreamsAsync
   (
      smallImage : Windows.Storage.Streams.IRandomAccessStream
      ; largeImage : Windows.Storage.Streams.IRandomAccessStream
      ; video : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult;
   
   function add_AccountPictureChanged
   (
      changeHandler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_AccountPictureChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function GetDisplayNameAsync
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetFirstNameAsync
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetLastNameAsync
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetPrincipalNameAsync
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetSessionInitiationProtocolUriAsync
   return Windows.Foundation.IAsyncOperation_IUriRuntimeClass;
   
   function GetDomainNameAsync
   return Windows.Foundation.IAsyncOperation_String;
   
   function RequestSetImageFeedAsync
   (
      syndicationFeedUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.System.UserProfile.IAsyncOperation_SetImageFeedResult;
   
   function TryRemoveImageFeed
   return Windows.Boolean;
   
   function get_OriginalImageFile
   return Windows.Foundation.IUriRuntimeClass;
   
   function GetImageStream
   return Windows.Storage.Streams.IRandomAccessStream;
   
   function SetImageFileAsync
   (
      value : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction;
   
   function SetImageStreamAsync
   (
      value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Foundation.IAsyncAction;

end;
