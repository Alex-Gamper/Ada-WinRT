--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Storage.Streams;
limited with Windows.Security.Cryptography.Core;
limited with Windows.System;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Security.Credentials is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type KeyCredentialStatus is (
      Success,
      UnknownError,
      NotFound,
      UserCanceled,
      UserPrefersPassword,
      CredentialAlreadyExists,
      SecurityDeviceLocked
   );
   for KeyCredentialStatus use (
      Success => 0,
      UnknownError => 1,
      NotFound => 2,
      UserCanceled => 3,
      UserPrefersPassword => 4,
      CredentialAlreadyExists => 5,
      SecurityDeviceLocked => 6
   );
   for KeyCredentialStatus'Size use 32;
   
   type KeyCredentialStatus_Ptr is access KeyCredentialStatus;
   
   type KeyCredentialAttestationStatus is (
      Success,
      UnknownError,
      NotSupported,
      TemporaryFailure
   );
   for KeyCredentialAttestationStatus use (
      Success => 0,
      UnknownError => 1,
      NotSupported => 2,
      TemporaryFailure => 3
   );
   for KeyCredentialAttestationStatus'Size use 32;
   
   type KeyCredentialAttestationStatus_Ptr is access KeyCredentialAttestationStatus;
   
   type KeyCredentialCreationOption is (
      ReplaceExisting,
      FailIfExists
   );
   for KeyCredentialCreationOption use (
      ReplaceExisting => 0,
      FailIfExists => 1
   );
   for KeyCredentialCreationOption'Size use 32;
   
   type KeyCredentialCreationOption_Ptr is access KeyCredentialCreationOption;
   
   type WebAccountState is (
      None,
      Connected,
      Error
   );
   for WebAccountState use (
      None => 0,
      Connected => 1,
      Error => 2
   );
   for WebAccountState'Size use 32;
   
   type WebAccountState_Ptr is access WebAccountState;
   
   type WebAccountPictureSize is (
      Size64x64,
      Size208x208,
      Size424x424,
      Size1080x1080
   );
   for WebAccountPictureSize use (
      Size64x64 => 64,
      Size208x208 => 208,
      Size424x424 => 424,
      Size1080x1080 => 1080
   );
   for WebAccountPictureSize'Size use 32;
   
   type WebAccountPictureSize_Ptr is access WebAccountPictureSize;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult_Interface;
   type AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult is access all AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult_Interface'Class;
   type AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult_Ptr is access all AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult;
   type AsyncOperationCompletedHandler_IKeyCredentialOperationResult_Interface;
   type AsyncOperationCompletedHandler_IKeyCredentialOperationResult is access all AsyncOperationCompletedHandler_IKeyCredentialOperationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IKeyCredentialOperationResult_Ptr is access all AsyncOperationCompletedHandler_IKeyCredentialOperationResult;
   type AsyncOperationCompletedHandler_IKeyCredentialAttestationResult_Interface;
   type AsyncOperationCompletedHandler_IKeyCredentialAttestationResult is access all AsyncOperationCompletedHandler_IKeyCredentialAttestationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IKeyCredentialAttestationResult_Ptr is access all AsyncOperationCompletedHandler_IKeyCredentialAttestationResult;
   type AsyncOperationCompletedHandler_IWebAccount_Interface;
   type AsyncOperationCompletedHandler_IWebAccount is access all AsyncOperationCompletedHandler_IWebAccount_Interface'Class;
   type AsyncOperationCompletedHandler_IWebAccount_Ptr is access all AsyncOperationCompletedHandler_IWebAccount;
   type AsyncOperationCompletedHandler_IWebAccountProvider_Interface;
   type AsyncOperationCompletedHandler_IWebAccountProvider is access all AsyncOperationCompletedHandler_IWebAccountProvider_Interface'Class;
   type AsyncOperationCompletedHandler_IWebAccountProvider_Ptr is access all AsyncOperationCompletedHandler_IWebAccountProvider;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IKeyCredentialManagerStatics_Interface;
   type IKeyCredentialManagerStatics is access all IKeyCredentialManagerStatics_Interface'Class;
   type IKeyCredentialManagerStatics_Ptr is access all IKeyCredentialManagerStatics;
   type IKeyCredential_Interface;
   type IKeyCredential is access all IKeyCredential_Interface'Class;
   type IKeyCredential_Ptr is access all IKeyCredential;
   type IKeyCredentialRetrievalResult_Interface;
   type IKeyCredentialRetrievalResult is access all IKeyCredentialRetrievalResult_Interface'Class;
   type IKeyCredentialRetrievalResult_Ptr is access all IKeyCredentialRetrievalResult;
   type IKeyCredentialOperationResult_Interface;
   type IKeyCredentialOperationResult is access all IKeyCredentialOperationResult_Interface'Class;
   type IKeyCredentialOperationResult_Ptr is access all IKeyCredentialOperationResult;
   type IKeyCredentialAttestationResult_Interface;
   type IKeyCredentialAttestationResult is access all IKeyCredentialAttestationResult_Interface'Class;
   type IKeyCredentialAttestationResult_Ptr is access all IKeyCredentialAttestationResult;
   type IWebAccountFactory_Interface;
   type IWebAccountFactory is access all IWebAccountFactory_Interface'Class;
   type IWebAccountFactory_Ptr is access all IWebAccountFactory;
   type IWebAccount_Interface;
   type IWebAccount is access all IWebAccount_Interface'Class;
   type IWebAccount_Ptr is access all IWebAccount;
   type IWebAccount2_Interface;
   type IWebAccount2 is access all IWebAccount2_Interface'Class;
   type IWebAccount2_Ptr is access all IWebAccount2;
   type IWebAccountProviderFactory_Interface;
   type IWebAccountProviderFactory is access all IWebAccountProviderFactory_Interface'Class;
   type IWebAccountProviderFactory_Ptr is access all IWebAccountProviderFactory;
   type IWebAccountProvider_Interface;
   type IWebAccountProvider is access all IWebAccountProvider_Interface'Class;
   type IWebAccountProvider_Ptr is access all IWebAccountProvider;
   type IWebAccountProvider2_Interface;
   type IWebAccountProvider2 is access all IWebAccountProvider2_Interface'Class;
   type IWebAccountProvider2_Ptr is access all IWebAccountProvider2;
   type IWebAccountProvider3_Interface;
   type IWebAccountProvider3 is access all IWebAccountProvider3_Interface'Class;
   type IWebAccountProvider3_Ptr is access all IWebAccountProvider3;
   type IWebAccountProvider4_Interface;
   type IWebAccountProvider4 is access all IWebAccountProvider4_Interface'Class;
   type IWebAccountProvider4_Ptr is access all IWebAccountProvider4;
   type IPasswordCredential_Interface;
   type IPasswordCredential is access all IPasswordCredential_Interface'Class;
   type IPasswordCredential_Ptr is access all IPasswordCredential;
   type ICredentialFactory_Interface;
   type ICredentialFactory is access all ICredentialFactory_Interface'Class;
   type ICredentialFactory_Ptr is access all ICredentialFactory;
   type IPasswordVault_Interface;
   type IPasswordVault is access all IPasswordVault_Interface'Class;
   type IPasswordVault_Ptr is access all IPasswordVault;
   type IObservableMap_String_Object_Interface;
   type IObservableMap_String_Object is access all IObservableMap_String_Object_Interface'Class;
   type IObservableMap_String_Object_Ptr is access all IObservableMap_String_Object;
   type IMap_String_Object_Interface;
   type IMap_String_Object is access all IMap_String_Object_Interface'Class;
   type IMap_String_Object_Ptr is access all IMap_String_Object;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type IPropertySet_Imported_Interface;
   type IPropertySet_Imported is access all IPropertySet_Imported_Interface'Class;
   type IPropertySet_Imported_Ptr is access all IPropertySet_Imported;
   type IAsyncOperation_IKeyCredentialRetrievalResult_Interface;
   type IAsyncOperation_IKeyCredentialRetrievalResult is access all IAsyncOperation_IKeyCredentialRetrievalResult_Interface'Class;
   type IAsyncOperation_IKeyCredentialRetrievalResult_Ptr is access all IAsyncOperation_IKeyCredentialRetrievalResult;
   type IAsyncOperation_IKeyCredentialOperationResult_Interface;
   type IAsyncOperation_IKeyCredentialOperationResult is access all IAsyncOperation_IKeyCredentialOperationResult_Interface'Class;
   type IAsyncOperation_IKeyCredentialOperationResult_Ptr is access all IAsyncOperation_IKeyCredentialOperationResult;
   type IAsyncOperation_IKeyCredentialAttestationResult_Interface;
   type IAsyncOperation_IKeyCredentialAttestationResult is access all IAsyncOperation_IKeyCredentialAttestationResult_Interface'Class;
   type IAsyncOperation_IKeyCredentialAttestationResult_Ptr is access all IAsyncOperation_IKeyCredentialAttestationResult;
   type IIterator_IWebAccount_Interface;
   type IIterator_IWebAccount is access all IIterator_IWebAccount_Interface'Class;
   type IIterator_IWebAccount_Ptr is access all IIterator_IWebAccount;
   type IIterable_IWebAccount_Interface;
   type IIterable_IWebAccount is access all IIterable_IWebAccount_Interface'Class;
   type IIterable_IWebAccount_Ptr is access all IIterable_IWebAccount;
   type IVectorView_IWebAccount_Interface;
   type IVectorView_IWebAccount is access all IVectorView_IWebAccount_Interface'Class;
   type IVectorView_IWebAccount_Ptr is access all IVectorView_IWebAccount;
   type IAsyncOperation_IWebAccount_Interface;
   type IAsyncOperation_IWebAccount is access all IAsyncOperation_IWebAccount_Interface'Class;
   type IAsyncOperation_IWebAccount_Ptr is access all IAsyncOperation_IWebAccount;
   type IAsyncOperation_IWebAccountProvider_Interface;
   type IAsyncOperation_IWebAccountProvider is access all IAsyncOperation_IWebAccountProvider_Interface'Class;
   type IAsyncOperation_IWebAccountProvider_Ptr is access all IAsyncOperation_IWebAccountProvider;
   type IIterator_IPasswordCredential_Interface;
   type IIterator_IPasswordCredential is access all IIterator_IPasswordCredential_Interface'Class;
   type IIterator_IPasswordCredential_Ptr is access all IIterator_IPasswordCredential;
   type IIterable_IPasswordCredential_Interface;
   type IIterable_IPasswordCredential is access all IIterable_IPasswordCredential_Interface'Class;
   type IIterable_IPasswordCredential_Ptr is access all IIterable_IPasswordCredential;
   type IVectorView_IPasswordCredential_Interface;
   type IVectorView_IPasswordCredential is access all IVectorView_IPasswordCredential_Interface'Class;
   type IVectorView_IPasswordCredential_Ptr is access all IVectorView_IPasswordCredential;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IKeyCredentialManagerStatics : aliased constant Windows.IID := (1789675147, 3825, 19680, (130, 144, 65, 6, 218, 106, 99, 181 ));
   
   type IKeyCredentialManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupportedAsync
   (
      This       : access IKeyCredentialManagerStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RenewAttestationAsync
   (
      This       : access IKeyCredentialManagerStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RequestCreateAsync
   (
      This       : access IKeyCredentialManagerStatics_Interface
      ; name : Windows.String
      ; option : Windows.Security.Credentials.KeyCredentialCreationOption
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenAsync
   (
      This       : access IKeyCredentialManagerStatics_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IKeyCredentialManagerStatics_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyCredential : aliased constant Windows.IID := (2508582797, 17787, 18503, (177, 26, 250, 150, 11, 189, 177, 56 ));
   
   type IKeyCredential_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IKeyCredential_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RetrievePublicKeyWithDefaultBlobType
   (
      This       : access IKeyCredential_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RetrievePublicKeyWithBlobType
   (
      This       : access IKeyCredential_Interface
      ; blobType : Windows.Security.Cryptography.Core.CryptographicPublicKeyBlobType
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RequestSignAsync
   (
      This       : access IKeyCredential_Interface
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IKeyCredentialOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAttestationAsync
   (
      This       : access IKeyCredential_Interface
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IKeyCredentialAttestationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyCredentialRetrievalResult : aliased constant Windows.IID := (1489860355, 36231, 16969, (155, 88, 246, 89, 140, 201, 100, 78 ));
   
   type IKeyCredentialRetrievalResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Credential
   (
      This       : access IKeyCredentialRetrievalResult_Interface
      ; RetVal : access Windows.Security.Credentials.IKeyCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IKeyCredentialRetrievalResult_Interface
      ; RetVal : access Windows.Security.Credentials.KeyCredentialStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyCredentialOperationResult : aliased constant Windows.IID := (4114056897, 21089, 19677, (151, 109, 204, 144, 154, 199, 22, 32 ));
   
   type IKeyCredentialOperationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Result
   (
      This       : access IKeyCredentialOperationResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IKeyCredentialOperationResult_Interface
      ; RetVal : access Windows.Security.Credentials.KeyCredentialStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyCredentialAttestationResult : aliased constant Windows.IID := (2024453025, 41921, 16643, (182, 204, 71, 44, 68, 23, 28, 187 ));
   
   type IKeyCredentialAttestationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CertificateChainBuffer
   (
      This       : access IKeyCredentialAttestationResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_AttestationBuffer
   (
      This       : access IKeyCredentialAttestationResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IKeyCredentialAttestationResult_Interface
      ; RetVal : access Windows.Security.Credentials.KeyCredentialAttestationStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountFactory : aliased constant Windows.IID := (2895838009, 7657, 20114, (183, 143, 5, 129, 168, 127, 110, 92 ));
   
   type IWebAccountFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWebAccount
   (
      This       : access IWebAccountFactory_Interface
      ; webAccountProvider : Windows.Security.Credentials.IWebAccountProvider
      ; userName : Windows.String
      ; state : Windows.Security.Credentials.WebAccountState
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccount : aliased constant Windows.IID := (1766276786, 32817, 18878, (128, 187, 150, 203, 70, 217, 154, 186 ));
   
   type IWebAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAccountProvider
   (
      This       : access IWebAccount_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccountProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_UserName
   (
      This       : access IWebAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IWebAccount_Interface
      ; RetVal : access Windows.Security.Credentials.WebAccountState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccount2 : aliased constant Windows.IID := (2069288696, 39179, 20149, (148, 167, 86, 33, 243, 168, 184, 36 ));
   
   type IWebAccount2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IWebAccount2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IWebAccount2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPictureAsync
   (
      This       : access IWebAccount2_Interface
      ; desizedSize : Windows.Security.Credentials.WebAccountPictureSize
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SignOutAsync
   (
      This       : access IWebAccount2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SignOutWithClientIdAsync
   (
      This       : access IWebAccount2_Interface
      ; clientId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderFactory : aliased constant Windows.IID := (494304753, 57825, 19354, (167, 116, 92, 124, 126, 59, 243, 113 ));
   
   type IWebAccountProviderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWebAccountProvider
   (
      This       : access IWebAccountProviderFactory_Interface
      ; id : Windows.String
      ; displayName : Windows.String
      ; iconUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Security.Credentials.IWebAccountProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProvider : aliased constant Windows.IID := (702335171, 31417, 19068, (163, 54, 185, 66, 249, 219, 247, 199 ));
   
   type IWebAccountProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IWebAccountProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IWebAccountProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IconUri
   (
      This       : access IWebAccountProvider_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProvider2 : aliased constant Windows.IID := (1241639685, 20034, 16852, (181, 24, 224, 8, 165, 22, 54, 20 ));
   
   type IWebAccountProvider2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayPurpose
   (
      This       : access IWebAccountProvider2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Authority
   (
      This       : access IWebAccountProvider2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProvider3 : aliased constant Windows.IID := (3659288971, 38669, 19785, (130, 92, 242, 112, 111, 140, 167, 254 ));
   
   type IWebAccountProvider3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IWebAccountProvider3_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProvider4 : aliased constant Windows.IID := (1905252571, 59286, 16912, (183, 78, 132, 210, 152, 148, 176, 128 ));
   
   type IWebAccountProvider4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSystemProvider
   (
      This       : access IWebAccountProvider4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPasswordCredential : aliased constant Windows.IID := (1790019977, 50976, 16807, (166, 193, 254, 173, 179, 99, 41, 160 ));
   
   type IPasswordCredential_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Resource
   (
      This       : access IPasswordCredential_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Resource
   (
      This       : access IPasswordCredential_Interface
      ; resource : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserName
   (
      This       : access IPasswordCredential_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UserName
   (
      This       : access IPasswordCredential_Interface
      ; userName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Password
   (
      This       : access IPasswordCredential_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Password
   (
      This       : access IPasswordCredential_Interface
      ; password : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RetrievePassword
   (
      This       : access IPasswordCredential_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPasswordCredential_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICredentialFactory : aliased constant Windows.IID := (1424954273, 48934, 18357, (151, 221, 222, 119, 155, 124, 173, 88 ));
   
   type ICredentialFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreatePasswordCredential
   (
      This       : access ICredentialFactory_Interface
      ; resource : Windows.String
      ; userName : Windows.String
      ; password : Windows.String
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPasswordVault : aliased constant Windows.IID := (1643981835, 51412, 18625, (165, 79, 188, 90, 100, 32, 90, 242 ));
   
   type IPasswordVault_Interface is interface and Windows.IInspectable_Interface;
   
   function Add
   (
      This       : access IPasswordVault_Interface
      ; credential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IPasswordVault_Interface
      ; credential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function Retrieve
   (
      This       : access IPasswordVault_Interface
      ; resource : Windows.String
      ; userName : Windows.String
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function FindAllByResource
   (
      This       : access IPasswordVault_Interface
      ; resource : Windows.String
      ; RetVal : access Windows.Security.Credentials.IVectorView_IPasswordCredential -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllByUserName
   (
      This       : access IPasswordVault_Interface
      ; userName : Windows.String
      ; RetVal : access Windows.Security.Credentials.IVectorView_IPasswordCredential -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RetrieveAll
   (
      This       : access IPasswordVault_Interface
      ; RetVal : access Windows.Security.Credentials.IVectorView_IPasswordCredential -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IObservableMap_String_Object : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IObservableMap_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MapChanged
   (
      This       : access IObservableMap_String_Object_Interface
      ; vhnd : Windows.Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapChanged
   (
      This       : access IObservableMap_String_Object_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_String_Object : aliased constant Windows.IID := (453850480, 2167, 24258, (138, 44, 59, 149, 57, 80, 106, 202 ));
   
   type IMap_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_Object_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IPropertySet_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IKeyCredentialRetrievalResult : aliased constant Windows.IID := (2312154398, 48460, 21940, (129, 14, 189, 221, 76, 236, 122, 42 ));
   
   type IAsyncOperation_IKeyCredentialRetrievalResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IKeyCredentialRetrievalResult_Interface
      ; handler : Windows.Security.Credentials.AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IKeyCredentialRetrievalResult_Interface
      ; RetVal : access Windows.Security.Credentials.AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IKeyCredentialRetrievalResult_Interface
      ; RetVal : access Windows.Security.Credentials.IKeyCredentialRetrievalResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IKeyCredentialOperationResult : aliased constant Windows.IID := (1702290867, 38197, 20694, (152, 246, 198, 125, 106, 172, 162, 197 ));
   
   type IAsyncOperation_IKeyCredentialOperationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IKeyCredentialOperationResult_Interface
      ; handler : Windows.Security.Credentials.AsyncOperationCompletedHandler_IKeyCredentialOperationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IKeyCredentialOperationResult_Interface
      ; RetVal : access Windows.Security.Credentials.AsyncOperationCompletedHandler_IKeyCredentialOperationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IKeyCredentialOperationResult_Interface
      ; RetVal : access Windows.Security.Credentials.IKeyCredentialOperationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IKeyCredentialAttestationResult : aliased constant Windows.IID := (3091016169, 62692, 23204, (146, 213, 178, 98, 203, 64, 198, 34 ));
   
   type IAsyncOperation_IKeyCredentialAttestationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IKeyCredentialAttestationResult_Interface
      ; handler : Windows.Security.Credentials.AsyncOperationCompletedHandler_IKeyCredentialAttestationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IKeyCredentialAttestationResult_Interface
      ; RetVal : access Windows.Security.Credentials.AsyncOperationCompletedHandler_IKeyCredentialAttestationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IKeyCredentialAttestationResult_Interface
      ; RetVal : access Windows.Security.Credentials.IKeyCredentialAttestationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWebAccount : aliased constant Windows.IID := (3216518346, 44732, 22140, (149, 217, 235, 162, 92, 54, 95, 170 ));
   
   type IIterator_IWebAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWebAccount_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWebAccount_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWebAccount_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWebAccount_Interface
      ; items : Windows.Security.Credentials.IWebAccount_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccount : aliased constant Windows.IID := (3407205433, 43280, 21546, (137, 237, 124, 254, 103, 132, 138, 131 ));
   
   type IIterable_IWebAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccount_Interface
      ; RetVal : access Windows.Security.Credentials.IIterator_IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWebAccount : aliased constant Windows.IID := (3766062397, 11082, 22682, (171, 18, 2, 220, 204, 21, 138, 252 ));
   
   type IVectorView_IWebAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWebAccount_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWebAccount_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWebAccount_Interface
      ; value : Windows.Security.Credentials.IWebAccount
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWebAccount_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Credentials.IWebAccount_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWebAccount : aliased constant Windows.IID := (2899798868, 10623, 23064, (145, 67, 32, 163, 9, 226, 223, 211 ));
   
   type IAsyncOperation_IWebAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWebAccount_Interface
      ; handler : Windows.Security.Credentials.AsyncOperationCompletedHandler_IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWebAccount_Interface
      ; RetVal : access Windows.Security.Credentials.AsyncOperationCompletedHandler_IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWebAccount_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWebAccountProvider : aliased constant Windows.IID := (2294702089, 4855, 22754, (141, 190, 110, 252, 98, 12, 133, 186 ));
   
   type IAsyncOperation_IWebAccountProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWebAccountProvider_Interface
      ; handler : Windows.Security.Credentials.AsyncOperationCompletedHandler_IWebAccountProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWebAccountProvider_Interface
      ; RetVal : access Windows.Security.Credentials.AsyncOperationCompletedHandler_IWebAccountProvider
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWebAccountProvider_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccountProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPasswordCredential : aliased constant Windows.IID := (2953876440, 20306, 20720, (154, 164, 226, 38, 57, 17, 17, 98 ));
   
   type IIterator_IPasswordCredential_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPasswordCredential_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPasswordCredential_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPasswordCredential_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPasswordCredential_Interface
      ; items : Windows.Security.Credentials.IPasswordCredential_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPasswordCredential : aliased constant Windows.IID := (220351078, 47829, 23253, (154, 222, 30, 159, 90, 96, 254, 115 ));
   
   type IIterable_IPasswordCredential_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPasswordCredential_Interface
      ; RetVal : access Windows.Security.Credentials.IIterator_IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPasswordCredential : aliased constant Windows.IID := (1315014061, 42719, 21544, (175, 245, 23, 228, 95, 63, 71, 111 ));
   
   type IVectorView_IPasswordCredential_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPasswordCredential_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPasswordCredential_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPasswordCredential_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPasswordCredential_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Credentials.IPasswordCredential_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult : aliased constant Windows.IID := (65691825, 43124, 22734, (142, 142, 255, 244, 72, 182, 115, 62 ));
   
   type AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IKeyCredentialOperationResult : aliased constant Windows.IID := (968122522, 514, 22010, (128, 5, 111, 131, 112, 158, 32, 243 ));
   
   type AsyncOperationCompletedHandler_IKeyCredentialOperationResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialOperationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IKeyCredentialOperationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IKeyCredentialOperationResult_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialOperationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IKeyCredentialAttestationResult : aliased constant Windows.IID := (739696899, 63363, 24025, (165, 243, 51, 98, 188, 189, 170, 189 ));
   
   type AsyncOperationCompletedHandler_IKeyCredentialAttestationResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialAttestationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IKeyCredentialAttestationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IKeyCredentialAttestationResult_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialAttestationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWebAccount : aliased constant Windows.IID := (1272377829, 51849, 21056, (143, 61, 127, 27, 84, 174, 144, 167 ));
   
   type AsyncOperationCompletedHandler_IWebAccount_Interface(Callback : access procedure (asyncInfo : Windows.Security.Credentials.IAsyncOperation_IWebAccount ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWebAccount'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWebAccount_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IWebAccount
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWebAccountProvider : aliased constant Windows.IID := (2490851883, 4928, 21876, (129, 252, 80, 19, 88, 31, 87, 201 ));
   
   type AsyncOperationCompletedHandler_IWebAccountProvider_Interface(Callback : access procedure (asyncInfo : Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWebAccountProvider'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWebAccountProvider_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype KeyCredentialRetrievalResult is Windows.Security.Credentials.IKeyCredentialRetrievalResult;
   subtype KeyCredentialOperationResult is Windows.Security.Credentials.IKeyCredentialOperationResult;
   subtype KeyCredentialAttestationResult is Windows.Security.Credentials.IKeyCredentialAttestationResult;
   subtype KeyCredential is Windows.Security.Credentials.IKeyCredential;
   subtype WebAccountProvider is Windows.Security.Credentials.IWebAccountProvider;
   function CreateWebAccountProvider
   (
      id : Windows.String
      ; displayName : Windows.String
      ; iconUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Credentials.IWebAccountProvider;
   
   subtype WebAccount is Windows.Security.Credentials.IWebAccount;
   function CreateWebAccount
   (
      webAccountProvider : Windows.Security.Credentials.IWebAccountProvider
      ; userName : Windows.String
      ; state : Windows.Security.Credentials.WebAccountState
   )
   return Windows.Security.Credentials.IWebAccount;
   
   subtype PasswordCredential is Windows.Security.Credentials.IPasswordCredential;
   function Create return Windows.Security.Credentials.IPasswordCredential;
   
   function CreatePasswordCredential
   (
      resource : Windows.String
      ; userName : Windows.String
      ; password : Windows.String
   )
   return Windows.Security.Credentials.IPasswordCredential;
   
   subtype PasswordVault is Windows.Security.Credentials.IPasswordVault;
   function Create return Windows.Security.Credentials.IPasswordVault;
   
   subtype PasswordCredentialPropertyStore is Windows.Foundation.Collections.IPropertySet;
   function Create return Windows.Foundation.Collections.IPropertySet;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function IsSupportedAsync
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function RenewAttestationAsync
   return Windows.Foundation.IAsyncAction;
   
   function RequestCreateAsync
   (
      name : Windows.String
      ; option : Windows.Security.Credentials.KeyCredentialCreationOption
   )
   return Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult;
   
   function OpenAsync
   (
      name : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult;
   
   function DeleteAsync
   (
      name : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
end;
