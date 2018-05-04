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
with Windows.Foundation.Collections;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Foundation is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncActionCompletedHandler_Interface
      ; asyncInfo : Windows.Foundation.IAsyncAction
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
      This       : access DeferralCompletedHandler_Interface
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback.all;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_Object_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Object
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
      This       : access AsyncOperationCompletedHandler_UInt8_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_UInt8
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
      This       : access AsyncOperationCompletedHandler_UInt16_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_UInt16
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
      This       : access AsyncOperationCompletedHandler_UInt32_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_UInt32
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
      This       : access AsyncOperationCompletedHandler_UInt64_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_UInt64
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
      This       : access AsyncOperationCompletedHandler_Int8_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Int8
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
      This       : access AsyncOperationCompletedHandler_Int16_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Int16
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
      This       : access AsyncOperationCompletedHandler_Int32_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Int32
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
      This       : access AsyncOperationCompletedHandler_Int64_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Int64
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
      This       : access AsyncOperationCompletedHandler_Guid_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Guid
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
      This       : access AsyncOperationCompletedHandler_Single_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Single
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
      This       : access AsyncOperationCompletedHandler_Double_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Double
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
      This       : access AsyncOperationCompletedHandler_String_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_String
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
      This       : access AsyncOperationCompletedHandler_Boolean_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_Boolean
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
      This       : access AsyncOperationCompletedHandler_DateTime_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_DateTime
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
      This       : access AsyncOperationCompletedHandler_TimeSpan_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_TimeSpan
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
      This       : access EventHandler_Object_Interface
      ; sender : Windows.Object
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMemoryBufferReference_add_Closed_Interface
      ; sender : Windows.Foundation.IMemoryBufferReference
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUriRuntimeClass_Interface
      ; asyncInfo : Windows.Foundation.IAsyncOperation_IUriRuntimeClass
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
      This       : access AsyncActionProgressHandler_Double_Interface
      ; asyncInfo : Windows.Foundation.IAsyncActionWithProgress_Double
      ; progressInfo : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, progressInfo);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncActionWithProgressCompletedHandler_Double_Interface
      ; asyncInfo : Windows.Foundation.IAsyncActionWithProgress_Double
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
      This       : access AsyncActionProgressHandler_UInt64_Interface
      ; asyncInfo : Windows.Foundation.IAsyncActionWithProgress_UInt64
      ; progressInfo : Windows.UInt64
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, progressInfo);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncActionWithProgressCompletedHandler_UInt64_Interface
      ; asyncInfo : Windows.Foundation.IAsyncActionWithProgress_UInt64
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
      This       : access VectorChangedEventHandler_Object_Interface
      ; sender : Windows.Foundation.IObservableVector_Object
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, event);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      handler : Windows.Foundation.DeferralCompletedHandler
   )
   return Windows.Foundation.IDeferral is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Deferral");
      m_Factory     : Windows.Foundation.IDeferralFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IDeferral := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeferralFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      capacity : Windows.UInt32
   )
   return Windows.Foundation.IMemoryBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.MemoryBuffer");
      m_Factory     : Windows.Foundation.IMemoryBufferFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IMemoryBuffer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMemoryBufferFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(capacity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWwwFormUrlDecoder
   (
      query : Windows.String
   )
   return Windows.Foundation.IWwwFormUrlDecoderRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.WwwFormUrlDecoder");
      m_Factory     : Windows.Foundation.IWwwFormUrlDecoderRuntimeClassFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IWwwFormUrlDecoderRuntimeClass := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWwwFormUrlDecoderRuntimeClassFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWwwFormUrlDecoder(query, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUri
   (
      uri : Windows.String
   )
   return Windows.Foundation.IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Uri");
      m_Factory     : Windows.Foundation.IUriRuntimeClassFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IUriRuntimeClass := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUriRuntimeClassFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUri(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithRelativeUri
   (
      baseUri : Windows.String
      ; relativeUri : Windows.String
   )
   return Windows.Foundation.IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Uri");
      m_Factory     : Windows.Foundation.IUriRuntimeClassFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IUriRuntimeClass := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUriRuntimeClassFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithRelativeUri(baseUri, relativeUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateEmpty
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateEmpty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUInt8
   (
      value : Windows.UInt8
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUInt8(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInt16
   (
      value : Windows.Int16
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInt16(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUInt16
   (
      value : Windows.UInt16
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUInt16(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInt32
   (
      value : Windows.Int32
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInt32(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUInt32
   (
      value : Windows.UInt32
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUInt32(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInt64
   (
      value : Windows.Int64
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInt64(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUInt64
   (
      value : Windows.UInt64
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUInt64(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSingle
   (
      value : Windows.Single
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSingle(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDouble
   (
      value : Windows.Double
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDouble(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateChar16
   (
      value : Windows.UInt8
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateChar16(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBoolean
   (
      value : Windows.Boolean
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateBoolean(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateString
   (
      value : Windows.String
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateString(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInspectable
   (
      value : Windows.Object
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInspectable(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateGuid
   (
      value : Windows.Guid
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateGuid(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDateTime
   (
      value : Windows.Foundation.DateTime
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTime(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimeSpan
   (
      value : Windows.Foundation.TimeSpan
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTimeSpan(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePoint
   (
      value : Windows.Foundation.Point
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePoint(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSize
   (
      value : Windows.Foundation.Size
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSize(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRect
   (
      value : Windows.Foundation.Rect
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateRect(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUInt8Array
   (
      value : Windows.UInt8_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUInt8Array(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInt16Array
   (
      value : Windows.Int16_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInt16Array(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUInt16Array
   (
      value : Windows.UInt16_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUInt16Array(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInt32Array
   (
      value : Windows.Int32_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInt32Array(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUInt32Array
   (
      value : Windows.UInt32_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUInt32Array(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInt64Array
   (
      value : Windows.Int64_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInt64Array(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUInt64Array
   (
      value : Windows.UInt64_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUInt64Array(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSingleArray
   (
      value : Windows.Single_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSingleArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDoubleArray
   (
      value : Windows.Double_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDoubleArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateChar16Array
   (
      value : Windows.UInt8_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateChar16Array(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBooleanArray
   (
      value : Windows.Boolean_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateBooleanArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStringArray
   (
      value : Windows.String_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateStringArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInspectableArray
   (
      value : Windows.Object_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInspectableArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateGuidArray
   (
      value : Windows.Guid_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateGuidArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDateTimeArray
   (
      value : Windows.Foundation.DateTime_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDateTimeArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimeSpanArray
   (
      value : Windows.Foundation.TimeSpan_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTimeSpanArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePointArray
   (
      value : Windows.Foundation.Point_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePointArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSizeArray
   (
      value : Windows.Foundation.Size_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSizeArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRectArray
   (
      value : Windows.Foundation.Rect_Ptr
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.PropertyValue");
      m_Factory     : IPropertyValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateRectArray(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnescapeComponent
   (
      toUnescape : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Uri");
      m_Factory     : IUriEscapeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUriEscapeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnescapeComponent(toUnescape, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function EscapeComponent
   (
      toEscape : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Foundation.Uri");
      m_Factory     : IUriEscapeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUriEscapeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.EscapeComponent(toEscape, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
