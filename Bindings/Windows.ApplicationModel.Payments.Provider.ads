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
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Payments.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult_Interface;
   type AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult is access all AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult_Ptr is access all AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult;
   type AsyncOperationCompletedHandler_IPaymentTransaction_Interface;
   type AsyncOperationCompletedHandler_IPaymentTransaction is access all AsyncOperationCompletedHandler_IPaymentTransaction_Interface'Class;
   type AsyncOperationCompletedHandler_IPaymentTransaction_Ptr is access all AsyncOperationCompletedHandler_IPaymentTransaction;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPaymentAppManager_Interface;
   type IPaymentAppManager is access all IPaymentAppManager_Interface'Class;
   type IPaymentAppManager_Ptr is access all IPaymentAppManager;
   type IPaymentAppManagerStatics_Interface;
   type IPaymentAppManagerStatics is access all IPaymentAppManagerStatics_Interface'Class;
   type IPaymentAppManagerStatics_Ptr is access all IPaymentAppManagerStatics;
   type IPaymentTransaction_Interface;
   type IPaymentTransaction is access all IPaymentTransaction_Interface'Class;
   type IPaymentTransaction_Ptr is access all IPaymentTransaction;
   type IPaymentTransactionAcceptResult_Interface;
   type IPaymentTransactionAcceptResult is access all IPaymentTransactionAcceptResult_Interface'Class;
   type IPaymentTransactionAcceptResult_Ptr is access all IPaymentTransactionAcceptResult;
   type IPaymentTransactionStatics_Interface;
   type IPaymentTransactionStatics is access all IPaymentTransactionStatics_Interface'Class;
   type IPaymentTransactionStatics_Ptr is access all IPaymentTransactionStatics;
   type IPaymentAppCanMakePaymentTriggerDetails_Interface;
   type IPaymentAppCanMakePaymentTriggerDetails is access all IPaymentAppCanMakePaymentTriggerDetails_Interface'Class;
   type IPaymentAppCanMakePaymentTriggerDetails_Ptr is access all IPaymentAppCanMakePaymentTriggerDetails;
   type IAsyncOperation_IPaymentTransactionAcceptResult_Interface;
   type IAsyncOperation_IPaymentTransactionAcceptResult is access all IAsyncOperation_IPaymentTransactionAcceptResult_Interface'Class;
   type IAsyncOperation_IPaymentTransactionAcceptResult_Ptr is access all IAsyncOperation_IPaymentTransactionAcceptResult;
   type IAsyncOperation_IPaymentTransaction_Interface;
   type IAsyncOperation_IPaymentTransaction is access all IAsyncOperation_IPaymentTransaction_Interface'Class;
   type IAsyncOperation_IPaymentTransaction_Ptr is access all IAsyncOperation_IPaymentTransaction;
   
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
   
   IID_IPaymentAppManager : aliased constant Windows.IID := (239577683, 34081, 18793, (169, 87, 223, 37, 56, 163, 169, 143 ));
   
   type IPaymentAppManager_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterAsync
   (
      This       : access IPaymentAppManager_Interface
      ; supportedPaymentMethodIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterAsync
   (
      This       : access IPaymentAppManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPaymentAppManagerStatics : aliased constant Windows.IID := (2738990120, 64649, 17414, (180, 217, 52, 231, 254, 121, 223, 182 ));
   
   type IPaymentAppManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IPaymentAppManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.Provider.IPaymentAppManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPaymentTransaction : aliased constant Windows.IID := (1649941920, 9893, 20123, (166, 235, 102, 96, 108, 240, 1, 211 ));
   
   type IPaymentTransaction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PaymentRequest
   (
      This       : access IPaymentTransaction_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_PayerEmail
   (
      This       : access IPaymentTransaction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PayerEmail
   (
      This       : access IPaymentTransaction_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PayerName
   (
      This       : access IPaymentTransaction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PayerName
   (
      This       : access IPaymentTransaction_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PayerPhoneNumber
   (
      This       : access IPaymentTransaction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PayerPhoneNumber
   (
      This       : access IPaymentTransaction_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function UpdateShippingAddressAsync
   (
      This       : access IPaymentTransaction_Interface
      ; shippingAddress : Windows.ApplicationModel.Payments.IPaymentAddress
      ; RetVal : access Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestChangedResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateSelectedShippingOptionAsync
   (
      This       : access IPaymentTransaction_Interface
      ; selectedShippingOption : Windows.ApplicationModel.Payments.IPaymentShippingOption
      ; RetVal : access Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestChangedResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AcceptAsync
   (
      This       : access IPaymentTransaction_Interface
      ; paymentToken : Windows.ApplicationModel.Payments.IPaymentToken
      ; RetVal : access Windows.ApplicationModel.Payments.Provider.IAsyncOperation_IPaymentTransactionAcceptResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Reject
   (
      This       : access IPaymentTransaction_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPaymentTransactionAcceptResult : aliased constant Windows.IID := (101593718, 54028, 18455, (149, 162, 223, 122, 233, 39, 59, 86 ));
   
   type IPaymentTransactionAcceptResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPaymentTransactionAcceptResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.PaymentRequestCompletionStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPaymentTransactionStatics : aliased constant Windows.IID := (2372114256, 60938, 19957, (155, 30, 28, 15, 158, 197, 152, 129 ));
   
   type IPaymentTransactionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IPaymentTransactionStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.Payments.Provider.IAsyncOperation_IPaymentTransaction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPaymentAppCanMakePaymentTriggerDetails : aliased constant Windows.IID := (216138224, 35731, 20150, (140, 70, 46, 74, 108, 106, 38, 246 ));
   
   type IPaymentAppCanMakePaymentTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IPaymentAppCanMakePaymentTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.IPaymentRequest
   )
   return Windows.HRESULT is abstract;
   
   function ReportCanMakePaymentResult
   (
      This       : access IPaymentAppCanMakePaymentTriggerDetails_Interface
      ; value : Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPaymentTransactionAcceptResult : aliased constant Windows.IID := (3326470383, 2147, 21940, (138, 237, 66, 189, 21, 45, 128, 4 ));
   
   type IAsyncOperation_IPaymentTransactionAcceptResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPaymentTransactionAcceptResult_Interface
      ; handler : Windows.ApplicationModel.Payments.Provider.AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPaymentTransactionAcceptResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.Provider.AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPaymentTransactionAcceptResult_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.Provider.IPaymentTransactionAcceptResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPaymentTransaction : aliased constant Windows.IID := (3768205181, 27344, 22735, (171, 76, 46, 76, 156, 121, 24, 115 ));
   
   type IAsyncOperation_IPaymentTransaction_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPaymentTransaction_Interface
      ; handler : Windows.ApplicationModel.Payments.Provider.AsyncOperationCompletedHandler_IPaymentTransaction
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPaymentTransaction_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.Provider.AsyncOperationCompletedHandler_IPaymentTransaction
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPaymentTransaction_Interface
      ; RetVal : access Windows.ApplicationModel.Payments.Provider.IPaymentTransaction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult : aliased constant Windows.IID := (1161361546, 35247, 20665, (129, 101, 126, 98, 105, 99, 152, 132 ));
   
   type AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Payments.Provider.IAsyncOperation_IPaymentTransactionAcceptResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPaymentTransactionAcceptResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Payments.Provider.IAsyncOperation_IPaymentTransactionAcceptResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPaymentTransaction : aliased constant Windows.IID := (3176895205, 4230, 23613, (157, 225, 153, 130, 231, 118, 209, 147 ));
   
   type AsyncOperationCompletedHandler_IPaymentTransaction_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Payments.Provider.IAsyncOperation_IPaymentTransaction ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPaymentTransaction'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPaymentTransaction_Interface
      ; asyncInfo : Windows.ApplicationModel.Payments.Provider.IAsyncOperation_IPaymentTransaction
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PaymentAppManager is Windows.ApplicationModel.Payments.Provider.IPaymentAppManager;
   subtype PaymentTransactionAcceptResult is Windows.ApplicationModel.Payments.Provider.IPaymentTransactionAcceptResult;
   subtype PaymentTransaction is Windows.ApplicationModel.Payments.Provider.IPaymentTransaction;
   subtype PaymentAppCanMakePaymentTriggerDetails is Windows.ApplicationModel.Payments.Provider.IPaymentAppCanMakePaymentTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Current
   return Windows.ApplicationModel.Payments.Provider.IPaymentAppManager;
   
   function FromIdAsync
   (
      id : Windows.String
   )
   return Windows.ApplicationModel.Payments.Provider.IAsyncOperation_IPaymentTransaction;
   

end;
