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
with Windows.Foundation.Collections;
limited with Windows.UI.Popups;
--------------------------------------------------------------------------------
package Windows.Media.Casting is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CastingPlaybackTypes is (
      None,
      Audio,
      Video,
      Picture
   );
   for CastingPlaybackTypes use (
      None => 0,
      Audio => 1,
      Video => 2,
      Picture => 4
   );
   for CastingPlaybackTypes'Size use 32;
   
   type CastingPlaybackTypes_Ptr is access CastingPlaybackTypes;
   
   type CastingConnectionErrorStatus is (
      Succeeded,
      DeviceDidNotRespond,
      DeviceError,
      DeviceLocked,
      ProtectedPlaybackFailed,
      InvalidCastingSource,
      Unknown
   );
   for CastingConnectionErrorStatus use (
      Succeeded => 0,
      DeviceDidNotRespond => 1,
      DeviceError => 2,
      DeviceLocked => 3,
      ProtectedPlaybackFailed => 4,
      InvalidCastingSource => 5,
      Unknown => 6
   );
   for CastingConnectionErrorStatus'Size use 32;
   
   type CastingConnectionErrorStatus_Ptr is access CastingConnectionErrorStatus;
   
   type CastingConnectionState is (
      Disconnected,
      Connected,
      Rendering,
      Disconnecting,
      Connecting
   );
   for CastingConnectionState use (
      Disconnected => 0,
      Connected => 1,
      Rendering => 2,
      Disconnecting => 3,
      Connecting => 4
   );
   for CastingConnectionState'Size use 32;
   
   type CastingConnectionState_Ptr is access CastingConnectionState;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ICastingConnection_add_StateChanged_Interface;
   type TypedEventHandler_ICastingConnection_add_StateChanged is access all TypedEventHandler_ICastingConnection_add_StateChanged_Interface'Class;
   type TypedEventHandler_ICastingConnection_add_StateChanged_Ptr is access all TypedEventHandler_ICastingConnection_add_StateChanged;
   type TypedEventHandler_ICastingConnection_add_ErrorOccurred_Interface;
   type TypedEventHandler_ICastingConnection_add_ErrorOccurred is access all TypedEventHandler_ICastingConnection_add_ErrorOccurred_Interface'Class;
   type TypedEventHandler_ICastingConnection_add_ErrorOccurred_Ptr is access all TypedEventHandler_ICastingConnection_add_ErrorOccurred;
   type AsyncOperationCompletedHandler_CastingConnectionErrorStatus_Interface;
   type AsyncOperationCompletedHandler_CastingConnectionErrorStatus is access all AsyncOperationCompletedHandler_CastingConnectionErrorStatus_Interface'Class;
   type AsyncOperationCompletedHandler_CastingConnectionErrorStatus_Ptr is access all AsyncOperationCompletedHandler_CastingConnectionErrorStatus;
   type AsyncOperationCompletedHandler_CastingPlaybackTypes_Interface;
   type AsyncOperationCompletedHandler_CastingPlaybackTypes is access all AsyncOperationCompletedHandler_CastingPlaybackTypes_Interface'Class;
   type AsyncOperationCompletedHandler_CastingPlaybackTypes_Ptr is access all AsyncOperationCompletedHandler_CastingPlaybackTypes;
   type AsyncOperationCompletedHandler_ICastingDevice_Interface;
   type AsyncOperationCompletedHandler_ICastingDevice is access all AsyncOperationCompletedHandler_ICastingDevice_Interface'Class;
   type AsyncOperationCompletedHandler_ICastingDevice_Ptr is access all AsyncOperationCompletedHandler_ICastingDevice;
   type TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected_Interface;
   type TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected is access all TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected_Interface'Class;
   type TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected_Ptr is access all TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected;
   type TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed_Interface;
   type TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed is access all TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed_Interface'Class;
   type TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed_Ptr is access all TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICastingSource_Interface;
   type ICastingSource is access all ICastingSource_Interface'Class;
   type ICastingSource_Ptr is access all ICastingSource;
   type ICastingConnectionErrorOccurredEventArgs_Interface;
   type ICastingConnectionErrorOccurredEventArgs is access all ICastingConnectionErrorOccurredEventArgs_Interface'Class;
   type ICastingConnectionErrorOccurredEventArgs_Ptr is access all ICastingConnectionErrorOccurredEventArgs;
   type ICastingConnection_Interface;
   type ICastingConnection is access all ICastingConnection_Interface'Class;
   type ICastingConnection_Ptr is access all ICastingConnection;
   type ICastingDevice_Interface;
   type ICastingDevice is access all ICastingDevice_Interface'Class;
   type ICastingDevice_Ptr is access all ICastingDevice;
   type ICastingDeviceStatics_Interface;
   type ICastingDeviceStatics is access all ICastingDeviceStatics_Interface'Class;
   type ICastingDeviceStatics_Ptr is access all ICastingDeviceStatics;
   type ICastingDeviceSelectedEventArgs_Interface;
   type ICastingDeviceSelectedEventArgs is access all ICastingDeviceSelectedEventArgs_Interface'Class;
   type ICastingDeviceSelectedEventArgs_Ptr is access all ICastingDeviceSelectedEventArgs;
   type ICastingDevicePickerFilter_Interface;
   type ICastingDevicePickerFilter is access all ICastingDevicePickerFilter_Interface'Class;
   type ICastingDevicePickerFilter_Ptr is access all ICastingDevicePickerFilter;
   type ICastingDevicePicker_Interface;
   type ICastingDevicePicker is access all ICastingDevicePicker_Interface'Class;
   type ICastingDevicePicker_Ptr is access all ICastingDevicePicker;
   type IAsyncOperation_CastingConnectionErrorStatus_Interface;
   type IAsyncOperation_CastingConnectionErrorStatus is access all IAsyncOperation_CastingConnectionErrorStatus_Interface'Class;
   type IAsyncOperation_CastingConnectionErrorStatus_Ptr is access all IAsyncOperation_CastingConnectionErrorStatus;
   type IAsyncOperation_CastingPlaybackTypes_Interface;
   type IAsyncOperation_CastingPlaybackTypes is access all IAsyncOperation_CastingPlaybackTypes_Interface'Class;
   type IAsyncOperation_CastingPlaybackTypes_Ptr is access all IAsyncOperation_CastingPlaybackTypes;
   type IAsyncOperation_ICastingDevice_Interface;
   type IAsyncOperation_ICastingDevice is access all IAsyncOperation_ICastingDevice_Interface'Class;
   type IAsyncOperation_ICastingDevice_Ptr is access all IAsyncOperation_ICastingDevice;
   type IIterator_ICastingSource_Interface;
   type IIterator_ICastingSource is access all IIterator_ICastingSource_Interface'Class;
   type IIterator_ICastingSource_Ptr is access all IIterator_ICastingSource;
   type IIterable_ICastingSource_Interface;
   type IIterable_ICastingSource is access all IIterable_ICastingSource_Interface'Class;
   type IIterable_ICastingSource_Ptr is access all IIterable_ICastingSource;
   type IVectorView_ICastingSource_Interface;
   type IVectorView_ICastingSource is access all IVectorView_ICastingSource_Interface'Class;
   type IVectorView_ICastingSource_Ptr is access all IVectorView_ICastingSource;
   type IVector_ICastingSource_Interface;
   type IVector_ICastingSource is access all IVector_ICastingSource_Interface'Class;
   type IVector_ICastingSource_Ptr is access all IVector_ICastingSource;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICastingSource : aliased constant Windows.IID := (4096387698, 13415, 18406, (160, 39, 82, 41, 35, 233, 215, 39 ));
   
   type ICastingSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreferredSourceUri
   (
      This       : access ICastingSource_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredSourceUri
   (
      This       : access ICastingSource_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICastingConnectionErrorOccurredEventArgs : aliased constant Windows.IID := (2818260073, 34585, 20224, (129, 251, 150, 24, 99, 199, 154, 50 ));
   
   type ICastingConnectionErrorOccurredEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorStatus
   (
      This       : access ICastingConnectionErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.Media.Casting.CastingConnectionErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access ICastingConnectionErrorOccurredEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICastingConnection : aliased constant Windows.IID := (3449099859, 49905, 17560, (139, 120, 95, 180, 205, 54, 64, 221 ));
   
   type ICastingConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access ICastingConnection_Interface
      ; RetVal : access Windows.Media.Casting.CastingConnectionState
   )
   return Windows.HRESULT is abstract;
   
   function get_Device
   (
      This       : access ICastingConnection_Interface
      ; RetVal : access Windows.Media.Casting.ICastingDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access ICastingConnection_Interface
      ; RetVal : access Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access ICastingConnection_Interface
      ; value : Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access ICastingConnection_Interface
      ; handler : TypedEventHandler_ICastingConnection_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access ICastingConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ErrorOccurred
   (
      This       : access ICastingConnection_Interface
      ; handler : TypedEventHandler_ICastingConnection_add_ErrorOccurred
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ErrorOccurred
   (
      This       : access ICastingConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RequestStartCastingAsync
   (
      This       : access ICastingConnection_Interface
      ; value : Windows.Media.Casting.ICastingSource
      ; RetVal : access Windows.Media.Casting.IAsyncOperation_CastingConnectionErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DisconnectAsync
   (
      This       : access ICastingConnection_Interface
      ; RetVal : access Windows.Media.Casting.IAsyncOperation_CastingConnectionErrorStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICastingDevice : aliased constant Windows.IID := (3732020355, 19011, 19153, (166, 210, 36, 146, 167, 150, 195, 242 ));
   
   type ICastingDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ICastingDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access ICastingDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Icon
   (
      This       : access ICastingDevice_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function GetSupportedCastingPlaybackTypesAsync
   (
      This       : access ICastingDevice_Interface
      ; RetVal : access Windows.Media.Casting.IAsyncOperation_CastingPlaybackTypes -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateCastingConnection
   (
      This       : access ICastingDevice_Interface
      ; RetVal : access Windows.Media.Casting.ICastingConnection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICastingDeviceStatics : aliased constant Windows.IID := (3889780951, 19731, 16951, (163, 101, 76, 79, 106, 76, 253, 47 ));
   
   type ICastingDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ICastingDeviceStatics_Interface
      ; type_x : Windows.Media.Casting.CastingPlaybackTypes
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromCastingSourceAsync
   (
      This       : access ICastingDeviceStatics_Interface
      ; castingSource : Windows.Media.Casting.ICastingSource
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ICastingDeviceStatics_Interface
      ; value : Windows.String
      ; RetVal : access Windows.Media.Casting.IAsyncOperation_ICastingDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeviceInfoSupportsCastingAsync
   (
      This       : access ICastingDeviceStatics_Interface
      ; device : Windows.Devices.Enumeration.IDeviceInformation
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICastingDeviceSelectedEventArgs : aliased constant Windows.IID := (3695419014, 56663, 19725, (148, 0, 175, 69, 228, 251, 54, 99 ));
   
   type ICastingDeviceSelectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedCastingDevice
   (
      This       : access ICastingDeviceSelectedEventArgs_Interface
      ; RetVal : access Windows.Media.Casting.ICastingDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICastingDevicePickerFilter : aliased constant Windows.IID := (3196871068, 46435, 17236, (174, 51, 159, 218, 173, 140, 98, 145 ));
   
   type ICastingDevicePickerFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportsAudio
   (
      This       : access ICastingDevicePickerFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportsAudio
   (
      This       : access ICastingDevicePickerFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsVideo
   (
      This       : access ICastingDevicePickerFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportsVideo
   (
      This       : access ICastingDevicePickerFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportsPictures
   (
      This       : access ICastingDevicePickerFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportsPictures
   (
      This       : access ICastingDevicePickerFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCastingSources
   (
      This       : access ICastingDevicePickerFilter_Interface
      ; RetVal : access Windows.Media.Casting.IVector_ICastingSource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICastingDevicePicker : aliased constant Windows.IID := (3704854820, 1425, 18878, (170, 203, 75, 130, 238, 117, 106, 149 ));
   
   type ICastingDevicePicker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Filter
   (
      This       : access ICastingDevicePicker_Interface
      ; RetVal : access Windows.Media.Casting.ICastingDevicePickerFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_Appearance
   (
      This       : access ICastingDevicePicker_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDevicePickerAppearance
   )
   return Windows.HRESULT is abstract;
   
   function add_CastingDeviceSelected
   (
      This       : access ICastingDevicePicker_Interface
      ; handler : TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CastingDeviceSelected
   (
      This       : access ICastingDevicePicker_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CastingDevicePickerDismissed
   (
      This       : access ICastingDevicePicker_Interface
      ; handler : TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CastingDevicePickerDismissed
   (
      This       : access ICastingDevicePicker_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Show
   (
      This       : access ICastingDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function ShowWithPlacement
   (
      This       : access ICastingDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.HRESULT is abstract;
   
   function Hide
   (
      This       : access ICastingDevicePicker_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_CastingConnectionErrorStatus : aliased constant Windows.IID := (633872828, 57016, 22608, (138, 242, 211, 172, 53, 66, 107, 210 ));
   
   type IAsyncOperation_CastingConnectionErrorStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_CastingConnectionErrorStatus_Interface
      ; handler : Windows.Media.Casting.AsyncOperationCompletedHandler_CastingConnectionErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_CastingConnectionErrorStatus_Interface
      ; RetVal : access Windows.Media.Casting.AsyncOperationCompletedHandler_CastingConnectionErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_CastingConnectionErrorStatus_Interface
      ; RetVal : access Windows.Media.Casting.CastingConnectionErrorStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_CastingPlaybackTypes : aliased constant Windows.IID := (3757117011, 19550, 23994, (146, 105, 205, 97, 136, 27, 184, 179 ));
   
   type IAsyncOperation_CastingPlaybackTypes_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_CastingPlaybackTypes_Interface
      ; handler : Windows.Media.Casting.AsyncOperationCompletedHandler_CastingPlaybackTypes
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_CastingPlaybackTypes_Interface
      ; RetVal : access Windows.Media.Casting.AsyncOperationCompletedHandler_CastingPlaybackTypes
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_CastingPlaybackTypes_Interface
      ; RetVal : access Windows.Media.Casting.CastingPlaybackTypes
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICastingDevice : aliased constant Windows.IID := (458154072, 19561, 24176, (136, 52, 193, 209, 113, 204, 27, 34 ));
   
   type IAsyncOperation_ICastingDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICastingDevice_Interface
      ; handler : Windows.Media.Casting.AsyncOperationCompletedHandler_ICastingDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICastingDevice_Interface
      ; RetVal : access Windows.Media.Casting.AsyncOperationCompletedHandler_ICastingDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICastingDevice_Interface
      ; RetVal : access Windows.Media.Casting.ICastingDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ICastingSource : aliased constant Windows.IID := (1064080361, 52343, 24308, (178, 183, 37, 207, 207, 192, 151, 32 ));
   
   type IIterator_ICastingSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICastingSource_Interface
      ; RetVal : access Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICastingSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICastingSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICastingSource_Interface
      ; items : Windows.Media.Casting.ICastingSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICastingSource : aliased constant Windows.IID := (448474313, 18082, 22705, (145, 170, 40, 105, 157, 102, 209, 171 ));
   
   type IIterable_ICastingSource_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICastingSource_Interface
      ; RetVal : access Windows.Media.Casting.IIterator_ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ICastingSource : aliased constant Windows.IID := (2015943265, 56996, 21637, (178, 122, 143, 120, 224, 71, 36, 2 ));
   
   type IVectorView_ICastingSource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ICastingSource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ICastingSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ICastingSource_Interface
      ; value : Windows.Media.Casting.ICastingSource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ICastingSource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Casting.ICastingSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ICastingSource : aliased constant Windows.IID := (3269713576, 37600, 20655, (156, 147, 131, 179, 232, 107, 115, 180 ));
   
   type IVector_ICastingSource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ICastingSource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ICastingSource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ICastingSource_Interface
      ; RetVal : access Windows.Media.Casting.IVectorView_ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ICastingSource_Interface
      ; value : Windows.Media.Casting.ICastingSource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ICastingSource_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ICastingSource_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ICastingSource_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ICastingSource_Interface
      ; value : Windows.Media.Casting.ICastingSource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ICastingSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ICastingSource_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ICastingSource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Casting.ICastingSource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ICastingSource_Interface
      ; items : Windows.Media.Casting.ICastingSource_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICastingConnection_add_StateChanged : aliased constant Windows.IID := (4049035632, 39688, 23195, (135, 210, 193, 172, 71, 188, 102, 129 ));
   
   type TypedEventHandler_ICastingConnection_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Media.Casting.ICastingConnection ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICastingConnection_add_StateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICastingConnection_add_StateChanged_Interface
      ; sender : Windows.Media.Casting.ICastingConnection
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICastingConnection_add_ErrorOccurred : aliased constant Windows.IID := (2024782800, 38929, 24334, (149, 102, 71, 195, 232, 205, 217, 41 ));
   
   type TypedEventHandler_ICastingConnection_add_ErrorOccurred_Interface(Callback : access procedure (sender : Windows.Media.Casting.ICastingConnection ; args : Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICastingConnection_add_ErrorOccurred'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICastingConnection_add_ErrorOccurred_Interface
      ; sender : Windows.Media.Casting.ICastingConnection
      ; args : Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_CastingConnectionErrorStatus : aliased constant Windows.IID := (1914087754, 41226, 22371, (142, 150, 191, 51, 197, 130, 237, 146 ));
   
   type AsyncOperationCompletedHandler_CastingConnectionErrorStatus_Interface(Callback : access procedure (asyncInfo : Windows.Media.Casting.IAsyncOperation_CastingConnectionErrorStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_CastingConnectionErrorStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_CastingConnectionErrorStatus_Interface
      ; asyncInfo : Windows.Media.Casting.IAsyncOperation_CastingConnectionErrorStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_CastingPlaybackTypes : aliased constant Windows.IID := (3042858252, 57256, 20670, (190, 143, 93, 66, 201, 218, 193, 32 ));
   
   type AsyncOperationCompletedHandler_CastingPlaybackTypes_Interface(Callback : access procedure (asyncInfo : Windows.Media.Casting.IAsyncOperation_CastingPlaybackTypes ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_CastingPlaybackTypes'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_CastingPlaybackTypes_Interface
      ; asyncInfo : Windows.Media.Casting.IAsyncOperation_CastingPlaybackTypes
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICastingDevice : aliased constant Windows.IID := (4039547806, 5323, 20746, (142, 240, 126, 134, 215, 113, 186, 175 ));
   
   type AsyncOperationCompletedHandler_ICastingDevice_Interface(Callback : access procedure (asyncInfo : Windows.Media.Casting.IAsyncOperation_ICastingDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICastingDevice'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICastingDevice_Interface
      ; asyncInfo : Windows.Media.Casting.IAsyncOperation_ICastingDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected : aliased constant Windows.IID := (3009764147, 50349, 24396, (161, 135, 178, 228, 199, 112, 161, 107 ));
   
   type TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected_Interface(Callback : access procedure (sender : Windows.Media.Casting.ICastingDevicePicker ; args : Windows.Media.Casting.ICastingDeviceSelectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICastingDevicePicker_add_CastingDeviceSelected_Interface
      ; sender : Windows.Media.Casting.ICastingDevicePicker
      ; args : Windows.Media.Casting.ICastingDeviceSelectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed : aliased constant Windows.IID := (2789971755, 43619, 23649, (156, 222, 205, 111, 254, 168, 162, 71 ));
   
   type TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed_Interface(Callback : access procedure (sender : Windows.Media.Casting.ICastingDevicePicker ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICastingDevicePicker_add_CastingDevicePickerDismissed_Interface
      ; sender : Windows.Media.Casting.ICastingDevicePicker
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CastingSource is Windows.Media.Casting.ICastingSource;
   subtype CastingConnectionErrorOccurredEventArgs is Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs;
   subtype CastingDevice is Windows.Media.Casting.ICastingDevice;
   subtype CastingConnection is Windows.Media.Casting.ICastingConnection;
   subtype CastingDeviceSelectedEventArgs is Windows.Media.Casting.ICastingDeviceSelectedEventArgs;
   subtype CastingDevicePickerFilter is Windows.Media.Casting.ICastingDevicePickerFilter;
   subtype CastingDevicePicker is Windows.Media.Casting.ICastingDevicePicker;
   function CreateCastingDevicePicker return Windows.Media.Casting.ICastingDevicePicker;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   (
      type_x : Windows.Media.Casting.CastingPlaybackTypes
   )
   return Windows.String;
   
   function GetDeviceSelectorFromCastingSourceAsync
   (
      castingSource : Windows.Media.Casting.ICastingSource
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function FromIdAsync
   (
      value : Windows.String
   )
   return Windows.Media.Casting.IAsyncOperation_ICastingDevice;
   
   function DeviceInfoSupportsCastingAsync
   (
      device : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
end;
