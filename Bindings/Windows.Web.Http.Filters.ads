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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Security.Cryptography.Certificates;
limited with Windows.Networking.Sockets;
with Windows.Foundation.Collections;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.Web.Http.Filters is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HttpCacheReadBehavior is (
      Default,
      MostRecent,
      OnlyFromCache,
      NoCache
   );
   for HttpCacheReadBehavior use (
      Default => 0,
      MostRecent => 1,
      OnlyFromCache => 2,
      NoCache => 3
   );
   for HttpCacheReadBehavior'Size use 32;
   
   type HttpCacheReadBehavior_Ptr is access HttpCacheReadBehavior;
   
   type HttpCacheWriteBehavior is (
      Default,
      NoCache
   );
   for HttpCacheWriteBehavior use (
      Default => 0,
      NoCache => 1
   );
   for HttpCacheWriteBehavior'Size use 32;
   
   type HttpCacheWriteBehavior_Ptr is access HttpCacheWriteBehavior;
   
   type HttpCookieUsageBehavior is (
      Default,
      NoCookies
   );
   for HttpCookieUsageBehavior use (
      Default => 0,
      NoCookies => 1
   );
   for HttpCookieUsageBehavior'Size use 32;
   
   type HttpCookieUsageBehavior_Ptr is access HttpCookieUsageBehavior;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested_Interface;
   type TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested is access all TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested_Interface'Class;
   type TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested_Ptr is access all TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHttpFilter_Interface;
   type IHttpFilter is access all IHttpFilter_Interface'Class;
   type IHttpFilter_Ptr is access all IHttpFilter;
   type IHttpCacheControl_Interface;
   type IHttpCacheControl is access all IHttpCacheControl_Interface'Class;
   type IHttpCacheControl_Ptr is access all IHttpCacheControl;
   type IHttpServerCustomValidationRequestedEventArgs_Interface;
   type IHttpServerCustomValidationRequestedEventArgs is access all IHttpServerCustomValidationRequestedEventArgs_Interface'Class;
   type IHttpServerCustomValidationRequestedEventArgs_Ptr is access all IHttpServerCustomValidationRequestedEventArgs;
   type IHttpBaseProtocolFilter_Interface;
   type IHttpBaseProtocolFilter is access all IHttpBaseProtocolFilter_Interface'Class;
   type IHttpBaseProtocolFilter_Ptr is access all IHttpBaseProtocolFilter;
   type IHttpBaseProtocolFilter2_Interface;
   type IHttpBaseProtocolFilter2 is access all IHttpBaseProtocolFilter2_Interface'Class;
   type IHttpBaseProtocolFilter2_Ptr is access all IHttpBaseProtocolFilter2;
   type IHttpBaseProtocolFilter3_Interface;
   type IHttpBaseProtocolFilter3 is access all IHttpBaseProtocolFilter3_Interface'Class;
   type IHttpBaseProtocolFilter3_Ptr is access all IHttpBaseProtocolFilter3;
   type IHttpBaseProtocolFilter4_Interface;
   type IHttpBaseProtocolFilter4 is access all IHttpBaseProtocolFilter4_Interface'Class;
   type IHttpBaseProtocolFilter4_Ptr is access all IHttpBaseProtocolFilter4;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IHttpFilter : aliased constant Windows.IID := (2764795349, 2306, 17310, (191, 215, 225, 37, 82, 177, 101, 206 ));
   
   type IHttpFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function SendRequestAsync
   (
      This       : access IHttpFilter_Interface
      ; request : Windows.Web.Http.IHttpRequestMessage
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCacheControl : aliased constant Windows.IID := (3346930868, 15594, 20149, (172, 133, 4, 225, 134, 230, 58, 183 ));
   
   type IHttpCacheControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReadBehavior
   (
      This       : access IHttpCacheControl_Interface
      ; RetVal : access Windows.Web.Http.Filters.HttpCacheReadBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_ReadBehavior
   (
      This       : access IHttpCacheControl_Interface
      ; value : Windows.Web.Http.Filters.HttpCacheReadBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteBehavior
   (
      This       : access IHttpCacheControl_Interface
      ; RetVal : access Windows.Web.Http.Filters.HttpCacheWriteBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_WriteBehavior
   (
      This       : access IHttpCacheControl_Interface
      ; value : Windows.Web.Http.Filters.HttpCacheWriteBehavior
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpServerCustomValidationRequestedEventArgs : aliased constant Windows.IID := (828767794, 59357, 18615, (163, 97, 147, 156, 117, 14, 99, 204 ));
   
   type IHttpServerCustomValidationRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestMessage
   (
      This       : access IHttpServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificate
   (
      This       : access IHttpServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrorSeverity
   (
      This       : access IHttpServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketSslErrorSeverity
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrors
   (
      This       : access IHttpServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerIntermediateCertificates
   (
      This       : access IHttpServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Reject
   (
      This       : access IHttpServerCustomValidationRequestedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IHttpServerCustomValidationRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpBaseProtocolFilter : aliased constant Windows.IID := (1908972297, 57649, 19284, (165, 60, 235, 67, 255, 55, 233, 187 ));
   
   type IHttpBaseProtocolFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowAutoRedirect
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowAutoRedirect
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowUI
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowUI
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AutomaticDecompression
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AutomaticDecompression
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CacheControl
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Web.Http.Filters.IHttpCacheControl
   )
   return Windows.HRESULT is abstract;
   
   function get_CookieManager
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Web.Http.IHttpCookieManager
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientCertificate
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function put_ClientCertificate
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_IgnorableServerCertificateErrors
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVector_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxConnectionsPerServer
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxConnectionsPerServer
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyCredential
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ProxyCredential
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCredential
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_ServerCredential
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_UseProxy
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_UseProxy
   (
      This       : access IHttpBaseProtocolFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpBaseProtocolFilter2 : aliased constant Windows.IID := (784531475, 37927, 18688, (160, 23, 250, 125, 163, 181, 201, 174 ));
   
   type IHttpBaseProtocolFilter2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxVersion
   (
      This       : access IHttpBaseProtocolFilter2_Interface
      ; RetVal : access Windows.Web.Http.HttpVersion
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxVersion
   (
      This       : access IHttpBaseProtocolFilter2_Interface
      ; value : Windows.Web.Http.HttpVersion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpBaseProtocolFilter3 : aliased constant Windows.IID := (3560918348, 48450, 17326, (135, 23, 173, 44, 143, 75, 41, 55 ));
   
   type IHttpBaseProtocolFilter3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CookieUsageBehavior
   (
      This       : access IHttpBaseProtocolFilter3_Interface
      ; RetVal : access Windows.Web.Http.Filters.HttpCookieUsageBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_CookieUsageBehavior
   (
      This       : access IHttpBaseProtocolFilter3_Interface
      ; value : Windows.Web.Http.Filters.HttpCookieUsageBehavior
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpBaseProtocolFilter4 : aliased constant Windows.IID := (2682481871, 10627, 18579, (148, 31, 235, 81, 140, 168, 206, 249 ));
   
   type IHttpBaseProtocolFilter4_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ServerCustomValidationRequested
   (
      This       : access IHttpBaseProtocolFilter4_Interface
      ; eventHandler : TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ServerCustomValidationRequested
   (
      This       : access IHttpBaseProtocolFilter4_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function ClearAuthenticationCache
   (
      This       : access IHttpBaseProtocolFilter4_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested : aliased constant Windows.IID := (3976356038, 16882, 23044, (154, 139, 41, 48, 215, 255, 138, 158 ));
   
   type TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested_Interface(Callback : access procedure (sender : Windows.Web.Http.Filters.IHttpBaseProtocolFilter ; args : Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IHttpBaseProtocolFilter4_add_ServerCustomValidationRequested_Interface
      ; sender : Windows.Web.Http.Filters.IHttpBaseProtocolFilter
      ; args : Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HttpBaseProtocolFilter is Windows.Web.Http.Filters.IHttpBaseProtocolFilter;
   function Create return Windows.Web.Http.Filters.IHttpBaseProtocolFilter;
   
   subtype HttpCacheControl is Windows.Web.Http.Filters.IHttpCacheControl;
   subtype HttpServerCustomValidationRequestedEventArgs is Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
