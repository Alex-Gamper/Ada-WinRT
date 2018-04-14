--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
--------------------------------------------------------------------------------
package Windows.Web is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WebErrorStatus is (
      Unknown,
      CertificateCommonNameIsIncorrect,
      CertificateExpired,
      CertificateContainsErrors,
      CertificateRevoked,
      CertificateIsInvalid,
      ServerUnreachable,
      Timeout,
      ErrorHttpInvalidServerResponse,
      ConnectionAborted,
      ConnectionReset,
      Disconnected,
      HttpToHttpsOnRedirection,
      HttpsToHttpOnRedirection,
      CannotConnect,
      HostNameNotResolved,
      OperationCanceled,
      RedirectFailed,
      UnexpectedStatusCode,
      UnexpectedRedirection,
      UnexpectedClientError,
      UnexpectedServerError,
      InsufficientRangeSupport,
      MissingContentLengthSupport,
      MultipleChoices,
      MovedPermanently,
      Found,
      SeeOther,
      NotModified,
      UseProxy,
      TemporaryRedirect,
      BadRequest,
      Unauthorized,
      PaymentRequired,
      Forbidden,
      NotFound,
      MethodNotAllowed,
      NotAcceptable,
      ProxyAuthenticationRequired,
      RequestTimeout,
      Conflict,
      Gone,
      LengthRequired,
      PreconditionFailed,
      RequestEntityTooLarge,
      RequestUriTooLong,
      UnsupportedMediaType,
      RequestedRangeNotSatisfiable,
      ExpectationFailed,
      InternalServerError,
      NotImplemented,
      BadGateway,
      ServiceUnavailable,
      GatewayTimeout,
      HttpVersionNotSupported
   );
   for WebErrorStatus use (
      Unknown => 0,
      CertificateCommonNameIsIncorrect => 1,
      CertificateExpired => 2,
      CertificateContainsErrors => 3,
      CertificateRevoked => 4,
      CertificateIsInvalid => 5,
      ServerUnreachable => 6,
      Timeout => 7,
      ErrorHttpInvalidServerResponse => 8,
      ConnectionAborted => 9,
      ConnectionReset => 10,
      Disconnected => 11,
      HttpToHttpsOnRedirection => 12,
      HttpsToHttpOnRedirection => 13,
      CannotConnect => 14,
      HostNameNotResolved => 15,
      OperationCanceled => 16,
      RedirectFailed => 17,
      UnexpectedStatusCode => 18,
      UnexpectedRedirection => 19,
      UnexpectedClientError => 20,
      UnexpectedServerError => 21,
      InsufficientRangeSupport => 22,
      MissingContentLengthSupport => 23,
      MultipleChoices => 300,
      MovedPermanently => 301,
      Found => 302,
      SeeOther => 303,
      NotModified => 304,
      UseProxy => 305,
      TemporaryRedirect => 307,
      BadRequest => 400,
      Unauthorized => 401,
      PaymentRequired => 402,
      Forbidden => 403,
      NotFound => 404,
      MethodNotAllowed => 405,
      NotAcceptable => 406,
      ProxyAuthenticationRequired => 407,
      RequestTimeout => 408,
      Conflict => 409,
      Gone => 410,
      LengthRequired => 411,
      PreconditionFailed => 412,
      RequestEntityTooLarge => 413,
      RequestUriTooLong => 414,
      UnsupportedMediaType => 415,
      RequestedRangeNotSatisfiable => 416,
      ExpectationFailed => 417,
      InternalServerError => 500,
      NotImplemented => 501,
      BadGateway => 502,
      ServiceUnavailable => 503,
      GatewayTimeout => 504,
      HttpVersionNotSupported => 505
   );
   for WebErrorStatus'Size use 32;
   
   type WebErrorStatus_Ptr is access WebErrorStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUriToStreamResolver_Interface;
   type IUriToStreamResolver is access all IUriToStreamResolver_Interface'Class;
   type IUriToStreamResolver_Ptr is access all IUriToStreamResolver;
   type IWebErrorStatics_Interface;
   type IWebErrorStatics is access all IWebErrorStatics_Interface'Class;
   type IWebErrorStatics_Ptr is access all IWebErrorStatics;
   type IIterator_WebErrorStatus_Interface;
   type IIterator_WebErrorStatus is access all IIterator_WebErrorStatus_Interface'Class;
   type IIterator_WebErrorStatus_Ptr is access all IIterator_WebErrorStatus;
   type IIterable_WebErrorStatus_Interface;
   type IIterable_WebErrorStatus is access all IIterable_WebErrorStatus_Interface'Class;
   type IIterable_WebErrorStatus_Ptr is access all IIterable_WebErrorStatus;
   type IVectorView_WebErrorStatus_Interface;
   type IVectorView_WebErrorStatus is access all IVectorView_WebErrorStatus_Interface'Class;
   type IVectorView_WebErrorStatus_Ptr is access all IVectorView_WebErrorStatus;
   type IVector_WebErrorStatus_Interface;
   type IVector_WebErrorStatus is access all IVector_WebErrorStatus_Interface'Class;
   type IVector_WebErrorStatus_Ptr is access all IVector_WebErrorStatus;
   type IReference_WebErrorStatus_Interface;
   type IReference_WebErrorStatus is access all IReference_WebErrorStatus_Interface'Class;
   type IReference_WebErrorStatus_Ptr is access all IReference_WebErrorStatus;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IUriToStreamResolver : aliased constant Windows.IID := (2964039786, 39659, 19770, (149, 144, 0, 62, 60, 167, 226, 144 ));
   
   type IUriToStreamResolver_Interface is interface and Windows.IInspectable_Interface;
   
   function UriToStreamAsync
   (
      This       : access IUriToStreamResolver_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IInputStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebErrorStatics : aliased constant Windows.IID := (4267796326, 48935, 16484, (135, 183, 101, 99, 187, 17, 206, 46 ));
   
   type IWebErrorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStatus
   (
      This       : access IWebErrorStatics_Interface
      ; hresult : Windows.Int32
      ; RetVal : access Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_WebErrorStatus : aliased constant Windows.IID := (4201662761, 1889, 24022, (150, 117, 5, 42, 140, 97, 226, 194 ));
   
   type IIterator_WebErrorStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_WebErrorStatus_Interface
      ; RetVal : access Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_WebErrorStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_WebErrorStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_WebErrorStatus_Interface
      ; items : Windows.Web.WebErrorStatus_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_WebErrorStatus : aliased constant Windows.IID := (2071926830, 42702, 21867, (154, 46, 239, 151, 102, 47, 42, 238 ));
   
   type IIterable_WebErrorStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_WebErrorStatus_Interface
      ; RetVal : access Windows.Web.IIterator_WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_WebErrorStatus : aliased constant Windows.IID := (4124118338, 42870, 21306, (143, 75, 46, 28, 110, 91, 191, 36 ));
   
   type IVectorView_WebErrorStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_WebErrorStatus_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_WebErrorStatus_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_WebErrorStatus_Interface
      ; value : Windows.Web.WebErrorStatus
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_WebErrorStatus_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.WebErrorStatus_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_WebErrorStatus : aliased constant Windows.IID := (1639712483, 46930, 23382, (131, 116, 59, 69, 162, 20, 105, 63 ));
   
   type IVector_WebErrorStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_WebErrorStatus_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_WebErrorStatus_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_WebErrorStatus_Interface
      ; RetVal : access Windows.Web.IVectorView_WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_WebErrorStatus_Interface
      ; value : Windows.Web.WebErrorStatus
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_WebErrorStatus_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_WebErrorStatus_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_WebErrorStatus_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_WebErrorStatus_Interface
      ; value : Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_WebErrorStatus_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_WebErrorStatus_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_WebErrorStatus_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.WebErrorStatus_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_WebErrorStatus_Interface
      ; items : Windows.Web.WebErrorStatus_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_WebErrorStatus : aliased constant Windows.IID := (4071777078, 27293, 21726, (142, 202, 0, 214, 200, 113, 228, 105 ));
   
   type IReference_WebErrorStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_WebErrorStatus_Interface
      ; RetVal : access Windows.Web.WebErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Web.WebErrorStatus;
   
end;
