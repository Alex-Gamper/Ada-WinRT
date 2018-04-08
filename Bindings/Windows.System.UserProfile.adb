--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.System;
with Windows.Storage;
with Windows.Globalization;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.UserProfile is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SetAccountPictureResult_Interface
      ; asyncInfo : Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SetImageFeedResult_Interface
      ; asyncInfo : Windows.System.UserProfile.IAsyncOperation_SetImageFeedResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.System.UserProfile.IAdvertisingManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.AdvertisingManager");
      m_Factory     : IAdvertisingManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IAdvertisingManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdvertisingManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AdvertisingId
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.AdvertisingManager");
      m_Factory     : IAdvertisingManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdvertisingManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AdvertisingId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.System.UserProfile.IDiagnosticsSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.DiagnosticsSettings");
      m_Factory     : IDiagnosticsSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IDiagnosticsSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDiagnosticsSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.System.UserProfile.IDiagnosticsSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.DiagnosticsSettings");
      m_Factory     : IDiagnosticsSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IDiagnosticsSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDiagnosticsSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Current
   return Windows.System.UserProfile.IUserProfilePersonalizationSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserProfilePersonalizationSettings");
      m_Factory     : IUserProfilePersonalizationSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IUserProfilePersonalizationSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserProfilePersonalizationSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserProfilePersonalizationSettings");
      m_Factory     : IUserProfilePersonalizationSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserProfilePersonalizationSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Calendars
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.GlobalizationPreferences");
      m_Factory     : IGlobalizationPreferencesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGlobalizationPreferencesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Calendars(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Clocks
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.GlobalizationPreferences");
      m_Factory     : IGlobalizationPreferencesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGlobalizationPreferencesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Clocks(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Currencies
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.GlobalizationPreferences");
      m_Factory     : IGlobalizationPreferencesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGlobalizationPreferencesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Currencies(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Languages
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.GlobalizationPreferences");
      m_Factory     : IGlobalizationPreferencesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGlobalizationPreferencesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Languages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HomeGeographicRegion
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.GlobalizationPreferences");
      m_Factory     : IGlobalizationPreferencesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGlobalizationPreferencesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HomeGeographicRegion(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WeekStartsOn
   return Windows.Globalization.DayOfWeek is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.GlobalizationPreferences");
      m_Factory     : IGlobalizationPreferencesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.DayOfWeek;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGlobalizationPreferencesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WeekStartsOn(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TrySetHomeGeographicRegion
   (
      region : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.GlobalizationPreferences");
      m_Factory     : IGlobalizationPreferencesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGlobalizationPreferencesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetHomeGeographicRegion(region, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TrySetLanguages
   (
      languageTags : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.GlobalizationPreferences");
      m_Factory     : IGlobalizationPreferencesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGlobalizationPreferencesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetLanguages(languageTags, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.System.UserProfile.IFirstSignInSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.FirstSignInSettings");
      m_Factory     : IFirstSignInSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IFirstSignInSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFirstSignInSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AccountPictureChangeEnabled
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AccountPictureChangeEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NameAccessAllowed
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NameAccessAllowed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAccountPicture
   (
      kind : Windows.System.UserProfile.AccountPictureKind
   )
   return Windows.Storage.IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAccountPicture(kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetAccountPictureAsync
   (
      image : Windows.Storage.IStorageFile
   )
   return Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAccountPictureAsync(image, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetAccountPicturesAsync
   (
      smallImage : Windows.Storage.IStorageFile
      ; largeImage : Windows.Storage.IStorageFile
      ; video : Windows.Storage.IStorageFile
   )
   return Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAccountPicturesAsync(smallImage, largeImage, video, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetAccountPictureFromStreamAsync
   (
      image : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAccountPictureFromStreamAsync(image, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetAccountPicturesFromStreamsAsync
   (
      smallImage : Windows.Storage.Streams.IRandomAccessStream
      ; largeImage : Windows.Storage.Streams.IRandomAccessStream
      ; video : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IAsyncOperation_SetAccountPictureResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAccountPicturesFromStreamsAsync(smallImage, largeImage, video, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_AccountPictureChanged
   (
      changeHandler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_AccountPictureChanged(changeHandler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_AccountPictureChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_AccountPictureChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetDisplayNameAsync
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDisplayNameAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFirstNameAsync
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFirstNameAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLastNameAsync
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLastNameAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPrincipalNameAsync
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPrincipalNameAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSessionInitiationProtocolUriAsync
   return Windows.Foundation.IAsyncOperation_IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_IUriRuntimeClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSessionInitiationProtocolUriAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDomainNameAsync
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.UserInformation");
      m_Factory     : IUserInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDomainNameAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestSetImageFeedAsync
   (
      syndicationFeedUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.System.UserProfile.IAsyncOperation_SetImageFeedResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.LockScreen");
      m_Factory     : ILockScreenImageFeedStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.UserProfile.IAsyncOperation_SetImageFeedResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILockScreenImageFeedStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestSetImageFeedAsync(syndicationFeedUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryRemoveImageFeed
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.LockScreen");
      m_Factory     : ILockScreenImageFeedStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILockScreenImageFeedStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryRemoveImageFeed(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OriginalImageFile
   return Windows.Foundation.IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.LockScreen");
      m_Factory     : ILockScreenStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IUriRuntimeClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILockScreenStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OriginalImageFile(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetImageStream
   return Windows.Storage.Streams.IRandomAccessStream is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.LockScreen");
      m_Factory     : ILockScreenStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IRandomAccessStream;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILockScreenStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetImageStream(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetImageFileAsync
   (
      value : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.LockScreen");
      m_Factory     : ILockScreenStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILockScreenStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetImageFileAsync(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetImageStreamAsync
   (
      value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.UserProfile.LockScreen");
      m_Factory     : ILockScreenStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILockScreenStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetImageStreamAsync(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
