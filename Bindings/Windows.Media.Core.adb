--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Graphics.Imaging;
with Windows.UI;
with Windows.Media.MediaProperties;
with Windows.Media.Protection;
with Windows.Storage.FileProperties;
with Windows.ApplicationModel.AppService;
with Windows.Media.Devices.Core;
with Windows.Media.Capture;
with Windows.Media.FaceAnalysis;
with Windows.Media.Devices;
with Windows.Media.Streaming.Adaptive;
with Windows.Storage;
with Windows.Media.Capture.Frames;
with Windows.Media.Playback;
with Windows.Media.Effects;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IMediaStreamSource_add_Closed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaStreamSource_add_Closed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaStreamSource_add_Closed_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceClosedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaStreamSource(sender), Windows.Media.Core.IMediaStreamSourceClosedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaStreamSource_add_Starting_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaStreamSource_add_Starting or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaStreamSource_add_Starting_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceStartingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaStreamSource(sender), Windows.Media.Core.IMediaStreamSourceStartingEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaStreamSource_add_Paused_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaStreamSource_add_Paused or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaStreamSource_add_Paused_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaStreamSource(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaStreamSource_add_SampleRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaStreamSource_add_SampleRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaStreamSource_add_SampleRequested_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaStreamSource(sender), Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaStreamSource_add_SwitchStreamsRequested_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaStreamSource(sender), Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaStreamSource2_add_SampleRendered_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaStreamSource2_add_SampleRendered or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaStreamSource2_add_SampleRendered_Interface
      ; sender : Windows.Media.Core.IMediaStreamSource
      ; args : Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaStreamSource(sender), Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaStreamSample_add_Processed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaStreamSample_add_Processed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaStreamSample_add_Processed_Interface
      ; sender : Windows.Media.Core.IMediaStreamSample
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaStreamSample(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMediaStreamSample_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMediaStreamSample or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IMediaStreamSample_Interface
      ; asyncInfo : Windows.Media.Core.IAsyncOperation_IMediaStreamSample
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseStreamSource_add_Opened_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseStreamSource_add_Opened or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseStreamSource_add_Opened_Interface
      ; sender : Windows.Media.Core.IMseStreamSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseStreamSource(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseStreamSource_add_Ended_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseStreamSource_add_Ended or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseStreamSource_add_Ended_Interface
      ; sender : Windows.Media.Core.IMseStreamSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseStreamSource(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseStreamSource_add_Closed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseStreamSource_add_Closed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseStreamSource_add_Closed_Interface
      ; sender : Windows.Media.Core.IMseStreamSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseStreamSource(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseSourceBuffer_add_UpdateStarting_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseSourceBuffer_add_UpdateStarting or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseSourceBuffer_add_UpdateStarting_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseSourceBuffer(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseSourceBuffer_add_Updated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseSourceBuffer_add_Updated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseSourceBuffer_add_Updated_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseSourceBuffer(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseSourceBuffer_add_UpdateEnded_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseSourceBuffer_add_UpdateEnded or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseSourceBuffer_add_UpdateEnded_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseSourceBuffer(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseSourceBuffer_add_ErrorOccurred_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseSourceBuffer(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseSourceBuffer_add_Aborted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseSourceBuffer_add_Aborted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseSourceBuffer_add_Aborted_Interface
      ; sender : Windows.Media.Core.IMseSourceBuffer
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseSourceBuffer(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseSourceBufferList_add_SourceBufferAdded_Interface
      ; sender : Windows.Media.Core.IMseSourceBufferList
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseSourceBufferList(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMseSourceBufferList_add_SourceBufferRemoved_Interface
      ; sender : Windows.Media.Core.IMseSourceBufferList
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMseSourceBufferList(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaSourceAppServiceConnection_add_InitializeMediaStreamSourceRequested_Interface
      ; sender : Windows.Media.Core.IMediaSourceAppServiceConnection
      ; args : Windows.Media.Core.IInitializeMediaStreamSourceRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaSourceAppServiceConnection(sender), Windows.Media.Core.IInitializeMediaStreamSourceRequestedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ISceneAnalysisEffect_add_SceneAnalyzed_Interface
      ; sender : Windows.Media.Core.ISceneAnalysisEffect
      ; args : Windows.Media.Core.ISceneAnalyzedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.ISceneAnalysisEffect(sender), Windows.Media.Core.ISceneAnalyzedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IFaceDetectionEffect_add_FaceDetected_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IFaceDetectionEffect_add_FaceDetected or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IFaceDetectionEffect_add_FaceDetected_Interface
      ; sender : Windows.Media.Core.IFaceDetectionEffect
      ; args : Windows.Media.Core.IFaceDetectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IFaceDetectionEffect(sender), Windows.Media.Core.IFaceDetectedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IVideoStabilizationEffect_add_EnabledChanged_Interface
      ; sender : Windows.Media.Core.IVideoStabilizationEffect
      ; args : Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IVideoStabilizationEffect(sender), Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaBinder_add_Binding_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaBinder_add_Binding or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaBinder_add_Binding_Interface
      ; sender : Windows.Media.Core.IMediaBinder
      ; args : Windows.Media.Core.IMediaBindingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaBinder(sender), Windows.Media.Core.IMediaBindingEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaBindingEventArgs_add_Canceled_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaBindingEventArgs_add_Canceled or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaBindingEventArgs_add_Canceled_Interface
      ; sender : Windows.Media.Core.IMediaBindingEventArgs
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaBindingEventArgs(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaSource2_add_OpenOperationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaSource2_add_OpenOperationCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaSource2_add_OpenOperationCompleted_Interface
      ; sender : Windows.Media.Core.IMediaSource2
      ; args : Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaSource2(sender), Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access VectorChangedEventHandler_ITimedTextSource_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_VectorChangedEventHandler_ITimedTextSource or riid.all = IID_IUnknown then
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
      This       : access VectorChangedEventHandler_ITimedTextSource_Interface
      ; sender : Windows.Media.Core.IObservableVector_ITimedTextSource
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, event);
      return Hr;
   end;
   
   function QueryInterface(This : access VectorChangedEventHandler_ITimedMetadataTrack_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_VectorChangedEventHandler_ITimedMetadataTrack or riid.all = IID_IUnknown then
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
      This       : access VectorChangedEventHandler_ITimedMetadataTrack_Interface
      ; sender : Windows.Media.Core.IObservableVector_ITimedMetadataTrack
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, event);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMediaSource3_add_StateChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMediaSource3_add_StateChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMediaSource3_add_StateChanged_Interface
      ; sender : Windows.Media.Core.IMediaSource2
      ; args : Windows.Media.Core.IMediaSourceStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaSource2(sender), Windows.Media.Core.IMediaSourceStateChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ISingleSelectMediaTrackList_add_SelectedIndexChanged_Interface
      ; sender : Windows.Media.Core.ISingleSelectMediaTrackList
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ITimedMetadataTrack_add_CueEntered_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ITimedMetadataTrack_add_CueEntered or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ITimedMetadataTrack_add_CueEntered_Interface
      ; sender : Windows.Media.Core.ITimedMetadataTrack
      ; args : Windows.Media.Core.IMediaCueEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.ITimedMetadataTrack(sender), Windows.Media.Core.IMediaCueEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ITimedMetadataTrack_add_CueExited_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ITimedMetadataTrack_add_CueExited or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ITimedMetadataTrack_add_CueExited_Interface
      ; sender : Windows.Media.Core.ITimedMetadataTrack
      ; args : Windows.Media.Core.IMediaCueEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.ITimedMetadataTrack(sender), Windows.Media.Core.IMediaCueEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ITimedMetadataTrack_add_TrackFailed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ITimedMetadataTrack_add_TrackFailed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ITimedMetadataTrack_add_TrackFailed_Interface
      ; sender : Windows.Media.Core.ITimedMetadataTrack
      ; args : Windows.Media.Core.ITimedMetadataTrackFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.ITimedMetadataTrack(sender), Windows.Media.Core.ITimedMetadataTrackFailedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ITimedTextSource_add_Resolved_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ITimedTextSource_add_Resolved or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ITimedTextSource_add_Resolved_Interface
      ; sender : Windows.Media.Core.ITimedTextSource
      ; args : Windows.Media.Core.ITimedTextSourceResolveResultEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.ITimedTextSource(sender), Windows.Media.Core.ITimedTextSourceResolveResultEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IVideoTrack_add_OpenFailed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IVideoTrack_add_OpenFailed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IVideoTrack_add_OpenFailed_Interface
      ; sender : Windows.Media.Core.IMediaTrack
      ; args : Windows.Media.Core.IVideoTrackOpenFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaTrack(sender), Windows.Media.Core.IVideoTrackOpenFailedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAudioTrack_add_OpenFailed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAudioTrack_add_OpenFailed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAudioTrack_add_OpenFailed_Interface
      ; sender : Windows.Media.Core.IMediaTrack
      ; args : Windows.Media.Core.IAudioTrackOpenFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Core.IMediaTrack(sender), Windows.Media.Core.IAudioTrackOpenFailedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateTimedTextRegion return Windows.Media.Core.ITimedTextRegion is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextRegion");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextRegion := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_ITimedTextRegion'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimedTextStyle return Windows.Media.Core.ITimedTextStyle is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextStyle");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextStyle := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_ITimedTextStyle'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimedTextLine return Windows.Media.Core.ITimedTextLine is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextLine");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextLine := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_ITimedTextLine'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimedTextSubformat return Windows.Media.Core.ITimedTextSubformat is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSubformat");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSubformat := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_ITimedTextSubformat'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimedTextCue return Windows.Media.Core.ITimedTextCue is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextCue");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextCue := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_ITimedTextCue'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDataCue return Windows.Media.Core.IDataCue is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.DataCue");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IDataCue := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_IDataCue'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateChapterCue return Windows.Media.Core.IChapterCue is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.ChapterCue");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IChapterCue := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_IChapterCue'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateImageCue return Windows.Media.Core.IImageCue is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.ImageCue");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IImageCue := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_IImageCue'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSpeechCue return Windows.Media.Core.ISpeechCue is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.SpeechCue");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ISpeechCue := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_ISpeechCue'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCodecQuery return Windows.Media.Core.ICodecQuery is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecQuery");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ICodecQuery := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_ICodecQuery'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.Media.Core.IAudioStreamDescriptor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.AudioStreamDescriptor");
      m_Factory     : Windows.Media.Core.IAudioStreamDescriptorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IAudioStreamDescriptor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioStreamDescriptorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(encodingProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      encodingProperties : Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.Media.Core.IVideoStreamDescriptor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.VideoStreamDescriptor");
      m_Factory     : Windows.Media.Core.IVideoStreamDescriptorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IVideoStreamDescriptor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoStreamDescriptorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(encodingProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDescriptor
   (
      descriptor : Windows.Media.Core.IMediaStreamDescriptor
   )
   return Windows.Media.Core.IMediaStreamSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaStreamSource");
      m_Factory     : Windows.Media.Core.IMediaStreamSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaStreamSource := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaStreamSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDescriptor(descriptor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDescriptors
   (
      descriptor : Windows.Media.Core.IMediaStreamDescriptor
      ; descriptor2 : Windows.Media.Core.IMediaStreamDescriptor
   )
   return Windows.Media.Core.IMediaStreamSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaStreamSource");
      m_Factory     : Windows.Media.Core.IMediaStreamSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaStreamSource := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaStreamSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDescriptors(descriptor, descriptor2, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMseStreamSource return Windows.Media.Core.IMseStreamSource is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MseStreamSource");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMseStreamSource := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_IMseStreamSource'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
   )
   return Windows.Media.Core.IMediaSourceAppServiceConnection is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSourceAppServiceConnection");
      m_Factory     : Windows.Media.Core.IMediaSourceAppServiceConnectionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSourceAppServiceConnection := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceAppServiceConnectionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(appServiceConnection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSceneAnalysisEffectDefinition return Windows.Media.Effects.IVideoEffectDefinition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.SceneAnalysisEffectDefinition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IVideoEffectDefinition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Effects.IID_IVideoEffectDefinition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFaceDetectionEffectDefinition return Windows.Media.Effects.IVideoEffectDefinition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.FaceDetectionEffectDefinition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IVideoEffectDefinition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Effects.IID_IVideoEffectDefinition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVideoStabilizationEffectDefinition return Windows.Media.Effects.IVideoEffectDefinition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.VideoStabilizationEffectDefinition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IVideoEffectDefinition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Effects.IID_IVideoEffectDefinition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMediaBinder return Windows.Media.Core.IMediaBinder is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaBinder");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaBinder := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Core.IID_IMediaBinder'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      id : Windows.String
      ; language : Windows.String
      ; kind : Windows.Media.Core.TimedMetadataKind
   )
   return Windows.Media.Core.ITimedMetadataTrack is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedMetadataTrack");
      m_Factory     : Windows.Media.Core.ITimedMetadataTrackFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedMetadataTrack := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedMetadataTrackFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(id, language, kind, RetVal'Access);
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
   
   
   function get_VideoFormatDV25
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatDV25(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatDV50
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatDV50(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatDvc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatDvc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatDvh1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatDvh1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatDvhD
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatDvhD(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatDvsd
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatDvsd(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatDvsl
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatDvsl(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatH263
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatH263(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatH264
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatH264(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatH265
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatH265(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatH264ES
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatH264ES(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatHevc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatHevc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatHevcES
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatHevcES(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatM4S2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatM4S2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatMjpg
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatMjpg(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatMP43
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatMP43(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatMP4S
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatMP4S(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatMP4V
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatMP4V(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatMpeg2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatMpeg2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatVP80
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatVP80(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatVP90
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatVP90(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatMpg1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatMpg1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatMss1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatMss1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatMss2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatMss2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatWmv1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatWmv1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatWmv2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatWmv2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatWmv3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatWmv3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormatWvc1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormatWvc1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoFormat420O
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoFormat420O(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatAac
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatAac(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatAdts
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatAdts(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatAlac
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatAlac(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatAmrNB
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatAmrNB(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatAmrWB
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatAmrWB(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatAmrWP
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatAmrWP(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatDolbyAC3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatDolbyAC3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatDolbyAC3Spdif
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatDolbyAC3Spdif(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatDolbyDDPlus
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatDolbyDDPlus(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatDrm
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatDrm(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatDts
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatDts(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatFlac
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatFlac(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatFloat
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatFloat(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatMP3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatMP3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatMPeg
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatMPeg(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatMsp1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatMsp1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatOpus
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatOpus(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatPcm
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatPcm(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatWmaSpdif
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatWmaSpdif(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatWMAudioLossless
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatWMAudioLossless(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatWMAudioV8
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatWMAudioV8(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AudioFormatWMAudioV9
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.CodecSubtypes");
      m_Factory     : ICodecSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICodecSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AudioFormatWMAudioV9(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedBitmapPixelFormats
   return Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.LowLightFusion");
      m_Factory     : ILowLightFusionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILowLightFusionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedBitmapPixelFormats(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxSupportedFrameCount
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.LowLightFusion");
      m_Factory     : ILowLightFusionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILowLightFusionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxSupportedFrameCount(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FuseAsync
   (
      frameSet : Windows.Graphics.Imaging.IIterable_ISoftwareBitmap
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.LowLightFusion");
      m_Factory     : ILowLightFusionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILowLightFusionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FuseAsync(frameSet, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
      ; timestamp : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Core.IMediaStreamSample is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaStreamSample");
      m_Factory     : IMediaStreamSampleStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaStreamSample;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaStreamSampleStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromBuffer(buffer, timestamp, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStreamAsync
   (
      stream : Windows.Storage.Streams.IInputStream
      ; count : Windows.UInt32
      ; timestamp : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Core.IAsyncOperation_IMediaStreamSample is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaStreamSample");
      m_Factory     : IMediaStreamSampleStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IAsyncOperation_IMediaStreamSample;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaStreamSampleStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStreamAsync(stream, count, timestamp, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsContentTypeSupported
   (
      contentType : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MseStreamSource");
      m_Factory     : IMseStreamSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMseStreamSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsContentTypeSupported(contentType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromAdaptiveMediaSource
   (
      mediaSource : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromAdaptiveMediaSource(mediaSource, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromMediaStreamSource
   (
      mediaSource : Windows.Media.Core.IMediaStreamSource
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromMediaStreamSource(mediaSource, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromMseStreamSource
   (
      mediaSource : Windows.Media.Core.IMseStreamSource
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromMseStreamSource(mediaSource, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromIMediaSource
   (
      mediaSource : Windows.Media.Core.IMediaSource
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIMediaSource(mediaSource, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStorageFile
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStorageFile(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStream
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; contentType : Windows.String
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStream(stream, contentType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStreamReference
   (
      stream : Windows.Storage.Streams.IRandomAccessStreamReference
      ; contentType : Windows.String
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStreamReference(stream, contentType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromUri
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromUri(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromMediaBinder
   (
      binder : Windows.Media.Core.IMediaBinder
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromMediaBinder(binder, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromMediaFrameSource
   (
      frameSource : Windows.Media.Capture.Frames.IMediaFrameSource
   )
   return Windows.Media.Core.IMediaSource2 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.MediaSource");
      m_Factory     : IMediaSourceStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.IMediaSource2;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaSourceStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromMediaFrameSource(frameSource, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStreamWithIndex
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; indexStream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Media.Core.ITimedTextSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSource");
      m_Factory     : ITimedTextSourceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedTextSourceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStreamWithIndex(stream, indexStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromUriWithIndex
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; indexUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Media.Core.ITimedTextSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSource");
      m_Factory     : ITimedTextSourceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedTextSourceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromUriWithIndex(uri, indexUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStreamWithIndexAndLanguage
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; indexStream : Windows.Storage.Streams.IRandomAccessStream
      ; defaultLanguage : Windows.String
   )
   return Windows.Media.Core.ITimedTextSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSource");
      m_Factory     : ITimedTextSourceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedTextSourceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStreamWithIndexAndLanguage(stream, indexStream, defaultLanguage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromUriWithIndexAndLanguage
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; indexUri : Windows.Foundation.IUriRuntimeClass
      ; defaultLanguage : Windows.String
   )
   return Windows.Media.Core.ITimedTextSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSource");
      m_Factory     : ITimedTextSourceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedTextSourceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromUriWithIndexAndLanguage(uri, indexUri, defaultLanguage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStream
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Media.Core.ITimedTextSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSource");
      m_Factory     : ITimedTextSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedTextSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStream(stream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromUri
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Media.Core.ITimedTextSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSource");
      m_Factory     : ITimedTextSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedTextSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromUri(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStreamWithLanguage
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; defaultLanguage : Windows.String
   )
   return Windows.Media.Core.ITimedTextSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSource");
      m_Factory     : ITimedTextSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedTextSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStreamWithLanguage(stream, defaultLanguage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromUriWithLanguage
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; defaultLanguage : Windows.String
   )
   return Windows.Media.Core.ITimedTextSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Core.TimedTextSource");
      m_Factory     : ITimedTextSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Core.ITimedTextSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimedTextSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromUriWithLanguage(uri, defaultLanguage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
