--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.UI;
with Windows.UI.Popups;
with Windows.Storage.Streams;
with Windows.ApplicationModel.Background;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Enumeration is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_DeviceAccessStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_DeviceAccessStatus or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DeviceAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_DeviceAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDevicePicker_add_DeviceSelected_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDevicePicker_add_DeviceSelected or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DeviceSelected_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Devices.Enumeration.IDeviceSelectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDevicePicker(sender), Windows.Devices.Enumeration.IDeviceSelectedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DisconnectButtonClicked_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDevicePicker(sender), Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDevicePicker_add_DevicePickerDismissed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDevicePicker_add_DevicePickerDismissed or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePicker_add_DevicePickerDismissed_Interface
      ; sender : Windows.Devices.Enumeration.IDevicePicker
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDevicePicker(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IDeviceInformation_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IDeviceInformation or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceInformation_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDeviceWatcher_add_Added_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDeviceWatcher_add_Added or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Added_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), Windows.Devices.Enumeration.IDeviceInformation(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDeviceWatcher_add_Updated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDeviceWatcher_add_Updated or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Updated_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformationUpdate
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), Windows.Devices.Enumeration.IDeviceInformationUpdate(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDeviceWatcher_add_Removed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDeviceWatcher_add_Removed or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Removed_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Devices.Enumeration.IDeviceInformationUpdate
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), Windows.Devices.Enumeration.IDeviceInformationUpdate(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDeviceWatcher_add_Stopped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDeviceWatcher_add_Stopped or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IVectorView_DeviceInformation_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IVectorView_DeviceInformation or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVectorView_DeviceInformation_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IDevicePairingResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IDevicePairingResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDevicePairingResult_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDevicePairingResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceInformationCustomPairing_add_PairingRequested_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceInformationCustomPairing
      ; args : Windows.Devices.Enumeration.IDevicePairingRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceInformationCustomPairing(sender), Windows.Devices.Enumeration.IDevicePairingRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IDeviceUnpairingResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IDeviceUnpairingResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDeviceUnpairingResult_Interface
      ; asyncInfo : Windows.Devices.Enumeration.IAsyncOperation_IDeviceUnpairingResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDeviceAccessInformation_add_AccessChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDeviceAccessInformation_add_AccessChanged or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDeviceAccessInformation_add_AccessChanged_Interface
      ; sender : Windows.Devices.Enumeration.IDeviceAccessInformation
      ; args : Windows.Devices.Enumeration.IDeviceAccessChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Enumeration.IDeviceAccessInformation(sender), Windows.Devices.Enumeration.IDeviceAccessChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateDevicePicker return Windows.Devices.Enumeration.IDevicePicker is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DevicePicker");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDevicePicker := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Enumeration.IID_IDevicePicker'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function CreateFromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromIdAsyncAdditionalProperties
   (
      deviceId : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdAsyncAdditionalProperties(deviceId, additionalProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncDeviceClass(deviceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncAqsFilter
   (
      aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncAqsFilter(aqsFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherDeviceClass(deviceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherAqsFilter
   (
      aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherAqsFilter(aqsFilter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAqsFilterFromDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAqsFilterFromDeviceClass(deviceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromIdAsyncWithKindAndAdditionalProperties
   (
      deviceId : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IDeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdAsyncWithKindAndAdditionalProperties(deviceId, additionalProperties, kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsyncWithKindAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IAsyncOperation_IVectorView_DeviceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsyncWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcherWithKindAqsFilterAndAdditionalProperties
   (
      aqsFilter : Windows.String
      ; additionalProperties : Windows.Foundation.Collections.IIterable_String
      ; kind : Windows.Devices.Enumeration.DeviceInformationKind
   )
   return Windows.Devices.Enumeration.IDeviceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformation");
      m_Factory     : IDeviceInformationStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcherWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryRegisterForAllInboundPairingRequests
   (
      pairingKindsSupported : Windows.Devices.Enumeration.DevicePairingKinds
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceInformationPairing");
      m_Factory     : IDeviceInformationPairingStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceInformationPairingStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryRegisterForAllInboundPairingRequests(pairingKindsSupported, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromId
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceAccessInformation");
      m_Factory     : IDeviceAccessInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceAccessInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceAccessInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDeviceClassId
   (
      deviceClassId : Windows.Guid
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceAccessInformation");
      m_Factory     : IDeviceAccessInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceAccessInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceAccessInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDeviceClassId(deviceClassId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDeviceClass
   (
      deviceClass : Windows.Devices.Enumeration.DeviceClass
   )
   return Windows.Devices.Enumeration.IDeviceAccessInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Enumeration.DeviceAccessInformation");
      m_Factory     : IDeviceAccessInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.IDeviceAccessInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDeviceAccessInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDeviceClass(deviceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
