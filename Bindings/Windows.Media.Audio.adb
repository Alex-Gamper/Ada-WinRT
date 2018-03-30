--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Media.MediaProperties;
with Windows.Media.Capture;
with Windows.Devices.Enumeration;
with Windows.Storage;
with Windows.Media;
with Windows.Media.Render;
with Windows.Media.Effects;
with Windows.Media.Transcoding;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Audio is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ICreateAudioGraphResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ICreateAudioGraphResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioGraphResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceInputNodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceOutputNodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioFileInputNodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioFileOutputNodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAudioGraph_add_QuantumStarted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAudioGraph_add_QuantumStarted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAudioGraph_add_QuantumStarted_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioGraph(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAudioGraph_add_QuantumProcessed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAudioGraph_add_QuantumProcessed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAudioGraph_add_QuantumProcessed_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioGraph(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioGraph(sender), Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted_Interface
      ; sender : Windows.Media.Audio.IAudioFrameInputNode
      ; args : Windows.Media.Audio.IAudioFrameCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioFrameInputNode(sender), Windows.Media.Audio.IAudioFrameCompletedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted_Interface
      ; sender : Windows.Media.Audio.IAudioFrameInputNode
      ; args : Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioFrameInputNode(sender), Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAudioFileInputNode_add_FileCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAudioFileInputNode_add_FileCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAudioFileInputNode_add_FileCompleted_Interface
      ; sender : Windows.Media.Audio.IAudioFileInputNode
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioFileInputNode(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      audioRenderCategory : Windows.Media.Render.AudioRenderCategory
   )
   return Windows.Media.Audio.IAudioGraphSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioGraphSettings");
      m_Factory     : Windows.Media.Audio.IAudioGraphSettingsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioGraphSettings := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioGraphSettingsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioRenderCategory, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAudioNodeEmitter return Windows.Media.Audio.IAudioNodeEmitter is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitter");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitter := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Audio.IID_IAudioNodeEmitter'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAudioNodeListener return Windows.Media.Audio.IAudioNodeListener is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeListener");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeListener := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Audio.IID_IAudioNodeListener'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IEqualizerEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.EqualizerEffectDefinition");
      m_Factory     : Windows.Media.Audio.IEqualizerEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IEqualizerEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEqualizerEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioGraph, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IReverbEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.ReverbEffectDefinition");
      m_Factory     : Windows.Media.Audio.IReverbEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IReverbEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IReverbEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioGraph, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IEchoEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.EchoEffectDefinition");
      m_Factory     : Windows.Media.Audio.IEchoEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IEchoEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEchoEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioGraph, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.ILimiterEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.LimiterEffectDefinition");
      m_Factory     : Windows.Media.Audio.ILimiterEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.ILimiterEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILimiterEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioGraph, RetVal'Access);
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
   
   
   function CreateAsync
   (
      settings : Windows.Media.Audio.IAudioGraphSettings
   )
   return Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioGraph");
      m_Factory     : IAudioGraphStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioGraphStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(settings, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCone
   (
      innerAngle : Windows.Double
      ; outerAngle : Windows.Double
      ; outerAngleGain : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterShape is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitterShape");
      m_Factory     : IAudioNodeEmitterShapeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitterShape;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioNodeEmitterShapeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCone(innerAngle, outerAngle, outerAngleGain, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateOmnidirectional
   return Windows.Media.Audio.IAudioNodeEmitterShape is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitterShape");
      m_Factory     : IAudioNodeEmitterShapeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitterShape;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioNodeEmitterShapeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateOmnidirectional(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNatural
   (
      minGain : Windows.Double
      ; maxGain : Windows.Double
      ; unityGainDistance : Windows.Double
      ; cutoffDistance : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterDecayModel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitterDecayModel");
      m_Factory     : IAudioNodeEmitterDecayModelStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitterDecayModel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioNodeEmitterDecayModelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNatural(minGain, maxGain, unityGainDistance, cutoffDistance, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCustom
   (
      minGain : Windows.Double
      ; maxGain : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterDecayModel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitterDecayModel");
      m_Factory     : IAudioNodeEmitterDecayModelStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitterDecayModel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioNodeEmitterDecayModelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCustom(minGain, maxGain, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
