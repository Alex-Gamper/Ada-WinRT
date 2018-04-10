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
limited with Windows.Media.MediaProperties;
with Windows.Foundation;
limited with Windows.Media.Capture;
limited with Windows.Devices.Enumeration;
limited with Windows.Storage;
limited with Windows.Media.Render;
with Windows.Foundation.Collections;
limited with Windows.Media.Effects;
limited with Windows.Media.Transcoding;
with Windows.Foundation.Numerics;
--------------------------------------------------------------------------------
package Windows.Media.Audio is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AudioGraphCreationStatus is (
      Success,
      DeviceNotAvailable,
      FormatNotSupported,
      UnknownFailure
   );
   for AudioGraphCreationStatus use (
      Success => 0,
      DeviceNotAvailable => 1,
      FormatNotSupported => 2,
      UnknownFailure => 3
   );
   for AudioGraphCreationStatus'Size use 32;
   
   type AudioGraphCreationStatus_Ptr is access AudioGraphCreationStatus;
   
   type QuantumSizeSelectionMode is (
      SystemDefault,
      LowestLatency,
      ClosestToDesired
   );
   for QuantumSizeSelectionMode use (
      SystemDefault => 0,
      LowestLatency => 1,
      ClosestToDesired => 2
   );
   for QuantumSizeSelectionMode'Size use 32;
   
   type QuantumSizeSelectionMode_Ptr is access QuantumSizeSelectionMode;
   
   type AudioDeviceNodeCreationStatus is (
      Success,
      DeviceNotAvailable,
      FormatNotSupported,
      UnknownFailure,
      AccessDenied
   );
   for AudioDeviceNodeCreationStatus use (
      Success => 0,
      DeviceNotAvailable => 1,
      FormatNotSupported => 2,
      UnknownFailure => 3,
      AccessDenied => 4
   );
   for AudioDeviceNodeCreationStatus'Size use 32;
   
   type AudioDeviceNodeCreationStatus_Ptr is access AudioDeviceNodeCreationStatus;
   
   type AudioFileNodeCreationStatus is (
      Success,
      FileNotFound,
      InvalidFileType,
      FormatNotSupported,
      UnknownFailure
   );
   for AudioFileNodeCreationStatus use (
      Success => 0,
      FileNotFound => 1,
      InvalidFileType => 2,
      FormatNotSupported => 3,
      UnknownFailure => 4
   );
   for AudioFileNodeCreationStatus'Size use 32;
   
   type AudioFileNodeCreationStatus_Ptr is access AudioFileNodeCreationStatus;
   
   type AudioGraphUnrecoverableError is (
      None,
      AudioDeviceLost,
      AudioSessionDisconnected,
      UnknownFailure
   );
   for AudioGraphUnrecoverableError use (
      None => 0,
      AudioDeviceLost => 1,
      AudioSessionDisconnected => 2,
      UnknownFailure => 3
   );
   for AudioGraphUnrecoverableError'Size use 32;
   
   type AudioGraphUnrecoverableError_Ptr is access AudioGraphUnrecoverableError;
   
   type AudioNodeEmitterSettings is (
      None,
      DisableDoppler
   );
   for AudioNodeEmitterSettings use (
      None => 0,
      DisableDoppler => 1
   );
   for AudioNodeEmitterSettings'Size use 32;
   
   type AudioNodeEmitterSettings_Ptr is access AudioNodeEmitterSettings;
   
   type AudioNodeEmitterShapeKind is (
      Omnidirectional,
      Cone
   );
   for AudioNodeEmitterShapeKind use (
      Omnidirectional => 0,
      Cone => 1
   );
   for AudioNodeEmitterShapeKind'Size use 32;
   
   type AudioNodeEmitterShapeKind_Ptr is access AudioNodeEmitterShapeKind;
   
   type AudioNodeEmitterDecayKind is (
      Natural,
      Custom
   );
   for AudioNodeEmitterDecayKind use (
      Natural => 0,
      Custom => 1
   );
   for AudioNodeEmitterDecayKind'Size use 32;
   
   type AudioNodeEmitterDecayKind_Ptr is access AudioNodeEmitterDecayKind;
   
   type SpatialAudioModel is (
      ObjectBased,
      FoldDown
   );
   for SpatialAudioModel use (
      ObjectBased => 0,
      FoldDown => 1
   );
   for SpatialAudioModel'Size use 32;
   
   type SpatialAudioModel_Ptr is access SpatialAudioModel;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ICreateAudioGraphResult_Interface;
   type AsyncOperationCompletedHandler_ICreateAudioGraphResult is access all AsyncOperationCompletedHandler_ICreateAudioGraphResult_Interface'Class;
   type AsyncOperationCompletedHandler_ICreateAudioGraphResult_Ptr is access all AsyncOperationCompletedHandler_ICreateAudioGraphResult;
   type AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult_Interface;
   type AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult is access all AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult_Interface'Class;
   type AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult_Ptr is access all AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult;
   type AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult_Interface;
   type AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult is access all AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult_Interface'Class;
   type AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult_Ptr is access all AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult;
   type AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult_Interface;
   type AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult is access all AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult_Interface'Class;
   type AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult_Ptr is access all AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult;
   type AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult_Interface;
   type AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult is access all AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult_Interface'Class;
   type AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult_Ptr is access all AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult;
   type TypedEventHandler_IAudioGraph_add_QuantumStarted_Interface;
   type TypedEventHandler_IAudioGraph_add_QuantumStarted is access all TypedEventHandler_IAudioGraph_add_QuantumStarted_Interface'Class;
   type TypedEventHandler_IAudioGraph_add_QuantumStarted_Ptr is access all TypedEventHandler_IAudioGraph_add_QuantumStarted;
   type TypedEventHandler_IAudioGraph_add_QuantumProcessed_Interface;
   type TypedEventHandler_IAudioGraph_add_QuantumProcessed is access all TypedEventHandler_IAudioGraph_add_QuantumProcessed_Interface'Class;
   type TypedEventHandler_IAudioGraph_add_QuantumProcessed_Ptr is access all TypedEventHandler_IAudioGraph_add_QuantumProcessed;
   type TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred_Interface;
   type TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred is access all TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred_Interface'Class;
   type TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred_Ptr is access all TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred;
   type TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted_Interface;
   type TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted is access all TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted_Interface'Class;
   type TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted_Ptr is access all TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted;
   type TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted_Interface;
   type TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted is access all TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted_Interface'Class;
   type TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted_Ptr is access all TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted;
   type TypedEventHandler_IAudioFileInputNode_add_FileCompleted_Interface;
   type TypedEventHandler_IAudioFileInputNode_add_FileCompleted is access all TypedEventHandler_IAudioFileInputNode_add_FileCompleted_Interface'Class;
   type TypedEventHandler_IAudioFileInputNode_add_FileCompleted_Ptr is access all TypedEventHandler_IAudioFileInputNode_add_FileCompleted;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICreateAudioGraphResult_Interface;
   type ICreateAudioGraphResult is access all ICreateAudioGraphResult_Interface'Class;
   type ICreateAudioGraphResult_Ptr is access all ICreateAudioGraphResult;
   type IAudioGraphSettingsFactory_Interface;
   type IAudioGraphSettingsFactory is access all IAudioGraphSettingsFactory_Interface'Class;
   type IAudioGraphSettingsFactory_Ptr is access all IAudioGraphSettingsFactory;
   type IAudioGraphSettings_Interface;
   type IAudioGraphSettings is access all IAudioGraphSettings_Interface'Class;
   type IAudioGraphSettings_Ptr is access all IAudioGraphSettings;
   type IAudioGraphStatics_Interface;
   type IAudioGraphStatics is access all IAudioGraphStatics_Interface'Class;
   type IAudioGraphStatics_Ptr is access all IAudioGraphStatics;
   type ICreateAudioDeviceInputNodeResult_Interface;
   type ICreateAudioDeviceInputNodeResult is access all ICreateAudioDeviceInputNodeResult_Interface'Class;
   type ICreateAudioDeviceInputNodeResult_Ptr is access all ICreateAudioDeviceInputNodeResult;
   type ICreateAudioDeviceOutputNodeResult_Interface;
   type ICreateAudioDeviceOutputNodeResult is access all ICreateAudioDeviceOutputNodeResult_Interface'Class;
   type ICreateAudioDeviceOutputNodeResult_Ptr is access all ICreateAudioDeviceOutputNodeResult;
   type ICreateAudioFileInputNodeResult_Interface;
   type ICreateAudioFileInputNodeResult is access all ICreateAudioFileInputNodeResult_Interface'Class;
   type ICreateAudioFileInputNodeResult_Ptr is access all ICreateAudioFileInputNodeResult;
   type ICreateAudioFileOutputNodeResult_Interface;
   type ICreateAudioFileOutputNodeResult is access all ICreateAudioFileOutputNodeResult_Interface'Class;
   type ICreateAudioFileOutputNodeResult_Ptr is access all ICreateAudioFileOutputNodeResult;
   type IAudioGraphUnrecoverableErrorOccurredEventArgs_Interface;
   type IAudioGraphUnrecoverableErrorOccurredEventArgs is access all IAudioGraphUnrecoverableErrorOccurredEventArgs_Interface'Class;
   type IAudioGraphUnrecoverableErrorOccurredEventArgs_Ptr is access all IAudioGraphUnrecoverableErrorOccurredEventArgs;
   type IAudioGraph_Interface;
   type IAudioGraph is access all IAudioGraph_Interface'Class;
   type IAudioGraph_Ptr is access all IAudioGraph;
   type IAudioGraph2_Interface;
   type IAudioGraph2 is access all IAudioGraph2_Interface'Class;
   type IAudioGraph2_Ptr is access all IAudioGraph2;
   type IAudioNode_Interface;
   type IAudioNode is access all IAudioNode_Interface'Class;
   type IAudioNode_Ptr is access all IAudioNode;
   type IAudioNodeWithListener_Interface;
   type IAudioNodeWithListener is access all IAudioNodeWithListener_Interface'Class;
   type IAudioNodeWithListener_Ptr is access all IAudioNodeWithListener;
   type IAudioInputNode_Interface;
   type IAudioInputNode is access all IAudioInputNode_Interface'Class;
   type IAudioInputNode_Ptr is access all IAudioInputNode;
   type IAudioInputNode2_Interface;
   type IAudioInputNode2 is access all IAudioInputNode2_Interface'Class;
   type IAudioInputNode2_Ptr is access all IAudioInputNode2;
   type IAudioFrameInputNode_Interface;
   type IAudioFrameInputNode is access all IAudioFrameInputNode_Interface'Class;
   type IAudioFrameInputNode_Ptr is access all IAudioFrameInputNode;
   type IAudioFileInputNode_Interface;
   type IAudioFileInputNode is access all IAudioFileInputNode_Interface'Class;
   type IAudioFileInputNode_Ptr is access all IAudioFileInputNode;
   type IAudioDeviceInputNode_Interface;
   type IAudioDeviceInputNode is access all IAudioDeviceInputNode_Interface'Class;
   type IAudioDeviceInputNode_Ptr is access all IAudioDeviceInputNode;
   type IAudioDeviceOutputNode_Interface;
   type IAudioDeviceOutputNode is access all IAudioDeviceOutputNode_Interface'Class;
   type IAudioDeviceOutputNode_Ptr is access all IAudioDeviceOutputNode;
   type IAudioFrameOutputNode_Interface;
   type IAudioFrameOutputNode is access all IAudioFrameOutputNode_Interface'Class;
   type IAudioFrameOutputNode_Ptr is access all IAudioFrameOutputNode;
   type IAudioFileOutputNode_Interface;
   type IAudioFileOutputNode is access all IAudioFileOutputNode_Interface'Class;
   type IAudioFileOutputNode_Ptr is access all IAudioFileOutputNode;
   type IAudioFrameCompletedEventArgs_Interface;
   type IAudioFrameCompletedEventArgs is access all IAudioFrameCompletedEventArgs_Interface'Class;
   type IAudioFrameCompletedEventArgs_Ptr is access all IAudioFrameCompletedEventArgs;
   type IFrameInputNodeQuantumStartedEventArgs_Interface;
   type IFrameInputNodeQuantumStartedEventArgs is access all IFrameInputNodeQuantumStartedEventArgs_Interface'Class;
   type IFrameInputNodeQuantumStartedEventArgs_Ptr is access all IFrameInputNodeQuantumStartedEventArgs;
   type IAudioGraphConnection_Interface;
   type IAudioGraphConnection is access all IAudioGraphConnection_Interface'Class;
   type IAudioGraphConnection_Ptr is access all IAudioGraphConnection;
   type IEqualizerBand_Interface;
   type IEqualizerBand is access all IEqualizerBand_Interface'Class;
   type IEqualizerBand_Ptr is access all IEqualizerBand;
   type IEqualizerEffectDefinitionFactory_Interface;
   type IEqualizerEffectDefinitionFactory is access all IEqualizerEffectDefinitionFactory_Interface'Class;
   type IEqualizerEffectDefinitionFactory_Ptr is access all IEqualizerEffectDefinitionFactory;
   type IReverbEffectDefinitionFactory_Interface;
   type IReverbEffectDefinitionFactory is access all IReverbEffectDefinitionFactory_Interface'Class;
   type IReverbEffectDefinitionFactory_Ptr is access all IReverbEffectDefinitionFactory;
   type IEchoEffectDefinitionFactory_Interface;
   type IEchoEffectDefinitionFactory is access all IEchoEffectDefinitionFactory_Interface'Class;
   type IEchoEffectDefinitionFactory_Ptr is access all IEchoEffectDefinitionFactory;
   type ILimiterEffectDefinitionFactory_Interface;
   type ILimiterEffectDefinitionFactory is access all ILimiterEffectDefinitionFactory_Interface'Class;
   type ILimiterEffectDefinitionFactory_Ptr is access all ILimiterEffectDefinitionFactory;
   type IAudioNodeEmitterConeProperties_Interface;
   type IAudioNodeEmitterConeProperties is access all IAudioNodeEmitterConeProperties_Interface'Class;
   type IAudioNodeEmitterConeProperties_Ptr is access all IAudioNodeEmitterConeProperties;
   type IAudioNodeEmitterShape_Interface;
   type IAudioNodeEmitterShape is access all IAudioNodeEmitterShape_Interface'Class;
   type IAudioNodeEmitterShape_Ptr is access all IAudioNodeEmitterShape;
   type IAudioNodeEmitterShapeStatics_Interface;
   type IAudioNodeEmitterShapeStatics is access all IAudioNodeEmitterShapeStatics_Interface'Class;
   type IAudioNodeEmitterShapeStatics_Ptr is access all IAudioNodeEmitterShapeStatics;
   type IAudioNodeEmitterNaturalDecayModelProperties_Interface;
   type IAudioNodeEmitterNaturalDecayModelProperties is access all IAudioNodeEmitterNaturalDecayModelProperties_Interface'Class;
   type IAudioNodeEmitterNaturalDecayModelProperties_Ptr is access all IAudioNodeEmitterNaturalDecayModelProperties;
   type IAudioNodeEmitterDecayModel_Interface;
   type IAudioNodeEmitterDecayModel is access all IAudioNodeEmitterDecayModel_Interface'Class;
   type IAudioNodeEmitterDecayModel_Ptr is access all IAudioNodeEmitterDecayModel;
   type IAudioNodeEmitterDecayModelStatics_Interface;
   type IAudioNodeEmitterDecayModelStatics is access all IAudioNodeEmitterDecayModelStatics_Interface'Class;
   type IAudioNodeEmitterDecayModelStatics_Ptr is access all IAudioNodeEmitterDecayModelStatics;
   type IAudioNodeEmitter_Interface;
   type IAudioNodeEmitter is access all IAudioNodeEmitter_Interface'Class;
   type IAudioNodeEmitter_Ptr is access all IAudioNodeEmitter;
   type IAudioNodeEmitter2_Interface;
   type IAudioNodeEmitter2 is access all IAudioNodeEmitter2_Interface'Class;
   type IAudioNodeEmitter2_Ptr is access all IAudioNodeEmitter2;
   type IAudioNodeEmitterFactory_Interface;
   type IAudioNodeEmitterFactory is access all IAudioNodeEmitterFactory_Interface'Class;
   type IAudioNodeEmitterFactory_Ptr is access all IAudioNodeEmitterFactory;
   type IAudioNodeListener_Interface;
   type IAudioNodeListener is access all IAudioNodeListener_Interface'Class;
   type IAudioNodeListener_Ptr is access all IAudioNodeListener;
   type IEqualizerEffectDefinition_Interface;
   type IEqualizerEffectDefinition is access all IEqualizerEffectDefinition_Interface'Class;
   type IEqualizerEffectDefinition_Ptr is access all IEqualizerEffectDefinition;
   type IReverbEffectDefinition_Interface;
   type IReverbEffectDefinition is access all IReverbEffectDefinition_Interface'Class;
   type IReverbEffectDefinition_Ptr is access all IReverbEffectDefinition;
   type IEchoEffectDefinition_Interface;
   type IEchoEffectDefinition is access all IEchoEffectDefinition_Interface'Class;
   type IEchoEffectDefinition_Ptr is access all IEchoEffectDefinition;
   type ILimiterEffectDefinition_Interface;
   type ILimiterEffectDefinition is access all ILimiterEffectDefinition_Interface'Class;
   type ILimiterEffectDefinition_Ptr is access all ILimiterEffectDefinition;
   type IAudioEffectDefinition_Imported_Interface;
   type IAudioEffectDefinition_Imported is access all IAudioEffectDefinition_Imported_Interface'Class;
   type IAudioEffectDefinition_Imported_Ptr is access all IAudioEffectDefinition_Imported;
   type IAsyncOperation_ICreateAudioGraphResult_Interface;
   type IAsyncOperation_ICreateAudioGraphResult is access all IAsyncOperation_ICreateAudioGraphResult_Interface'Class;
   type IAsyncOperation_ICreateAudioGraphResult_Ptr is access all IAsyncOperation_ICreateAudioGraphResult;
   type IAsyncOperation_ICreateAudioDeviceInputNodeResult_Interface;
   type IAsyncOperation_ICreateAudioDeviceInputNodeResult is access all IAsyncOperation_ICreateAudioDeviceInputNodeResult_Interface'Class;
   type IAsyncOperation_ICreateAudioDeviceInputNodeResult_Ptr is access all IAsyncOperation_ICreateAudioDeviceInputNodeResult;
   type IAsyncOperation_ICreateAudioDeviceOutputNodeResult_Interface;
   type IAsyncOperation_ICreateAudioDeviceOutputNodeResult is access all IAsyncOperation_ICreateAudioDeviceOutputNodeResult_Interface'Class;
   type IAsyncOperation_ICreateAudioDeviceOutputNodeResult_Ptr is access all IAsyncOperation_ICreateAudioDeviceOutputNodeResult;
   type IAsyncOperation_ICreateAudioFileInputNodeResult_Interface;
   type IAsyncOperation_ICreateAudioFileInputNodeResult is access all IAsyncOperation_ICreateAudioFileInputNodeResult_Interface'Class;
   type IAsyncOperation_ICreateAudioFileInputNodeResult_Ptr is access all IAsyncOperation_ICreateAudioFileInputNodeResult;
   type IAsyncOperation_ICreateAudioFileOutputNodeResult_Interface;
   type IAsyncOperation_ICreateAudioFileOutputNodeResult is access all IAsyncOperation_ICreateAudioFileOutputNodeResult_Interface'Class;
   type IAsyncOperation_ICreateAudioFileOutputNodeResult_Ptr is access all IAsyncOperation_ICreateAudioFileOutputNodeResult;
   type IIterator_IAudioGraphConnection_Interface;
   type IIterator_IAudioGraphConnection is access all IIterator_IAudioGraphConnection_Interface'Class;
   type IIterator_IAudioGraphConnection_Ptr is access all IIterator_IAudioGraphConnection;
   type IIterable_IAudioGraphConnection_Interface;
   type IIterable_IAudioGraphConnection is access all IIterable_IAudioGraphConnection_Interface'Class;
   type IIterable_IAudioGraphConnection_Ptr is access all IIterable_IAudioGraphConnection;
   type IVectorView_IAudioGraphConnection_Interface;
   type IVectorView_IAudioGraphConnection is access all IVectorView_IAudioGraphConnection_Interface'Class;
   type IVectorView_IAudioGraphConnection_Ptr is access all IVectorView_IAudioGraphConnection;
   type IIterator_IEqualizerBand_Interface;
   type IIterator_IEqualizerBand is access all IIterator_IEqualizerBand_Interface'Class;
   type IIterator_IEqualizerBand_Ptr is access all IIterator_IEqualizerBand;
   type IIterable_IEqualizerBand_Interface;
   type IIterable_IEqualizerBand is access all IIterable_IEqualizerBand_Interface'Class;
   type IIterable_IEqualizerBand_Ptr is access all IIterable_IEqualizerBand;
   type IVectorView_IEqualizerBand_Interface;
   type IVectorView_IEqualizerBand is access all IVectorView_IEqualizerBand_Interface'Class;
   type IVectorView_IEqualizerBand_Ptr is access all IVectorView_IEqualizerBand;
   
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
   
   IID_ICreateAudioGraphResult : aliased constant Windows.IID := (1414786942, 31710, 19318, (187, 93, 72, 247, 156, 252, 140, 11 ));
   
   type ICreateAudioGraphResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ICreateAudioGraphResult_Interface
      ; RetVal : access Windows.Media.Audio.AudioGraphCreationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Graph
   (
      This       : access ICreateAudioGraphResult_Interface
      ; RetVal : access Windows.Media.Audio.IAudioGraph
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioGraphSettingsFactory : aliased constant Windows.IID := (2782469318, 49899, 19041, (162, 20, 29, 102, 215, 95, 131, 218 ));
   
   type IAudioGraphSettingsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAudioGraphSettingsFactory_Interface
      ; audioRenderCategory : Windows.Media.Render.AudioRenderCategory
      ; RetVal : access Windows.Media.Audio.IAudioGraphSettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioGraphSettings : aliased constant Windows.IID := (492397695, 59134, 17960, (132, 248, 157, 139, 219, 162, 87, 133 ));
   
   type IAudioGraphSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EncodingProperties
   (
      This       : access IAudioGraphSettings_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function put_EncodingProperties
   (
      This       : access IAudioGraphSettings_Interface
      ; value : Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_PrimaryRenderDevice
   (
      This       : access IAudioGraphSettings_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function put_PrimaryRenderDevice
   (
      This       : access IAudioGraphSettings_Interface
      ; value : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_QuantumSizeSelectionMode
   (
      This       : access IAudioGraphSettings_Interface
      ; RetVal : access Windows.Media.Audio.QuantumSizeSelectionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_QuantumSizeSelectionMode
   (
      This       : access IAudioGraphSettings_Interface
      ; value : Windows.Media.Audio.QuantumSizeSelectionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredSamplesPerQuantum
   (
      This       : access IAudioGraphSettings_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredSamplesPerQuantum
   (
      This       : access IAudioGraphSettings_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioRenderCategory
   (
      This       : access IAudioGraphSettings_Interface
      ; RetVal : access Windows.Media.Render.AudioRenderCategory
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioRenderCategory
   (
      This       : access IAudioGraphSettings_Interface
      ; value : Windows.Media.Render.AudioRenderCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredRenderDeviceAudioProcessing
   (
      This       : access IAudioGraphSettings_Interface
      ; RetVal : access Windows.Media.AudioProcessing
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredRenderDeviceAudioProcessing
   (
      This       : access IAudioGraphSettings_Interface
      ; value : Windows.Media.AudioProcessing
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioGraphStatics : aliased constant Windows.IID := (1995190578, 57689, 19127, (168, 42, 23, 190, 180, 179, 30, 148 ));
   
   type IAudioGraphStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAsync
   (
      This       : access IAudioGraphStatics_Interface
      ; settings : Windows.Media.Audio.IAudioGraphSettings
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICreateAudioDeviceInputNodeResult : aliased constant Windows.IID := (384747432, 7335, 16623, (145, 164, 211, 70, 224, 170, 27, 186 ));
   
   type ICreateAudioDeviceInputNodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ICreateAudioDeviceInputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.AudioDeviceNodeCreationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceInputNode
   (
      This       : access ICreateAudioDeviceInputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.IAudioDeviceInputNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICreateAudioDeviceOutputNodeResult : aliased constant Windows.IID := (4151799079, 7578, 18423, (156, 212, 40, 89, 204, 27, 123, 255 ));
   
   type ICreateAudioDeviceOutputNodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ICreateAudioDeviceOutputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.AudioDeviceNodeCreationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceOutputNode
   (
      This       : access ICreateAudioDeviceOutputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.IAudioDeviceOutputNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICreateAudioFileInputNodeResult : aliased constant Windows.IID := (3464746524, 58007, 19536, (156, 231, 28, 122, 105, 214, 189, 9 ));
   
   type ICreateAudioFileInputNodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ICreateAudioFileInputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.AudioFileNodeCreationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_FileInputNode
   (
      This       : access ICreateAudioFileInputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.IAudioFileInputNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICreateAudioFileOutputNodeResult : aliased constant Windows.IID := (1205254779, 59657, 17727, (134, 110, 85, 64, 205, 167, 52, 255 ));
   
   type ICreateAudioFileOutputNodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ICreateAudioFileOutputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.AudioFileNodeCreationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_FileOutputNode
   (
      This       : access ICreateAudioFileOutputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.IAudioFileOutputNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioGraphUnrecoverableErrorOccurredEventArgs : aliased constant Windows.IID := (3285830624, 16374, 20403, (178, 98, 80, 212, 53, 197, 84, 35 ));
   
   type IAudioGraphUnrecoverableErrorOccurredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IAudioGraphUnrecoverableErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Media.Audio.AudioGraphUnrecoverableError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioGraph : aliased constant Windows.IID := (450129645, 58508, 19988, (150, 96, 44, 79, 131, 233, 205, 216 ));
   
   type IAudioGraph_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFrameInputNode
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Media.Audio.IAudioFrameInputNode
   )
   return Windows.HRESULT is abstract;
   
   function CreateFrameInputNodeWithFormat
   (
      This       : access IAudioGraph_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; RetVal : access Windows.Media.Audio.IAudioFrameInputNode
   )
   return Windows.HRESULT is abstract;
   
   function CreateDeviceInputNodeAsync
   (
      This       : access IAudioGraph_Interface
      ; category : Windows.Media.Capture.MediaCategory
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceInputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateDeviceInputNodeWithFormatAsync
   (
      This       : access IAudioGraph_Interface
      ; category : Windows.Media.Capture.MediaCategory
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceInputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateDeviceInputNodeWithFormatOnDeviceAsync
   (
      This       : access IAudioGraph_Interface
      ; category : Windows.Media.Capture.MediaCategory
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; device : Windows.Devices.Enumeration.IDeviceInformation
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceInputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFrameOutputNode
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Media.Audio.IAudioFrameOutputNode
   )
   return Windows.HRESULT is abstract;
   
   function CreateFrameOutputNodeWithFormat
   (
      This       : access IAudioGraph_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; RetVal : access Windows.Media.Audio.IAudioFrameOutputNode
   )
   return Windows.HRESULT is abstract;
   
   function CreateDeviceOutputNodeAsync
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceOutputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileInputNodeAsync
   (
      This       : access IAudioGraph_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioFileInputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileOutputNodeAsync
   (
      This       : access IAudioGraph_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioFileOutputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileOutputNodeWithFileProfileAsync
   (
      This       : access IAudioGraph_Interface
      ; file : Windows.Storage.IStorageFile
      ; fileEncodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioFileOutputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateSubmixNode
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Media.Audio.IAudioInputNode
   )
   return Windows.HRESULT is abstract;
   
   function CreateSubmixNodeWithFormat
   (
      This       : access IAudioGraph_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; RetVal : access Windows.Media.Audio.IAudioInputNode
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IAudioGraph_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IAudioGraph_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ResetAllNodes
   (
      This       : access IAudioGraph_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_QuantumStarted
   (
      This       : access IAudioGraph_Interface
      ; handler : TypedEventHandler_IAudioGraph_add_QuantumStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_QuantumStarted
   (
      This       : access IAudioGraph_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_QuantumProcessed
   (
      This       : access IAudioGraph_Interface
      ; handler : TypedEventHandler_IAudioGraph_add_QuantumProcessed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_QuantumProcessed
   (
      This       : access IAudioGraph_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_UnrecoverableErrorOccurred
   (
      This       : access IAudioGraph_Interface
      ; handler : TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UnrecoverableErrorOccurred
   (
      This       : access IAudioGraph_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_CompletedQuantumCount
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_EncodingProperties
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_LatencyInSamples
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PrimaryRenderDevice
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_RenderDeviceAudioProcessing
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Media.AudioProcessing
   )
   return Windows.HRESULT is abstract;
   
   function get_SamplesPerQuantum
   (
      This       : access IAudioGraph_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioGraph2 : aliased constant Windows.IID := (1313618901, 20417, 17910, (169, 71, 60, 211, 143, 79, 216, 57 ));
   
   type IAudioGraph2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFrameInputNodeWithFormatAndEmitter
   (
      This       : access IAudioGraph2_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; emitter : Windows.Media.Audio.IAudioNodeEmitter
      ; RetVal : access Windows.Media.Audio.IAudioFrameInputNode
   )
   return Windows.HRESULT is abstract;
   
   function CreateDeviceInputNodeWithFormatAndEmitterOnDeviceAsync
   (
      This       : access IAudioGraph2_Interface
      ; category : Windows.Media.Capture.MediaCategory
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; device : Windows.Devices.Enumeration.IDeviceInformation
      ; emitter : Windows.Media.Audio.IAudioNodeEmitter
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceInputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileInputNodeWithEmitterAsync
   (
      This       : access IAudioGraph2_Interface
      ; file : Windows.Storage.IStorageFile
      ; emitter : Windows.Media.Audio.IAudioNodeEmitter
      ; RetVal : access Windows.Media.Audio.IAsyncOperation_ICreateAudioFileInputNodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateSubmixNodeWithFormatAndEmitter
   (
      This       : access IAudioGraph2_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
      ; emitter : Windows.Media.Audio.IAudioNodeEmitter
      ; RetVal : access Windows.Media.Audio.IAudioInputNode
   )
   return Windows.HRESULT is abstract;
   
   function CreateBatchUpdater
   (
      This       : access IAudioGraph2_Interface
      ; RetVal : access Windows.Foundation.IClosable
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNode : aliased constant Windows.IID := (356031871, 56280, 18457, (191, 3, 102, 142, 147, 87, 205, 109 ));
   
   type IAudioNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EffectDefinitions
   (
      This       : access IAudioNode_Interface
      ; RetVal : access Windows.Media.Effects.IVector_IAudioEffectDefinition -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_OutgoingGain
   (
      This       : access IAudioNode_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OutgoingGain
   (
      This       : access IAudioNode_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_EncodingProperties
   (
      This       : access IAudioNode_Interface
      ; RetVal : access Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_ConsumeInput
   (
      This       : access IAudioNode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ConsumeInput
   (
      This       : access IAudioNode_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IAudioNode_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IAudioNode_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IAudioNode_Interface
   )
   return Windows.HRESULT is abstract;
   
   function DisableEffectsByDefinition
   (
      This       : access IAudioNode_Interface
      ; definition : Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function EnableEffectsByDefinition
   (
      This       : access IAudioNode_Interface
      ; definition : Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeWithListener : aliased constant Windows.IID := (235901052, 31231, 17732, (158, 235, 1, 37, 123, 21, 16, 90 ));
   
   type IAudioNodeWithListener_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Listener
   (
      This       : access IAudioNodeWithListener_Interface
      ; value : Windows.Media.Audio.IAudioNodeListener
   )
   return Windows.HRESULT is abstract;
   
   function get_Listener
   (
      This       : access IAudioNodeWithListener_Interface
      ; RetVal : access Windows.Media.Audio.IAudioNodeListener
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioInputNode : aliased constant Windows.IID := (3511156828, 33832, 18308, (183, 253, 169, 157, 70, 140, 93, 32 ));
   
   type IAudioInputNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OutgoingConnections
   (
      This       : access IAudioInputNode_Interface
      ; RetVal : access Windows.Media.Audio.IVectorView_IAudioGraphConnection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddOutgoingConnection
   (
      This       : access IAudioInputNode_Interface
      ; destination : Windows.Media.Audio.IAudioNode
   )
   return Windows.HRESULT is abstract;
   
   function AddOutgoingConnectionWithGain
   (
      This       : access IAudioInputNode_Interface
      ; destination : Windows.Media.Audio.IAudioNode
      ; gain : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function RemoveOutgoingConnection
   (
      This       : access IAudioInputNode_Interface
      ; destination : Windows.Media.Audio.IAudioNode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioInputNode2 : aliased constant Windows.IID := (2421249719, 51816, 19565, (168, 188, 227, 238, 23, 254, 63, 210 ));
   
   type IAudioInputNode2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Emitter
   (
      This       : access IAudioInputNode2_Interface
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioFrameInputNode : aliased constant Windows.IID := (28468935, 64918, 20469, (163, 197, 210, 122, 155, 244, 66, 55 ));
   
   type IAudioFrameInputNode_Interface is interface and Windows.IInspectable_Interface;
   
   function put_PlaybackSpeedFactor
   (
      This       : access IAudioFrameInputNode_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackSpeedFactor
   (
      This       : access IAudioFrameInputNode_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function AddFrame
   (
      This       : access IAudioFrameInputNode_Interface
      ; frame : Windows.Media.IAudioFrame
   )
   return Windows.HRESULT is abstract;
   
   function DiscardQueuedFrames
   (
      This       : access IAudioFrameInputNode_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_QueuedSampleCount
   (
      This       : access IAudioFrameInputNode_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function add_AudioFrameCompleted
   (
      This       : access IAudioFrameInputNode_Interface
      ; handler : TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AudioFrameCompleted
   (
      This       : access IAudioFrameInputNode_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_QuantumStarted
   (
      This       : access IAudioFrameInputNode_Interface
      ; handler : TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_QuantumStarted
   (
      This       : access IAudioFrameInputNode_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioFileInputNode : aliased constant Windows.IID := (2421909448, 28517, 19668, (136, 144, 70, 148, 132, 60, 39, 109 ));
   
   type IAudioFileInputNode_Interface is interface and Windows.IInspectable_Interface;
   
   function put_PlaybackSpeedFactor
   (
      This       : access IAudioFileInputNode_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackSpeedFactor
   (
      This       : access IAudioFileInputNode_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IAudioFileInputNode_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function Seek
   (
      This       : access IAudioFileInputNode_Interface
      ; position : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_StartTime
   (
      This       : access IAudioFileInputNode_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_StartTime
   (
      This       : access IAudioFileInputNode_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_EndTime
   (
      This       : access IAudioFileInputNode_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_EndTime
   (
      This       : access IAudioFileInputNode_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_LoopCount
   (
      This       : access IAudioFileInputNode_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_LoopCount
   (
      This       : access IAudioFileInputNode_Interface
      ; value : Windows.Foundation.IReference_Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAudioFileInputNode_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceFile
   (
      This       : access IAudioFileInputNode_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function add_FileCompleted
   (
      This       : access IAudioFileInputNode_Interface
      ; handler : TypedEventHandler_IAudioFileInputNode_add_FileCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FileCompleted
   (
      This       : access IAudioFileInputNode_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioDeviceInputNode : aliased constant Windows.IID := (2954587105, 28494, 18914, (172, 1, 85, 157, 98, 190, 179, 169 ));
   
   type IAudioDeviceInputNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IAudioDeviceInputNode_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioDeviceOutputNode : aliased constant Windows.IID := (909040639, 65308, 17460, (158, 15, 189, 46, 245, 34, 172, 130 ));
   
   type IAudioDeviceOutputNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IAudioDeviceOutputNode_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioFrameOutputNode : aliased constant Windows.IID := (3091674907, 12953, 17909, (136, 179, 201, 209, 42, 63, 28, 200 ));
   
   type IAudioFrameOutputNode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFrame
   (
      This       : access IAudioFrameOutputNode_Interface
      ; RetVal : access Windows.Media.IAudioFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioFileOutputNode : aliased constant Windows.IID := (1356863872, 20838, 16531, (128, 248, 173, 160, 0, 137, 233, 207 ));
   
   type IAudioFileOutputNode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_File
   (
      This       : access IAudioFileOutputNode_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_FileEncodingProfile
   (
      This       : access IAudioFileOutputNode_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function FinalizeAsync
   (
      This       : access IAudioFileOutputNode_Interface
      ; RetVal : access Windows.Media.Transcoding.IAsyncOperation_TranscodeFailureReason -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioFrameCompletedEventArgs : aliased constant Windows.IID := (3699147422, 520, 17668, (165, 168, 240, 242, 104, 146, 10, 101 ));
   
   type IAudioFrameCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Frame
   (
      This       : access IAudioFrameCompletedEventArgs_Interface
      ; RetVal : access Windows.Media.IAudioFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFrameInputNodeQuantumStartedEventArgs : aliased constant Windows.IID := (1033622680, 41734, 20230, (189, 159, 233, 239, 200, 34, 99, 4 ));
   
   type IFrameInputNodeQuantumStartedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequiredSamples
   (
      This       : access IFrameInputNodeQuantumStartedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioGraphConnection : aliased constant Windows.IID := (1982886125, 53326, 20396, (178, 51, 96, 11, 66, 237, 212, 105 ));
   
   type IAudioGraphConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Destination
   (
      This       : access IAudioGraphConnection_Interface
      ; RetVal : access Windows.Media.Audio.IAudioNode
   )
   return Windows.HRESULT is abstract;
   
   function put_Gain
   (
      This       : access IAudioGraphConnection_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Gain
   (
      This       : access IAudioGraphConnection_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEqualizerBand : aliased constant Windows.IID := (3221903978, 9773, 19333, (155, 183, 67, 40, 11, 98, 237, 12 ));
   
   type IEqualizerBand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Bandwidth
   (
      This       : access IEqualizerBand_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Bandwidth
   (
      This       : access IEqualizerBand_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_FrequencyCenter
   (
      This       : access IEqualizerBand_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_FrequencyCenter
   (
      This       : access IEqualizerBand_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Gain
   (
      This       : access IEqualizerBand_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Gain
   (
      This       : access IEqualizerBand_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEqualizerEffectDefinitionFactory : aliased constant Windows.IID := (3532091332, 54288, 20149, (158, 105, 201, 170, 18, 119, 234, 240 ));
   
   type IEqualizerEffectDefinitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IEqualizerEffectDefinitionFactory_Interface
      ; audioGraph : Windows.Media.Audio.IAudioGraph
      ; RetVal : access Windows.Media.Audio.IEqualizerEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReverbEffectDefinitionFactory : aliased constant Windows.IID := (2815806462, 4107, 20464, (157, 166, 220, 78, 5, 167, 89, 240 ));
   
   type IReverbEffectDefinitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IReverbEffectDefinitionFactory_Interface
      ; audioGraph : Windows.Media.Audio.IAudioGraph
      ; RetVal : access Windows.Media.Audio.IReverbEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEchoEffectDefinitionFactory : aliased constant Windows.IID := (223224407, 43762, 20102, (165, 76, 251, 121, 219, 143, 108, 18 ));
   
   type IEchoEffectDefinitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IEchoEffectDefinitionFactory_Interface
      ; audioGraph : Windows.Media.Audio.IAudioGraph
      ; RetVal : access Windows.Media.Audio.IEchoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILimiterEffectDefinitionFactory : aliased constant Windows.IID := (3971671793, 25087, 17903, (184, 245, 72, 101, 154, 87, 199, 45 ));
   
   type ILimiterEffectDefinitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ILimiterEffectDefinitionFactory_Interface
      ; audioGraph : Windows.Media.Audio.IAudioGraph
      ; RetVal : access Windows.Media.Audio.ILimiterEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitterConeProperties : aliased constant Windows.IID := (3919260910, 714, 17269, (147, 38, 12, 106, 228, 188, 223, 181 ));
   
   type IAudioNodeEmitterConeProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InnerAngle
   (
      This       : access IAudioNodeEmitterConeProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OuterAngle
   (
      This       : access IAudioNodeEmitterConeProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OuterAngleGain
   (
      This       : access IAudioNodeEmitterConeProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitterShape : aliased constant Windows.IID := (3926069701, 59197, 17596, (133, 156, 69, 85, 59, 188, 72, 40 ));
   
   type IAudioNodeEmitterShape_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IAudioNodeEmitterShape_Interface
      ; RetVal : access Windows.Media.Audio.AudioNodeEmitterShapeKind
   )
   return Windows.HRESULT is abstract;
   
   function get_ConeProperties
   (
      This       : access IAudioNodeEmitterShape_Interface
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitterConeProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitterShapeStatics : aliased constant Windows.IID := (1471883121, 65445, 19334, (167, 121, 226, 100, 174, 185, 20, 95 ));
   
   type IAudioNodeEmitterShapeStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCone
   (
      This       : access IAudioNodeEmitterShapeStatics_Interface
      ; innerAngle : Windows.Double
      ; outerAngle : Windows.Double
      ; outerAngleGain : Windows.Double
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitterShape
   )
   return Windows.HRESULT is abstract;
   
   function CreateOmnidirectional
   (
      This       : access IAudioNodeEmitterShapeStatics_Interface
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitterShape
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitterNaturalDecayModelProperties : aliased constant Windows.IID := (1217612751, 53036, 20220, (147, 49, 117, 189, 34, 223, 31, 12 ));
   
   type IAudioNodeEmitterNaturalDecayModelProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnityGainDistance
   (
      This       : access IAudioNodeEmitterNaturalDecayModelProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CutoffDistance
   (
      This       : access IAudioNodeEmitterNaturalDecayModelProperties_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitterDecayModel : aliased constant Windows.IID := (488463095, 3411, 20393, (189, 132, 213, 129, 106, 134, 243, 255 ));
   
   type IAudioNodeEmitterDecayModel_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IAudioNodeEmitterDecayModel_Interface
      ; RetVal : access Windows.Media.Audio.AudioNodeEmitterDecayKind
   )
   return Windows.HRESULT is abstract;
   
   function get_MinGain
   (
      This       : access IAudioNodeEmitterDecayModel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxGain
   (
      This       : access IAudioNodeEmitterDecayModel_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalProperties
   (
      This       : access IAudioNodeEmitterDecayModel_Interface
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitterNaturalDecayModelProperties
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitterDecayModelStatics : aliased constant Windows.IID := (3346562216, 61816, 17967, (188, 129, 141, 213, 203, 229, 218, 232 ));
   
   type IAudioNodeEmitterDecayModelStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateNatural
   (
      This       : access IAudioNodeEmitterDecayModelStatics_Interface
      ; minGain : Windows.Double
      ; maxGain : Windows.Double
      ; unityGainDistance : Windows.Double
      ; cutoffDistance : Windows.Double
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitterDecayModel
   )
   return Windows.HRESULT is abstract;
   
   function CreateCustom
   (
      This       : access IAudioNodeEmitterDecayModelStatics_Interface
      ; minGain : Windows.Double
      ; maxGain : Windows.Double
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitterDecayModel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitter : aliased constant Windows.IID := (913741597, 34826, 18360, (173, 247, 19, 35, 169, 217, 101, 190 ));
   
   type IAudioNodeEmitter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access IAudioNodeEmitter_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Direction
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Direction
   (
      This       : access IAudioNodeEmitter_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Shape
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitterShape
   )
   return Windows.HRESULT is abstract;
   
   function get_DecayModel
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitterDecayModel
   )
   return Windows.HRESULT is abstract;
   
   function get_Gain
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Gain
   (
      This       : access IAudioNodeEmitter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DistanceScale
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DistanceScale
   (
      This       : access IAudioNodeEmitter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DopplerScale
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DopplerScale
   (
      This       : access IAudioNodeEmitter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DopplerVelocity
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_DopplerVelocity
   (
      This       : access IAudioNodeEmitter_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDopplerDisabled
   (
      This       : access IAudioNodeEmitter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitter2 : aliased constant Windows.IID := (1253502667, 60457, 18424, (129, 140, 182, 182, 96, 165, 174, 177 ));
   
   type IAudioNodeEmitter2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SpatialAudioModel
   (
      This       : access IAudioNodeEmitter2_Interface
      ; RetVal : access Windows.Media.Audio.SpatialAudioModel
   )
   return Windows.HRESULT is abstract;
   
   function put_SpatialAudioModel
   (
      This       : access IAudioNodeEmitter2_Interface
      ; value : Windows.Media.Audio.SpatialAudioModel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeEmitterFactory : aliased constant Windows.IID := (4257761434, 27350, 19684, (183, 247, 169, 147, 112, 223, 126, 233 ));
   
   type IAudioNodeEmitterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAudioNodeEmitter
   (
      This       : access IAudioNodeEmitterFactory_Interface
      ; shape : Windows.Media.Audio.IAudioNodeEmitterShape
      ; decayModel : Windows.Media.Audio.IAudioNodeEmitterDecayModel
      ; settings : Windows.Media.Audio.AudioNodeEmitterSettings
      ; RetVal : access Windows.Media.Audio.IAudioNodeEmitter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioNodeListener : aliased constant Windows.IID := (3648138774, 3082, 16858, (183, 85, 108, 119, 131, 95, 177, 235 ));
   
   type IAudioNodeListener_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IAudioNodeListener_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access IAudioNodeListener_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IAudioNodeListener_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function put_Orientation
   (
      This       : access IAudioNodeListener_Interface
      ; value : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function get_SpeedOfSound
   (
      This       : access IAudioNodeListener_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_SpeedOfSound
   (
      This       : access IAudioNodeListener_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DopplerVelocity
   (
      This       : access IAudioNodeListener_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_DopplerVelocity
   (
      This       : access IAudioNodeListener_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEqualizerEffectDefinition : aliased constant Windows.IID := (37711647, 33790, 17562, (168, 34, 198, 150, 68, 45, 22, 176 ));
   
   type IEqualizerEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Bands
   (
      This       : access IEqualizerEffectDefinition_Interface
      ; RetVal : access Windows.Media.Audio.IVectorView_IEqualizerBand -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReverbEffectDefinition : aliased constant Windows.IID := (1174841993, 62819, 19722, (143, 110, 240, 205, 223, 243, 93, 132 ));
   
   type IReverbEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WetDryMix
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_WetDryMix
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ReflectionsDelay
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReflectionsDelay
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReverbDelay
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ReverbDelay
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_RearDelay
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_RearDelay
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionLeft
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionLeft
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionRight
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionRight
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionMatrixLeft
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionMatrixLeft
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionMatrixRight
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionMatrixRight
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_EarlyDiffusion
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_EarlyDiffusion
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_LateDiffusion
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_LateDiffusion
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_LowEQGain
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_LowEQGain
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_LowEQCutoff
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_LowEQCutoff
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_HighEQGain
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_HighEQGain
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_HighEQCutoff
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_HighEQCutoff
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_RoomFilterFreq
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RoomFilterFreq
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RoomFilterMain
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RoomFilterMain
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RoomFilterHF
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RoomFilterHF
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ReflectionsGain
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ReflectionsGain
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ReverbGain
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ReverbGain
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DecayTime
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DecayTime
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Density
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Density
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RoomSize
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RoomSize
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_DisableLateField
   (
      This       : access IReverbEffectDefinition_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DisableLateField
   (
      This       : access IReverbEffectDefinition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEchoEffectDefinition : aliased constant Windows.IID := (239943594, 14008, 19601, (185, 218, 17, 244, 74, 138, 102, 16 ));
   
   type IEchoEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function put_WetDryMix
   (
      This       : access IEchoEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_WetDryMix
   (
      This       : access IEchoEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Feedback
   (
      This       : access IEchoEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Feedback
   (
      This       : access IEchoEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Delay
   (
      This       : access IEchoEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Delay
   (
      This       : access IEchoEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILimiterEffectDefinition : aliased constant Windows.IID := (1802853657, 9731, 18362, (189, 235, 57, 5, 94, 52, 134, 220 ));
   
   type ILimiterEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Release
   (
      This       : access ILimiterEffectDefinition_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Release
   (
      This       : access ILimiterEffectDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Loudness
   (
      This       : access ILimiterEffectDefinition_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Loudness
   (
      This       : access ILimiterEffectDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IAudioEffectDefinition_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivatableClassId
   (
      This       : access IAudioEffectDefinition_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IAudioEffectDefinition_Imported_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICreateAudioGraphResult : aliased constant Windows.IID := (1041478705, 26062, 23547, (176, 170, 250, 200, 223, 149, 139, 149 ));
   
   type IAsyncOperation_ICreateAudioGraphResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICreateAudioGraphResult_Interface
      ; handler : Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioGraphResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICreateAudioGraphResult_Interface
      ; RetVal : access Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioGraphResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICreateAudioGraphResult_Interface
      ; RetVal : access Windows.Media.Audio.ICreateAudioGraphResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICreateAudioDeviceInputNodeResult : aliased constant Windows.IID := (1907049601, 60490, 24297, (163, 66, 58, 49, 116, 120, 41, 184 ));
   
   type IAsyncOperation_ICreateAudioDeviceInputNodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICreateAudioDeviceInputNodeResult_Interface
      ; handler : Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICreateAudioDeviceInputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICreateAudioDeviceInputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.ICreateAudioDeviceInputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICreateAudioDeviceOutputNodeResult : aliased constant Windows.IID := (4161853232, 56853, 22752, (165, 244, 193, 89, 247, 54, 105, 237 ));
   
   type IAsyncOperation_ICreateAudioDeviceOutputNodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICreateAudioDeviceOutputNodeResult_Interface
      ; handler : Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICreateAudioDeviceOutputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICreateAudioDeviceOutputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICreateAudioFileInputNodeResult : aliased constant Windows.IID := (1195050687, 14459, 22218, (190, 225, 82, 116, 128, 39, 43, 15 ));
   
   type IAsyncOperation_ICreateAudioFileInputNodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICreateAudioFileInputNodeResult_Interface
      ; handler : Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICreateAudioFileInputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICreateAudioFileInputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.ICreateAudioFileInputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICreateAudioFileOutputNodeResult : aliased constant Windows.IID := (291787133, 59731, 21525, (165, 179, 66, 73, 169, 105, 190, 123 ));
   
   type IAsyncOperation_ICreateAudioFileOutputNodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICreateAudioFileOutputNodeResult_Interface
      ; handler : Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICreateAudioFileOutputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICreateAudioFileOutputNodeResult_Interface
      ; RetVal : access Windows.Media.Audio.ICreateAudioFileOutputNodeResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAudioGraphConnection : aliased constant Windows.IID := (1257679100, 59387, 22871, (145, 193, 45, 249, 96, 11, 34, 235 ));
   
   type IIterator_IAudioGraphConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAudioGraphConnection_Interface
      ; RetVal : access Windows.Media.Audio.IAudioGraphConnection
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAudioGraphConnection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAudioGraphConnection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAudioGraphConnection_Interface
      ; items : Windows.Media.Audio.IAudioGraphConnection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAudioGraphConnection : aliased constant Windows.IID := (2518060294, 42266, 21632, (148, 3, 251, 215, 99, 30, 59, 60 ));
   
   type IIterable_IAudioGraphConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAudioGraphConnection_Interface
      ; RetVal : access Windows.Media.Audio.IIterator_IAudioGraphConnection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAudioGraphConnection : aliased constant Windows.IID := (2223353553, 39692, 22994, (162, 6, 105, 155, 247, 70, 195, 255 ));
   
   type IVectorView_IAudioGraphConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAudioGraphConnection_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Audio.IAudioGraphConnection
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAudioGraphConnection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAudioGraphConnection_Interface
      ; value : Windows.Media.Audio.IAudioGraphConnection
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAudioGraphConnection_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Audio.IAudioGraphConnection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEqualizerBand : aliased constant Windows.IID := (3947858794, 31016, 24367, (183, 242, 123, 144, 192, 132, 53, 111 ));
   
   type IIterator_IEqualizerBand_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEqualizerBand_Interface
      ; RetVal : access Windows.Media.Audio.IEqualizerBand
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEqualizerBand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEqualizerBand_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEqualizerBand_Interface
      ; items : Windows.Media.Audio.IEqualizerBand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEqualizerBand : aliased constant Windows.IID := (1870057800, 574, 22106, (159, 9, 74, 212, 163, 42, 215, 79 ));
   
   type IIterable_IEqualizerBand_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEqualizerBand_Interface
      ; RetVal : access Windows.Media.Audio.IIterator_IEqualizerBand
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IEqualizerBand : aliased constant Windows.IID := (1223843923, 60029, 23009, (149, 43, 251, 120, 175, 66, 210, 226 ));
   
   type IVectorView_IEqualizerBand_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IEqualizerBand_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Audio.IEqualizerBand
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IEqualizerBand_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IEqualizerBand_Interface
      ; value : Windows.Media.Audio.IEqualizerBand
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IEqualizerBand_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Audio.IEqualizerBand_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICreateAudioGraphResult : aliased constant Windows.IID := (1315310554, 54328, 22337, (139, 102, 133, 254, 114, 87, 74, 171 ));
   
   type AsyncOperationCompletedHandler_ICreateAudioGraphResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICreateAudioGraphResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICreateAudioGraphResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult : aliased constant Windows.IID := (1824875600, 58600, 22985, (131, 216, 99, 228, 110, 172, 178, 11 ));
   
   type AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceInputNodeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceInputNodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult : aliased constant Windows.IID := (3988560729, 31918, 20799, (176, 220, 23, 102, 109, 55, 186, 119 ));
   
   type AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceOutputNodeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceOutputNodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult : aliased constant Windows.IID := (1347231485, 49436, 20590, (184, 201, 175, 23, 199, 113, 239, 181 ));
   
   type AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioFileInputNodeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioFileInputNodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult : aliased constant Windows.IID := (2812892947, 41103, 24543, (137, 198, 150, 39, 188, 245, 216, 10 ));
   
   type AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioFileOutputNodeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioFileOutputNodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioGraph_add_QuantumStarted : aliased constant Windows.IID := (3779096884, 2535, 21470, (181, 76, 138, 6, 89, 57, 123, 136 ));
   
   type TypedEventHandler_IAudioGraph_add_QuantumStarted_Interface(Callback : access procedure (sender : Windows.Media.Audio.IAudioGraph ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioGraph_add_QuantumStarted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAudioGraph_add_QuantumStarted_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioGraph_add_QuantumProcessed : aliased constant Windows.IID := (3779096884, 2535, 21470, (181, 76, 138, 6, 89, 57, 123, 136 ));
   
   type TypedEventHandler_IAudioGraph_add_QuantumProcessed_Interface(Callback : access procedure (sender : Windows.Media.Audio.IAudioGraph ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioGraph_add_QuantumProcessed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAudioGraph_add_QuantumProcessed_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred : aliased constant Windows.IID := (2308337865, 56703, 24338, (152, 203, 139, 23, 254, 128, 164, 127 ));
   
   type TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred_Interface(Callback : access procedure (sender : Windows.Media.Audio.IAudioGraph ; args : Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted : aliased constant Windows.IID := (2908347646, 29104, 24086, (153, 194, 205, 144, 100, 77, 142, 232 ));
   
   type TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted_Interface(Callback : access procedure (sender : Windows.Media.Audio.IAudioFrameInputNode ; args : Windows.Media.Audio.IAudioFrameCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted_Interface
      ; sender : Windows.Media.Audio.IAudioFrameInputNode
      ; args : Windows.Media.Audio.IAudioFrameCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted : aliased constant Windows.IID := (1160827169, 48026, 22526, (146, 47, 169, 142, 238, 223, 89, 175 ));
   
   type TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted_Interface(Callback : access procedure (sender : Windows.Media.Audio.IAudioFrameInputNode ; args : Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted_Interface
      ; sender : Windows.Media.Audio.IAudioFrameInputNode
      ; args : Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioFileInputNode_add_FileCompleted : aliased constant Windows.IID := (1149306971, 35723, 21792, (152, 37, 233, 103, 29, 162, 168, 159 ));
   
   type TypedEventHandler_IAudioFileInputNode_add_FileCompleted_Interface(Callback : access procedure (sender : Windows.Media.Audio.IAudioFileInputNode ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioFileInputNode_add_FileCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAudioFileInputNode_add_FileCompleted_Interface
      ; sender : Windows.Media.Audio.IAudioFileInputNode
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AudioGraph is Windows.Media.Audio.IAudioGraph;
   subtype CreateAudioGraphResult is Windows.Media.Audio.ICreateAudioGraphResult;
   subtype AudioGraphSettings is Windows.Media.Audio.IAudioGraphSettings;
   function Create
   (
      audioRenderCategory : Windows.Media.Render.AudioRenderCategory
   )
   return Windows.Media.Audio.IAudioGraphSettings;
   
   
   subtype AudioDeviceInputNode is Windows.Media.Audio.IAudioDeviceInputNode;
   subtype CreateAudioDeviceInputNodeResult is Windows.Media.Audio.ICreateAudioDeviceInputNodeResult;
   subtype AudioDeviceOutputNode is Windows.Media.Audio.IAudioDeviceOutputNode;
   subtype CreateAudioDeviceOutputNodeResult is Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult;
   subtype AudioFileInputNode is Windows.Media.Audio.IAudioFileInputNode;
   subtype CreateAudioFileInputNodeResult is Windows.Media.Audio.ICreateAudioFileInputNodeResult;
   subtype AudioFileOutputNode is Windows.Media.Audio.IAudioFileOutputNode;
   subtype CreateAudioFileOutputNodeResult is Windows.Media.Audio.ICreateAudioFileOutputNodeResult;
   subtype AudioGraphUnrecoverableErrorOccurredEventArgs is Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs;
   subtype AudioGraphBatchUpdater is Windows.Foundation.IClosable;
   subtype AudioFrameInputNode is Windows.Media.Audio.IAudioFrameInputNode;
   subtype AudioFrameOutputNode is Windows.Media.Audio.IAudioFrameOutputNode;
   subtype AudioSubmixNode is Windows.Media.Audio.IAudioInputNode;
   subtype AudioNodeEmitter is Windows.Media.Audio.IAudioNodeEmitter;
   
   function CreateAudioNodeEmitter return Windows.Media.Audio.IAudioNodeEmitter;
   
   subtype AudioNodeListener is Windows.Media.Audio.IAudioNodeListener;
   
   function CreateAudioNodeListener return Windows.Media.Audio.IAudioNodeListener;
   
   subtype AudioGraphConnection is Windows.Media.Audio.IAudioGraphConnection;
   subtype AudioFrameCompletedEventArgs is Windows.Media.Audio.IAudioFrameCompletedEventArgs;
   subtype FrameInputNodeQuantumStartedEventArgs is Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs;
   subtype EqualizerBand is Windows.Media.Audio.IEqualizerBand;
   subtype EqualizerEffectDefinition is Windows.Media.Audio.IEqualizerEffectDefinition;
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IEqualizerEffectDefinition;
   
   
   subtype ReverbEffectDefinition is Windows.Media.Audio.IReverbEffectDefinition;
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IReverbEffectDefinition;
   
   
   subtype EchoEffectDefinition is Windows.Media.Audio.IEchoEffectDefinition;
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IEchoEffectDefinition;
   
   
   subtype LimiterEffectDefinition is Windows.Media.Audio.ILimiterEffectDefinition;
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.ILimiterEffectDefinition;
   
   
   subtype AudioNodeEmitterConeProperties is Windows.Media.Audio.IAudioNodeEmitterConeProperties;
   subtype AudioNodeEmitterShape is Windows.Media.Audio.IAudioNodeEmitterShape;
   subtype AudioNodeEmitterNaturalDecayModelProperties is Windows.Media.Audio.IAudioNodeEmitterNaturalDecayModelProperties;
   subtype AudioNodeEmitterDecayModel is Windows.Media.Audio.IAudioNodeEmitterDecayModel;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateAsync
   (
      settings : Windows.Media.Audio.IAudioGraphSettings
   )
   return Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult;
   
   function CreateCone
   (
      innerAngle : Windows.Double
      ; outerAngle : Windows.Double
      ; outerAngleGain : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterShape;
   
   function CreateOmnidirectional
   return Windows.Media.Audio.IAudioNodeEmitterShape;
   
   function CreateNatural
   (
      minGain : Windows.Double
      ; maxGain : Windows.Double
      ; unityGainDistance : Windows.Double
      ; cutoffDistance : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterDecayModel;
   
   function CreateCustom
   (
      minGain : Windows.Double
      ; maxGain : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterDecayModel;
   

end;
