--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.ApplicationModel;
with Windows.Data.Xml.Dom;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Notifications is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IToastCollection_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IToastCollection or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IToastCollection_Interface
      ; asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastCollection
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IToastNotification_add_Dismissed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IToastNotification_add_Dismissed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IToastNotification_add_Dismissed_Interface
      ; sender : Windows.UI.Notifications.IToastNotification
      ; args : Windows.UI.Notifications.IToastDismissedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Notifications.IToastNotification(sender), Windows.UI.Notifications.IToastDismissedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IToastNotification_add_Activated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IToastNotification_add_Activated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IToastNotification_add_Activated_Interface
      ; sender : Windows.UI.Notifications.IToastNotification
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Notifications.IToastNotification(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IToastNotification_add_Failed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IToastNotification_add_Failed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IToastNotification_add_Failed_Interface
      ; sender : Windows.UI.Notifications.IToastNotification
      ; args : Windows.UI.Notifications.IToastFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Notifications.IToastNotification(sender), Windows.UI.Notifications.IToastFailedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IToastNotifier_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IToastNotifier or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IToastNotifier_Interface
      ; asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastNotifier
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IToastNotificationHistory_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IToastNotificationHistory or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IToastNotificationHistory_Interface
      ; asyncInfo : Windows.UI.Notifications.IAsyncOperation_IToastNotificationHistory
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
   
   
   function CreateNotification return Windows.UI.Notifications.INotification is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.Notification");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.INotification := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Notifications.IID_INotification'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAdaptiveNotificationText return Windows.UI.Notifications.IAdaptiveNotificationText is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.AdaptiveNotificationText");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IAdaptiveNotificationText := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Notifications.IID_IAdaptiveNotificationText'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTileNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.UI.Notifications.ITileNotification is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileNotification");
      m_Factory     : Windows.UI.Notifications.ITileNotificationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileNotification := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileNotificationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTileNotification(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateScheduledTileNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
   )
   return Windows.UI.Notifications.IScheduledTileNotification is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ScheduledTileNotification");
      m_Factory     : Windows.UI.Notifications.IScheduledTileNotificationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IScheduledTileNotification := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScheduledTileNotificationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateScheduledTileNotification(content, deliveryTime, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTileFlyoutNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.UI.Notifications.ITileFlyoutNotification is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileFlyoutNotification");
      m_Factory     : Windows.UI.Notifications.ITileFlyoutNotificationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileFlyoutNotification := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileFlyoutNotificationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTileFlyoutNotification(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBadgeNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.UI.Notifications.IBadgeNotification is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.BadgeNotification");
      m_Factory     : Windows.UI.Notifications.IBadgeNotificationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IBadgeNotification := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBadgeNotificationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateBadgeNotification(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateToastNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.UI.Notifications.IToastNotification is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastNotification");
      m_Factory     : Windows.UI.Notifications.IToastNotificationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IToastNotification := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateToastNotification(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateScheduledToastNotification
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
   )
   return Windows.UI.Notifications.IScheduledToastNotification is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ScheduledToastNotification");
      m_Factory     : Windows.UI.Notifications.IScheduledToastNotificationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IScheduledToastNotification := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScheduledToastNotificationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateScheduledToastNotification(content, deliveryTime, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateScheduledToastNotificationRecurring
   (
      content : Windows.Data.Xml.Dom.IXmlDocument
      ; deliveryTime : Windows.Foundation.DateTime
      ; snoozeInterval : Windows.Foundation.TimeSpan
      ; maximumSnoozeCount : Windows.UInt32
   )
   return Windows.UI.Notifications.IScheduledToastNotification is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ScheduledToastNotification");
      m_Factory     : Windows.UI.Notifications.IScheduledToastNotificationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IScheduledToastNotification := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScheduledToastNotificationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateScheduledToastNotificationRecurring(content, deliveryTime, snoozeInterval, maximumSnoozeCount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNotificationDataWithValuesAndSequenceNumber
   (
      initialValues : Windows.Address
      ; sequenceNumber : Windows.UInt32
   )
   return Windows.UI.Notifications.INotificationData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.NotificationData");
      m_Factory     : Windows.UI.Notifications.INotificationDataFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.INotificationData := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INotificationDataFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNotificationDataWithValuesAndSequenceNumber(initialValues, sequenceNumber, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNotificationDataWithValues
   (
      initialValues : Windows.Address
   )
   return Windows.UI.Notifications.INotificationData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.NotificationData");
      m_Factory     : Windows.UI.Notifications.INotificationDataFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.INotificationData := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INotificationDataFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNotificationDataWithValues(initialValues, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      collectionId : Windows.String
      ; displayName : Windows.String
      ; launchArgs : Windows.String
      ; iconUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.UI.Notifications.IToastCollection is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastCollection");
      m_Factory     : Windows.UI.Notifications.IToastCollectionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IToastCollection := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastCollectionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(collectionId, displayName, launchArgs, iconUri, RetVal'Access);
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
   
   
   function get_Style
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationHints");
      m_Factory     : IKnownAdaptiveNotificationHintsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationHintsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Style(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wrap
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationHints");
      m_Factory     : IKnownAdaptiveNotificationHintsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationHintsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wrap(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxLines
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationHints");
      m_Factory     : IKnownAdaptiveNotificationHintsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationHintsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxLines(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinLines
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationHints");
      m_Factory     : IKnownAdaptiveNotificationHintsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationHintsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinLines(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TextStacking
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationHints");
      m_Factory     : IKnownAdaptiveNotificationHintsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationHintsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TextStacking(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Align
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationHints");
      m_Factory     : IKnownAdaptiveNotificationHintsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationHintsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Align(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ToastGeneric
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownNotificationBindings");
      m_Factory     : IKnownNotificationBindingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownNotificationBindingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ToastGeneric(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Caption
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Caption(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Body
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Body(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Base
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Base(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Subtitle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Subtitle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Title
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Title(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Subheader
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Subheader(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Header
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Header(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TitleNumeral
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TitleNumeral(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SubheaderNumeral
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SubheaderNumeral(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeaderNumeral
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeaderNumeral(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CaptionSubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CaptionSubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BodySubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BodySubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BaseSubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BaseSubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SubtitleSubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SubtitleSubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TitleSubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TitleSubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SubheaderSubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SubheaderSubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SubheaderNumeralSubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SubheaderNumeralSubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeaderSubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeaderSubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeaderNumeralSubtle
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.KnownAdaptiveNotificationTextStyles");
      m_Factory     : IKnownAdaptiveNotificationTextStylesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownAdaptiveNotificationTextStylesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeaderNumeralSubtle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.UI.Notifications.ITileUpdateManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileUpdateManager");
      m_Factory     : ITileUpdateManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileUpdateManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileUpdateManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTileUpdaterForApplication
   return Windows.UI.Notifications.ITileUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileUpdateManager");
      m_Factory     : ITileUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTileUpdaterForApplication(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTileUpdaterForApplicationWithId
   (
      applicationId : Windows.String
   )
   return Windows.UI.Notifications.ITileUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileUpdateManager");
      m_Factory     : ITileUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTileUpdaterForApplicationWithId(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTileUpdaterForSecondaryTile
   (
      tileId : Windows.String
   )
   return Windows.UI.Notifications.ITileUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileUpdateManager");
      m_Factory     : ITileUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTileUpdaterForSecondaryTile(tileId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTemplateContent
   (
      type_x : Windows.UI.Notifications.TileTemplateType
   )
   return Windows.Data.Xml.Dom.IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileUpdateManager");
      m_Factory     : ITileUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTemplateContent(type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.UI.Notifications.IBadgeUpdateManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.BadgeUpdateManager");
      m_Factory     : IBadgeUpdateManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IBadgeUpdateManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBadgeUpdateManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBadgeUpdaterForApplication
   return Windows.UI.Notifications.IBadgeUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.BadgeUpdateManager");
      m_Factory     : IBadgeUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IBadgeUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBadgeUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateBadgeUpdaterForApplication(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBadgeUpdaterForApplicationWithId
   (
      applicationId : Windows.String
   )
   return Windows.UI.Notifications.IBadgeUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.BadgeUpdateManager");
      m_Factory     : IBadgeUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IBadgeUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBadgeUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateBadgeUpdaterForApplicationWithId(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBadgeUpdaterForSecondaryTile
   (
      tileId : Windows.String
   )
   return Windows.UI.Notifications.IBadgeUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.BadgeUpdateManager");
      m_Factory     : IBadgeUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IBadgeUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBadgeUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateBadgeUpdaterForSecondaryTile(tileId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTemplateContent
   (
      type_x : Windows.UI.Notifications.BadgeTemplateType
   )
   return Windows.Data.Xml.Dom.IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.BadgeUpdateManager");
      m_Factory     : IBadgeUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBadgeUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTemplateContent(type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTileFlyoutUpdaterForApplication
   return Windows.UI.Notifications.ITileFlyoutUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileFlyoutUpdateManager");
      m_Factory     : ITileFlyoutUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileFlyoutUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileFlyoutUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTileFlyoutUpdaterForApplication(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTileFlyoutUpdaterForApplicationWithId
   (
      applicationId : Windows.String
   )
   return Windows.UI.Notifications.ITileFlyoutUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileFlyoutUpdateManager");
      m_Factory     : ITileFlyoutUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileFlyoutUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileFlyoutUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTileFlyoutUpdaterForApplicationWithId(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTileFlyoutUpdaterForSecondaryTile
   (
      tileId : Windows.String
   )
   return Windows.UI.Notifications.ITileFlyoutUpdater is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileFlyoutUpdateManager");
      m_Factory     : ITileFlyoutUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.ITileFlyoutUpdater;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileFlyoutUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateTileFlyoutUpdaterForSecondaryTile(tileId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTemplateContent
   (
      type_x : Windows.UI.Notifications.TileFlyoutTemplateType
   )
   return Windows.Data.Xml.Dom.IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.TileFlyoutUpdateManager");
      m_Factory     : ITileFlyoutUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITileFlyoutUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTemplateContent(type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.UI.Notifications.IToastNotificationManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastNotificationManager");
      m_Factory     : IToastNotificationManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IToastNotificationManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ConfigureNotificationMirroring
   (
      value : Windows.UI.Notifications.NotificationMirroring
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastNotificationManager");
      m_Factory     : IToastNotificationManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConfigureNotificationMirroring(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_History
   return Windows.UI.Notifications.IToastNotificationHistory is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastNotificationManager");
      m_Factory     : IToastNotificationManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IToastNotificationHistory;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_History(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateToastNotifier
   return Windows.UI.Notifications.IToastNotifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastNotificationManager");
      m_Factory     : IToastNotificationManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IToastNotifier;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateToastNotifier(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateToastNotifierWithId
   (
      applicationId : Windows.String
   )
   return Windows.UI.Notifications.IToastNotifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastNotificationManager");
      m_Factory     : IToastNotificationManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IToastNotifier;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateToastNotifierWithId(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTemplateContent
   (
      type_x : Windows.UI.Notifications.ToastTemplateType
   )
   return Windows.Data.Xml.Dom.IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastNotificationManager");
      m_Factory     : IToastNotificationManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTemplateContent(type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.UI.Notifications.IToastNotificationManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Notifications.ToastNotificationManager");
      m_Factory     : IToastNotificationManagerStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Notifications.IToastNotificationManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IToastNotificationManagerStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
