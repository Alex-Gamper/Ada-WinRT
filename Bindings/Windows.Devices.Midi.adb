--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Devices.Enumeration;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Midi is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMidiInPort_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMidiInPort or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IMidiInPort_Interface
      ; asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiInPort
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMidiOutPort_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMidiOutPort or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IMidiOutPort_Interface
      ; asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiOutPort
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMidiInPort_add_MessageReceived_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMidiInPort_add_MessageReceived or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IMidiInPort_add_MessageReceived_Interface
      ; sender : Windows.Devices.Midi.IMidiInPort
      ; args : Windows.Devices.Midi.IMidiMessageReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Midi.IMidiInPort(sender), Windows.Devices.Midi.IMidiMessageReceivedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMidiSynthesizer_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMidiSynthesizer or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IMidiSynthesizer_Interface
      ; asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer
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
   
   
   function CreateMidiNoteOffMessage
   (
      channel : Windows.UInt8
      ; note : Windows.UInt8
      ; velocity : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiNoteOffMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiNoteOffMessage");
      m_Factory     : Windows.Devices.Midi.IMidiNoteOffMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiNoteOffMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiNoteOffMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiNoteOffMessage(channel, note, velocity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiNoteOnMessage
   (
      channel : Windows.UInt8
      ; note : Windows.UInt8
      ; velocity : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiNoteOnMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiNoteOnMessage");
      m_Factory     : Windows.Devices.Midi.IMidiNoteOnMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiNoteOnMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiNoteOnMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiNoteOnMessage(channel, note, velocity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiPolyphonicKeyPressureMessage
   (
      channel : Windows.UInt8
      ; note : Windows.UInt8
      ; pressure : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiPolyphonicKeyPressureMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiPolyphonicKeyPressureMessage");
      m_Factory     : Windows.Devices.Midi.IMidiPolyphonicKeyPressureMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiPolyphonicKeyPressureMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiPolyphonicKeyPressureMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiPolyphonicKeyPressureMessage(channel, note, pressure, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiControlChangeMessage
   (
      channel : Windows.UInt8
      ; controller : Windows.UInt8
      ; controlValue : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiControlChangeMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiControlChangeMessage");
      m_Factory     : Windows.Devices.Midi.IMidiControlChangeMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiControlChangeMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiControlChangeMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiControlChangeMessage(channel, controller, controlValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiProgramChangeMessage
   (
      channel : Windows.UInt8
      ; program : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiProgramChangeMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiProgramChangeMessage");
      m_Factory     : Windows.Devices.Midi.IMidiProgramChangeMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiProgramChangeMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiProgramChangeMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiProgramChangeMessage(channel, program, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiChannelPressureMessage
   (
      channel : Windows.UInt8
      ; pressure : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiChannelPressureMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiChannelPressureMessage");
      m_Factory     : Windows.Devices.Midi.IMidiChannelPressureMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiChannelPressureMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiChannelPressureMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiChannelPressureMessage(channel, pressure, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiPitchBendChangeMessage
   (
      channel : Windows.UInt8
      ; bend : Windows.UInt16
   )
   return Windows.Devices.Midi.IMidiPitchBendChangeMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiPitchBendChangeMessage");
      m_Factory     : Windows.Devices.Midi.IMidiPitchBendChangeMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiPitchBendChangeMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiPitchBendChangeMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiPitchBendChangeMessage(channel, bend, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiSystemExclusiveMessage
   (
      rawData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.Midi.IMidiMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiSystemExclusiveMessage");
      m_Factory     : Windows.Devices.Midi.IMidiSystemExclusiveMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiSystemExclusiveMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiSystemExclusiveMessage(rawData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiTimeCodeMessage
   (
      frameType : Windows.UInt8
      ; values : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiTimeCodeMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiTimeCodeMessage");
      m_Factory     : Windows.Devices.Midi.IMidiTimeCodeMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiTimeCodeMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiTimeCodeMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiTimeCodeMessage(frameType, values, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiSongPositionPointerMessage
   (
      beats : Windows.UInt16
   )
   return Windows.Devices.Midi.IMidiSongPositionPointerMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiSongPositionPointerMessage");
      m_Factory     : Windows.Devices.Midi.IMidiSongPositionPointerMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiSongPositionPointerMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiSongPositionPointerMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiSongPositionPointerMessage(beats, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiSongSelectMessage
   (
      song : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiSongSelectMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiSongSelectMessage");
      m_Factory     : Windows.Devices.Midi.IMidiSongSelectMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiSongSelectMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiSongSelectMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMidiSongSelectMessage(song, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiTuneRequestMessage return Windows.Devices.Midi.IMidiMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiTuneRequestMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Midi.IID_IMidiMessage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiTimingClockMessage return Windows.Devices.Midi.IMidiMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiTimingClockMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Midi.IID_IMidiMessage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiStartMessage return Windows.Devices.Midi.IMidiMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiStartMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Midi.IID_IMidiMessage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiContinueMessage return Windows.Devices.Midi.IMidiMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiContinueMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Midi.IID_IMidiMessage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiStopMessage return Windows.Devices.Midi.IMidiMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiStopMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Midi.IID_IMidiMessage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiActiveSensingMessage return Windows.Devices.Midi.IMidiMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiActiveSensingMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Midi.IID_IMidiMessage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMidiSystemResetMessage return Windows.Devices.Midi.IMidiMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiSystemResetMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IMidiMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Midi.IID_IMidiMessage'Access, RetVal'Address);
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
   
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Midi.IAsyncOperation_IMidiInPort is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiInPort");
      m_Factory     : IMidiInPortStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IAsyncOperation_IMidiInPort;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiInPortStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiInPort");
      m_Factory     : IMidiInPortStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiInPortStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Midi.IAsyncOperation_IMidiOutPort is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiOutPort");
      m_Factory     : IMidiOutPortStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IAsyncOperation_IMidiOutPort;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiOutPortStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector_IMidiOutPort
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiOutPort");
      m_Factory     : IMidiOutPortStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiOutPortStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAsync
   return Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiSynthesizer");
      m_Factory     : IMidiSynthesizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiSynthesizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromAudioDeviceAsync
   (
      audioDevice : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiSynthesizer");
      m_Factory     : IMidiSynthesizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiSynthesizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromAudioDeviceAsync(audioDevice, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSynthesizer
   (
      midiDevice : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Midi.MidiSynthesizer");
      m_Factory     : IMidiSynthesizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMidiSynthesizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSynthesizer(midiDevice, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
