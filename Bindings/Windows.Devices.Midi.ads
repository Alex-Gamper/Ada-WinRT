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
limited with Windows.Storage.Streams;
limited with Windows.Devices.Enumeration;
--------------------------------------------------------------------------------
package Windows.Devices.Midi is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MidiMessageType is (
      None,
      NoteOff,
      NoteOn,
      PolyphonicKeyPressure,
      ControlChange,
      ProgramChange,
      ChannelPressure,
      PitchBendChange,
      SystemExclusive,
      MidiTimeCode,
      SongPositionPointer,
      SongSelect,
      TuneRequest,
      EndSystemExclusive,
      TimingClock,
      Start,
      Continue,
      Stop,
      ActiveSensing,
      SystemReset
   );
   for MidiMessageType use (
      None => 0,
      NoteOff => 128,
      NoteOn => 144,
      PolyphonicKeyPressure => 160,
      ControlChange => 176,
      ProgramChange => 192,
      ChannelPressure => 208,
      PitchBendChange => 224,
      SystemExclusive => 240,
      MidiTimeCode => 241,
      SongPositionPointer => 242,
      SongSelect => 243,
      TuneRequest => 246,
      EndSystemExclusive => 247,
      TimingClock => 248,
      Start => 250,
      Continue => 251,
      Stop => 252,
      ActiveSensing => 254,
      SystemReset => 255
   );
   for MidiMessageType'Size use 32;
   
   type MidiMessageType_Ptr is access MidiMessageType;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMidiInPort_Interface;
   type AsyncOperationCompletedHandler_IMidiInPort is access all AsyncOperationCompletedHandler_IMidiInPort_Interface'Class;
   type AsyncOperationCompletedHandler_IMidiInPort_Ptr is access all AsyncOperationCompletedHandler_IMidiInPort;
   type AsyncOperationCompletedHandler_IMidiOutPort_Interface;
   type AsyncOperationCompletedHandler_IMidiOutPort is access all AsyncOperationCompletedHandler_IMidiOutPort_Interface'Class;
   type AsyncOperationCompletedHandler_IMidiOutPort_Ptr is access all AsyncOperationCompletedHandler_IMidiOutPort;
   type TypedEventHandler_IMidiInPort_add_MessageReceived_Interface;
   type TypedEventHandler_IMidiInPort_add_MessageReceived is access all TypedEventHandler_IMidiInPort_add_MessageReceived_Interface'Class;
   type TypedEventHandler_IMidiInPort_add_MessageReceived_Ptr is access all TypedEventHandler_IMidiInPort_add_MessageReceived;
   type AsyncOperationCompletedHandler_IMidiSynthesizer_Interface;
   type AsyncOperationCompletedHandler_IMidiSynthesizer is access all AsyncOperationCompletedHandler_IMidiSynthesizer_Interface'Class;
   type AsyncOperationCompletedHandler_IMidiSynthesizer_Ptr is access all AsyncOperationCompletedHandler_IMidiSynthesizer;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMidiMessage_Interface;
   type IMidiMessage is access all IMidiMessage_Interface'Class;
   type IMidiMessage_Ptr is access all IMidiMessage;
   type IMidiNoteOffMessage_Interface;
   type IMidiNoteOffMessage is access all IMidiNoteOffMessage_Interface'Class;
   type IMidiNoteOffMessage_Ptr is access all IMidiNoteOffMessage;
   type IMidiNoteOnMessage_Interface;
   type IMidiNoteOnMessage is access all IMidiNoteOnMessage_Interface'Class;
   type IMidiNoteOnMessage_Ptr is access all IMidiNoteOnMessage;
   type IMidiPolyphonicKeyPressureMessage_Interface;
   type IMidiPolyphonicKeyPressureMessage is access all IMidiPolyphonicKeyPressureMessage_Interface'Class;
   type IMidiPolyphonicKeyPressureMessage_Ptr is access all IMidiPolyphonicKeyPressureMessage;
   type IMidiControlChangeMessage_Interface;
   type IMidiControlChangeMessage is access all IMidiControlChangeMessage_Interface'Class;
   type IMidiControlChangeMessage_Ptr is access all IMidiControlChangeMessage;
   type IMidiProgramChangeMessage_Interface;
   type IMidiProgramChangeMessage is access all IMidiProgramChangeMessage_Interface'Class;
   type IMidiProgramChangeMessage_Ptr is access all IMidiProgramChangeMessage;
   type IMidiChannelPressureMessage_Interface;
   type IMidiChannelPressureMessage is access all IMidiChannelPressureMessage_Interface'Class;
   type IMidiChannelPressureMessage_Ptr is access all IMidiChannelPressureMessage;
   type IMidiPitchBendChangeMessage_Interface;
   type IMidiPitchBendChangeMessage is access all IMidiPitchBendChangeMessage_Interface'Class;
   type IMidiPitchBendChangeMessage_Ptr is access all IMidiPitchBendChangeMessage;
   type IMidiTimeCodeMessage_Interface;
   type IMidiTimeCodeMessage is access all IMidiTimeCodeMessage_Interface'Class;
   type IMidiTimeCodeMessage_Ptr is access all IMidiTimeCodeMessage;
   type IMidiSongPositionPointerMessage_Interface;
   type IMidiSongPositionPointerMessage is access all IMidiSongPositionPointerMessage_Interface'Class;
   type IMidiSongPositionPointerMessage_Ptr is access all IMidiSongPositionPointerMessage;
   type IMidiSongSelectMessage_Interface;
   type IMidiSongSelectMessage is access all IMidiSongSelectMessage_Interface'Class;
   type IMidiSongSelectMessage_Ptr is access all IMidiSongSelectMessage;
   type IMidiNoteOffMessageFactory_Interface;
   type IMidiNoteOffMessageFactory is access all IMidiNoteOffMessageFactory_Interface'Class;
   type IMidiNoteOffMessageFactory_Ptr is access all IMidiNoteOffMessageFactory;
   type IMidiNoteOnMessageFactory_Interface;
   type IMidiNoteOnMessageFactory is access all IMidiNoteOnMessageFactory_Interface'Class;
   type IMidiNoteOnMessageFactory_Ptr is access all IMidiNoteOnMessageFactory;
   type IMidiPolyphonicKeyPressureMessageFactory_Interface;
   type IMidiPolyphonicKeyPressureMessageFactory is access all IMidiPolyphonicKeyPressureMessageFactory_Interface'Class;
   type IMidiPolyphonicKeyPressureMessageFactory_Ptr is access all IMidiPolyphonicKeyPressureMessageFactory;
   type IMidiControlChangeMessageFactory_Interface;
   type IMidiControlChangeMessageFactory is access all IMidiControlChangeMessageFactory_Interface'Class;
   type IMidiControlChangeMessageFactory_Ptr is access all IMidiControlChangeMessageFactory;
   type IMidiProgramChangeMessageFactory_Interface;
   type IMidiProgramChangeMessageFactory is access all IMidiProgramChangeMessageFactory_Interface'Class;
   type IMidiProgramChangeMessageFactory_Ptr is access all IMidiProgramChangeMessageFactory;
   type IMidiChannelPressureMessageFactory_Interface;
   type IMidiChannelPressureMessageFactory is access all IMidiChannelPressureMessageFactory_Interface'Class;
   type IMidiChannelPressureMessageFactory_Ptr is access all IMidiChannelPressureMessageFactory;
   type IMidiPitchBendChangeMessageFactory_Interface;
   type IMidiPitchBendChangeMessageFactory is access all IMidiPitchBendChangeMessageFactory_Interface'Class;
   type IMidiPitchBendChangeMessageFactory_Ptr is access all IMidiPitchBendChangeMessageFactory;
   type IMidiSystemExclusiveMessageFactory_Interface;
   type IMidiSystemExclusiveMessageFactory is access all IMidiSystemExclusiveMessageFactory_Interface'Class;
   type IMidiSystemExclusiveMessageFactory_Ptr is access all IMidiSystemExclusiveMessageFactory;
   type IMidiTimeCodeMessageFactory_Interface;
   type IMidiTimeCodeMessageFactory is access all IMidiTimeCodeMessageFactory_Interface'Class;
   type IMidiTimeCodeMessageFactory_Ptr is access all IMidiTimeCodeMessageFactory;
   type IMidiSongPositionPointerMessageFactory_Interface;
   type IMidiSongPositionPointerMessageFactory is access all IMidiSongPositionPointerMessageFactory_Interface'Class;
   type IMidiSongPositionPointerMessageFactory_Ptr is access all IMidiSongPositionPointerMessageFactory;
   type IMidiSongSelectMessageFactory_Interface;
   type IMidiSongSelectMessageFactory is access all IMidiSongSelectMessageFactory_Interface'Class;
   type IMidiSongSelectMessageFactory_Ptr is access all IMidiSongSelectMessageFactory;
   type IMidiMessageReceivedEventArgs_Interface;
   type IMidiMessageReceivedEventArgs is access all IMidiMessageReceivedEventArgs_Interface'Class;
   type IMidiMessageReceivedEventArgs_Ptr is access all IMidiMessageReceivedEventArgs;
   type IMidiInPortStatics_Interface;
   type IMidiInPortStatics is access all IMidiInPortStatics_Interface'Class;
   type IMidiInPortStatics_Ptr is access all IMidiInPortStatics;
   type IMidiOutPortStatics_Interface;
   type IMidiOutPortStatics is access all IMidiOutPortStatics_Interface'Class;
   type IMidiOutPortStatics_Ptr is access all IMidiOutPortStatics;
   type IMidiOutPort_Interface;
   type IMidiOutPort is access all IMidiOutPort_Interface'Class;
   type IMidiOutPort_Ptr is access all IMidiOutPort;
   type IMidiInPort_Interface;
   type IMidiInPort is access all IMidiInPort_Interface'Class;
   type IMidiInPort_Ptr is access all IMidiInPort;
   type IMidiSynthesizerStatics_Interface;
   type IMidiSynthesizerStatics is access all IMidiSynthesizerStatics_Interface'Class;
   type IMidiSynthesizerStatics_Ptr is access all IMidiSynthesizerStatics;
   type IMidiSynthesizer_Interface;
   type IMidiSynthesizer is access all IMidiSynthesizer_Interface'Class;
   type IMidiSynthesizer_Ptr is access all IMidiSynthesizer;
   type IAsyncOperation_IMidiInPort_Interface;
   type IAsyncOperation_IMidiInPort is access all IAsyncOperation_IMidiInPort_Interface'Class;
   type IAsyncOperation_IMidiInPort_Ptr is access all IAsyncOperation_IMidiInPort;
   type IAsyncOperation_IMidiOutPort_Interface;
   type IAsyncOperation_IMidiOutPort is access all IAsyncOperation_IMidiOutPort_Interface'Class;
   type IAsyncOperation_IMidiOutPort_Ptr is access all IAsyncOperation_IMidiOutPort;
   type IAsyncOperation_IMidiSynthesizer_Interface;
   type IAsyncOperation_IMidiSynthesizer is access all IAsyncOperation_IMidiSynthesizer_Interface'Class;
   type IAsyncOperation_IMidiSynthesizer_Ptr is access all IAsyncOperation_IMidiSynthesizer;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMidiMessage : aliased constant Windows.IID := (2037807429, 4244, 17027, (155, 224, 40, 159, 192, 238, 131, 52 ));
   
   type IMidiMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IMidiMessage_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_RawData
   (
      This       : access IMidiMessage_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IMidiMessage_Interface
      ; RetVal : access Windows.Devices.Midi.MidiMessageType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiNoteOffMessage : aliased constant Windows.IID := (385714932, 6542, 19855, (166, 84, 211, 5, 162, 147, 84, 143 ));
   
   type IMidiNoteOffMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Channel
   (
      This       : access IMidiNoteOffMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Note
   (
      This       : access IMidiNoteOffMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocity
   (
      This       : access IMidiNoteOffMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiNoteOnMessage : aliased constant Windows.IID := (3760343797, 24961, 18141, (175, 162, 65, 0, 4, 192, 87, 170 ));
   
   type IMidiNoteOnMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Channel
   (
      This       : access IMidiNoteOnMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Note
   (
      This       : access IMidiNoteOnMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Velocity
   (
      This       : access IMidiNoteOnMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiPolyphonicKeyPressureMessage : aliased constant Windows.IID := (527644670, 44264, 18592, (134, 142, 124, 219, 242, 15, 4, 214 ));
   
   type IMidiPolyphonicKeyPressureMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Channel
   (
      This       : access IMidiPolyphonicKeyPressureMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Note
   (
      This       : access IMidiPolyphonicKeyPressureMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Pressure
   (
      This       : access IMidiPolyphonicKeyPressureMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiControlChangeMessage : aliased constant Windows.IID := (3085000579, 30733, 16479, (183, 129, 62, 21, 152, 201, 127, 64 ));
   
   type IMidiControlChangeMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Channel
   (
      This       : access IMidiControlChangeMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Controller
   (
      This       : access IMidiControlChangeMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlValue
   (
      This       : access IMidiControlChangeMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiProgramChangeMessage : aliased constant Windows.IID := (2629516408, 31294, 17191, (170, 152, 32, 184, 228, 72, 90, 248 ));
   
   type IMidiProgramChangeMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Channel
   (
      This       : access IMidiProgramChangeMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Program
   (
      This       : access IMidiProgramChangeMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiChannelPressureMessage : aliased constant Windows.IID := (3189745760, 25268, 19794, (163, 126, 146, 229, 77, 53, 185, 9 ));
   
   type IMidiChannelPressureMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Channel
   (
      This       : access IMidiChannelPressureMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Pressure
   (
      This       : access IMidiChannelPressureMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiPitchBendChangeMessage : aliased constant Windows.IID := (702500017, 11935, 20399, (140, 43, 156, 184, 42, 144, 121, 202 ));
   
   type IMidiPitchBendChangeMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Channel
   (
      This       : access IMidiPitchBendChangeMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Bend
   (
      This       : access IMidiPitchBendChangeMessage_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiTimeCodeMessage : aliased constant Windows.IID := (200738941, 64099, 18972, (141, 235, 192, 232, 119, 150, 166, 215 ));
   
   type IMidiTimeCodeMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameType
   (
      This       : access IMidiTimeCodeMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Values
   (
      This       : access IMidiTimeCodeMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiSongPositionPointerMessage : aliased constant Windows.IID := (1285885014, 60510, 19172, (161, 21, 136, 220, 87, 204, 43, 121 ));
   
   type IMidiSongPositionPointerMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Beats
   (
      This       : access IMidiSongPositionPointerMessage_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiSongSelectMessage : aliased constant Windows.IID := (1240527487, 28035, 18241, (165, 191, 70, 41, 246, 190, 151, 79 ));
   
   type IMidiSongSelectMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Song
   (
      This       : access IMidiSongSelectMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiNoteOffMessageFactory : aliased constant Windows.IID := (2796699872, 42825, 16991, (138, 244, 164, 217, 121, 204, 21, 181 ));
   
   type IMidiNoteOffMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiNoteOffMessage
   (
      This       : access IMidiNoteOffMessageFactory_Interface
      ; channel : Windows.UInt8
      ; note : Windows.UInt8
      ; velocity : Windows.UInt8
      ; RetVal : access Windows.Devices.Midi.IMidiNoteOffMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiNoteOnMessageFactory : aliased constant Windows.IID := (2604826784, 22977, 16910, (181, 23, 21, 161, 10, 169, 96, 107 ));
   
   type IMidiNoteOnMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiNoteOnMessage
   (
      This       : access IMidiNoteOnMessageFactory_Interface
      ; channel : Windows.UInt8
      ; note : Windows.UInt8
      ; velocity : Windows.UInt8
      ; RetVal : access Windows.Devices.Midi.IMidiNoteOnMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiPolyphonicKeyPressureMessageFactory : aliased constant Windows.IID := (3918481470, 50355, 19922, (145, 124, 227, 73, 129, 90, 27, 59 ));
   
   type IMidiPolyphonicKeyPressureMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiPolyphonicKeyPressureMessage
   (
      This       : access IMidiPolyphonicKeyPressureMessageFactory_Interface
      ; channel : Windows.UInt8
      ; note : Windows.UInt8
      ; pressure : Windows.UInt8
      ; RetVal : access Windows.Devices.Midi.IMidiPolyphonicKeyPressureMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiControlChangeMessageFactory : aliased constant Windows.IID := (716260129, 38252, 18093, (151, 82, 248, 127, 85, 5, 47, 227 ));
   
   type IMidiControlChangeMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiControlChangeMessage
   (
      This       : access IMidiControlChangeMessageFactory_Interface
      ; channel : Windows.UInt8
      ; controller : Windows.UInt8
      ; controlValue : Windows.UInt8
      ; RetVal : access Windows.Devices.Midi.IMidiControlChangeMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiProgramChangeMessageFactory : aliased constant Windows.IID := (3601875847, 21067, 16644, (156, 153, 101, 114, 191, 210, 226, 97 ));
   
   type IMidiProgramChangeMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiProgramChangeMessage
   (
      This       : access IMidiProgramChangeMessageFactory_Interface
      ; channel : Windows.UInt8
      ; program : Windows.UInt8
      ; RetVal : access Windows.Devices.Midi.IMidiProgramChangeMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiChannelPressureMessageFactory : aliased constant Windows.IID := (1645800751, 8836, 16682, (148, 207, 16, 251, 4, 132, 44, 108 ));
   
   type IMidiChannelPressureMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiChannelPressureMessage
   (
      This       : access IMidiChannelPressureMessageFactory_Interface
      ; channel : Windows.UInt8
      ; pressure : Windows.UInt8
      ; RetVal : access Windows.Devices.Midi.IMidiChannelPressureMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiPitchBendChangeMessageFactory : aliased constant Windows.IID := (4126072661, 53192, 18726, (179, 14, 163, 98, 35, 147, 48, 108 ));
   
   type IMidiPitchBendChangeMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiPitchBendChangeMessage
   (
      This       : access IMidiPitchBendChangeMessageFactory_Interface
      ; channel : Windows.UInt8
      ; bend : Windows.UInt16
      ; RetVal : access Windows.Devices.Midi.IMidiPitchBendChangeMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiSystemExclusiveMessageFactory : aliased constant Windows.IID := (138273314, 15220, 17184, (155, 66, 12, 168, 84, 95, 138, 36 ));
   
   type IMidiSystemExclusiveMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiSystemExclusiveMessage
   (
      This       : access IMidiSystemExclusiveMessageFactory_Interface
      ; rawData : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Midi.IMidiMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiTimeCodeMessageFactory : aliased constant Windows.IID := (3945830853, 30492, 16606, (185, 97, 23, 90, 116, 137, 168, 94 ));
   
   type IMidiTimeCodeMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiTimeCodeMessage
   (
      This       : access IMidiTimeCodeMessageFactory_Interface
      ; frameType : Windows.UInt8
      ; values : Windows.UInt8
      ; RetVal : access Windows.Devices.Midi.IMidiTimeCodeMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiSongPositionPointerMessageFactory : aliased constant Windows.IID := (2617305494, 61707, 20458, (179, 149, 245, 214, 207, 128, 246, 78 ));
   
   type IMidiSongPositionPointerMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiSongPositionPointerMessage
   (
      This       : access IMidiSongPositionPointerMessageFactory_Interface
      ; beats : Windows.UInt16
      ; RetVal : access Windows.Devices.Midi.IMidiSongPositionPointerMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiSongSelectMessageFactory : aliased constant Windows.IID := (2223536356, 34632, 16681, (166, 108, 160, 84, 147, 247, 93, 170 ));
   
   type IMidiSongSelectMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMidiSongSelectMessage
   (
      This       : access IMidiSongSelectMessageFactory_Interface
      ; song : Windows.UInt8
      ; RetVal : access Windows.Devices.Midi.IMidiSongSelectMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiMessageReceivedEventArgs : aliased constant Windows.IID := (1985375830, 62248, 19281, (144, 125, 179, 168, 206, 150, 191, 128 ));
   
   type IMidiMessageReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Message
   (
      This       : access IMidiMessageReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Midi.IMidiMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiInPortStatics : aliased constant Windows.IID := (1153710556, 26623, 19054, (139, 172, 253, 182, 97, 12, 242, 150 ));
   
   type IMidiInPortStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IMidiInPortStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Midi.IAsyncOperation_IMidiInPort -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IMidiInPortStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiOutPortStatics : aliased constant Windows.IID := (106742761, 3976, 17547, (155, 100, 169, 88, 38, 198, 91, 143 ));
   
   type IMidiOutPortStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IMidiOutPortStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Midi.IAsyncOperation_IMidiOutPort -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IMidiOutPortStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiOutPort : aliased constant Windows.IID := (2468179359, 22434, 19002, (173, 184, 70, 64, 136, 111, 102, 147 ));
   
   type IMidiOutPort_Interface is interface and Windows.IInspectable_Interface;
   
   function SendMessage
   (
      This       : access IMidiOutPort_Interface
      ; midiMessage : Windows.Devices.Midi.IMidiMessage
   )
   return Windows.HRESULT is abstract;
   
   function SendBuffer
   (
      This       : access IMidiOutPort_Interface
      ; midiData : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IMidiOutPort_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiInPort : aliased constant Windows.IID := (3586251227, 38682, 20143, (162, 61, 234, 25, 254, 96, 127, 249 ));
   
   type IMidiInPort_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MessageReceived
   (
      This       : access IMidiInPort_Interface
      ; handler : TypedEventHandler_IMidiInPort_add_MessageReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageReceived
   (
      This       : access IMidiInPort_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IMidiInPort_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiSynthesizerStatics : aliased constant Windows.IID := (1109715624, 26153, 19819, (170, 143, 212, 82, 26, 90, 49, 206 ));
   
   type IMidiSynthesizerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAsync
   (
      This       : access IMidiSynthesizerStatics_Interface
      ; RetVal : access Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromAudioDeviceAsync
   (
      This       : access IMidiSynthesizerStatics_Interface
      ; audioDevice : Windows.Devices.Enumeration.IDeviceInformation
      ; RetVal : access Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsSynthesizer
   (
      This       : access IMidiSynthesizerStatics_Interface
      ; midiDevice : Windows.Devices.Enumeration.IDeviceInformation
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMidiSynthesizer : aliased constant Windows.IID := (4040824158, 56208, 16479, (184, 174, 33, 210, 225, 127, 46, 69 ));
   
   type IMidiSynthesizer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AudioDevice
   (
      This       : access IMidiSynthesizer_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Volume
   (
      This       : access IMidiSynthesizer_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Volume
   (
      This       : access IMidiSynthesizer_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMidiInPort : aliased constant Windows.IID := (3429256974, 60849, 21960, (158, 247, 236, 144, 7, 228, 86, 28 ));
   
   type IAsyncOperation_IMidiInPort_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMidiInPort_Interface
      ; handler : Windows.Devices.Midi.AsyncOperationCompletedHandler_IMidiInPort
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMidiInPort_Interface
      ; RetVal : access Windows.Devices.Midi.AsyncOperationCompletedHandler_IMidiInPort
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMidiInPort_Interface
      ; RetVal : access Windows.Devices.Midi.IMidiInPort
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMidiOutPort : aliased constant Windows.IID := (845781581, 7360, 23068, (157, 166, 135, 81, 151, 135, 80, 134 ));
   
   type IAsyncOperation_IMidiOutPort_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMidiOutPort_Interface
      ; handler : Windows.Devices.Midi.AsyncOperationCompletedHandler_IMidiOutPort
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMidiOutPort_Interface
      ; RetVal : access Windows.Devices.Midi.AsyncOperationCompletedHandler_IMidiOutPort
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMidiOutPort_Interface
      ; RetVal : access Windows.Devices.Midi.IMidiOutPort
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMidiSynthesizer : aliased constant Windows.IID := (2475211128, 5105, 24119, (129, 51, 148, 67, 13, 144, 221, 80 ));
   
   type IAsyncOperation_IMidiSynthesizer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMidiSynthesizer_Interface
      ; handler : Windows.Devices.Midi.AsyncOperationCompletedHandler_IMidiSynthesizer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMidiSynthesizer_Interface
      ; RetVal : access Windows.Devices.Midi.AsyncOperationCompletedHandler_IMidiSynthesizer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMidiSynthesizer_Interface
      ; RetVal : access Windows.Devices.Midi.IMidiSynthesizer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMidiInPort : aliased constant Windows.IID := (1812533170, 32921, 21903, (138, 146, 154, 142, 168, 6, 230, 251 ));
   
   type AsyncOperationCompletedHandler_IMidiInPort_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiInPort ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMidiInPort'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMidiInPort_Interface
      ; asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiInPort
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMidiOutPort : aliased constant Windows.IID := (4006836229, 10825, 22964, (180, 212, 17, 136, 198, 129, 145, 34 ));
   
   type AsyncOperationCompletedHandler_IMidiOutPort_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiOutPort ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMidiOutPort'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMidiOutPort_Interface
      ; asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiOutPort
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMidiInPort_add_MessageReceived : aliased constant Windows.IID := (1342272064, 52281, 22389, (138, 107, 246, 242, 35, 134, 191, 202 ));
   
   type TypedEventHandler_IMidiInPort_add_MessageReceived_Interface(Callback : access procedure (sender : Windows.Devices.Midi.IMidiInPort ; args : Windows.Devices.Midi.IMidiMessageReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMidiInPort_add_MessageReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMidiInPort_add_MessageReceived_Interface
      ; sender : Windows.Devices.Midi.IMidiInPort
      ; args : Windows.Devices.Midi.IMidiMessageReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMidiSynthesizer : aliased constant Windows.IID := (1567712053, 53383, 20847, (173, 10, 99, 246, 28, 188, 243, 66 ));
   
   type AsyncOperationCompletedHandler_IMidiSynthesizer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMidiSynthesizer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMidiSynthesizer_Interface
      ; asyncInfo : Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MidiNoteOffMessage is Windows.Devices.Midi.IMidiNoteOffMessage;
   function CreateMidiNoteOffMessage
   (
      channel : Windows.UInt8
      ; note : Windows.UInt8
      ; velocity : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiNoteOffMessage;
   
   
   subtype MidiNoteOnMessage is Windows.Devices.Midi.IMidiNoteOnMessage;
   function CreateMidiNoteOnMessage
   (
      channel : Windows.UInt8
      ; note : Windows.UInt8
      ; velocity : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiNoteOnMessage;
   
   
   subtype MidiPolyphonicKeyPressureMessage is Windows.Devices.Midi.IMidiPolyphonicKeyPressureMessage;
   function CreateMidiPolyphonicKeyPressureMessage
   (
      channel : Windows.UInt8
      ; note : Windows.UInt8
      ; pressure : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiPolyphonicKeyPressureMessage;
   
   
   subtype MidiControlChangeMessage is Windows.Devices.Midi.IMidiControlChangeMessage;
   function CreateMidiControlChangeMessage
   (
      channel : Windows.UInt8
      ; controller : Windows.UInt8
      ; controlValue : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiControlChangeMessage;
   
   
   subtype MidiProgramChangeMessage is Windows.Devices.Midi.IMidiProgramChangeMessage;
   function CreateMidiProgramChangeMessage
   (
      channel : Windows.UInt8
      ; program : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiProgramChangeMessage;
   
   
   subtype MidiChannelPressureMessage is Windows.Devices.Midi.IMidiChannelPressureMessage;
   function CreateMidiChannelPressureMessage
   (
      channel : Windows.UInt8
      ; pressure : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiChannelPressureMessage;
   
   
   subtype MidiPitchBendChangeMessage is Windows.Devices.Midi.IMidiPitchBendChangeMessage;
   function CreateMidiPitchBendChangeMessage
   (
      channel : Windows.UInt8
      ; bend : Windows.UInt16
   )
   return Windows.Devices.Midi.IMidiPitchBendChangeMessage;
   
   
   subtype MidiSystemExclusiveMessage is Windows.Devices.Midi.IMidiMessage;
   function CreateMidiSystemExclusiveMessage
   (
      rawData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.Midi.IMidiMessage;
   
   
   subtype MidiTimeCodeMessage is Windows.Devices.Midi.IMidiTimeCodeMessage;
   function CreateMidiTimeCodeMessage
   (
      frameType : Windows.UInt8
      ; values : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiTimeCodeMessage;
   
   
   subtype MidiSongPositionPointerMessage is Windows.Devices.Midi.IMidiSongPositionPointerMessage;
   function CreateMidiSongPositionPointerMessage
   (
      beats : Windows.UInt16
   )
   return Windows.Devices.Midi.IMidiSongPositionPointerMessage;
   
   
   subtype MidiSongSelectMessage is Windows.Devices.Midi.IMidiSongSelectMessage;
   function CreateMidiSongSelectMessage
   (
      song : Windows.UInt8
   )
   return Windows.Devices.Midi.IMidiSongSelectMessage;
   
   
   subtype MidiTuneRequestMessage is Windows.Devices.Midi.IMidiMessage;
   
   function CreateMidiTuneRequestMessage return Windows.Devices.Midi.IMidiMessage;
   
   subtype MidiTimingClockMessage is Windows.Devices.Midi.IMidiMessage;
   
   function CreateMidiTimingClockMessage return Windows.Devices.Midi.IMidiMessage;
   
   subtype MidiStartMessage is Windows.Devices.Midi.IMidiMessage;
   
   function CreateMidiStartMessage return Windows.Devices.Midi.IMidiMessage;
   
   subtype MidiContinueMessage is Windows.Devices.Midi.IMidiMessage;
   
   function CreateMidiContinueMessage return Windows.Devices.Midi.IMidiMessage;
   
   subtype MidiStopMessage is Windows.Devices.Midi.IMidiMessage;
   
   function CreateMidiStopMessage return Windows.Devices.Midi.IMidiMessage;
   
   subtype MidiActiveSensingMessage is Windows.Devices.Midi.IMidiMessage;
   
   function CreateMidiActiveSensingMessage return Windows.Devices.Midi.IMidiMessage;
   
   subtype MidiSystemResetMessage is Windows.Devices.Midi.IMidiMessage;
   
   function CreateMidiSystemResetMessage return Windows.Devices.Midi.IMidiMessage;
   
   subtype MidiMessageReceivedEventArgs is Windows.Devices.Midi.IMidiMessageReceivedEventArgs;
   subtype MidiInPort is Windows.Devices.Midi.IMidiInPort;
   subtype MidiOutPort is Windows.Devices.Midi.IMidiOutPort;
   subtype MidiSynthesizer is Windows.Devices.Midi.IMidiSynthesizer;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Midi.IAsyncOperation_IMidiInPort;
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Midi.IAsyncOperation_IMidiOutPort;
   
   function GetDeviceSelector_IMidiOutPort
   return Windows.String;
   
   function CreateAsync
   return Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer;
   
   function CreateFromAudioDeviceAsync
   (
      audioDevice : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Devices.Midi.IAsyncOperation_IMidiSynthesizer;
   
   function IsSynthesizer
   (
      midiDevice : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Boolean;
   
end;
