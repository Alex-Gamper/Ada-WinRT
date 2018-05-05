--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
with Windows.Devices.Enumeration;
with Windows.Media.Devices.Core;
with Windows.Graphics.Imaging;
with Windows.Media;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Perception is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionControlSession_add_ControlLost_Interface
      ; sender : Windows.Devices.Perception.IPerceptionControlSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionControlSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult
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
      This       : access AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionInfraredFrameSource
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
      This       : access AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus
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
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthFrameSource
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
      This       : access AsyncOperationCompletedHandler_IPerceptionColorFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionColorFrameSource
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
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics
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
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper
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
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameReader
      ; args : Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameReader(sender), Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameReader
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameReader(sender), Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameReader
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameReader(sender), Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateWatcher
   return Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionColorFrameSource");
      m_Factory     : IPerceptionColorFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionColorFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionColorFrameSource");
      m_Factory     : IPerceptionColorFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionColorFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      id : Windows.String
   )
   return Windows.Devices.Perception.IAsyncOperation_IPerceptionColorFrameSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionColorFrameSource");
      m_Factory     : IPerceptionColorFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IAsyncOperation_IPerceptionColorFrameSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionColorFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync
   return Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionColorFrameSource");
      m_Factory     : IPerceptionColorFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionColorFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionDepthFrameSource");
      m_Factory     : IPerceptionDepthFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionDepthFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync_IPerceptionDepthFrameSource
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionDepthFrameSource");
      m_Factory     : IPerceptionDepthFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionDepthFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      id : Windows.String
   )
   return Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthFrameSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionDepthFrameSource");
      m_Factory     : IPerceptionDepthFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthFrameSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionDepthFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync_IPerceptionDepthFrameSource
   return Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionDepthFrameSource");
      m_Factory     : IPerceptionDepthFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionDepthFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionInfraredFrameSource");
      m_Factory     : IPerceptionInfraredFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionInfraredFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync_IPerceptionInfraredFrameSource
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionInfraredFrameSource");
      m_Factory     : IPerceptionInfraredFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionInfraredFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      id : Windows.String
   )
   return Windows.Devices.Perception.IAsyncOperation_IPerceptionInfraredFrameSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionInfraredFrameSource");
      m_Factory     : IPerceptionInfraredFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IAsyncOperation_IPerceptionInfraredFrameSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionInfraredFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync_IPerceptionInfraredFrameSource
   return Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.PerceptionInfraredFrameSource");
      m_Factory     : IPerceptionInfraredFrameSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPerceptionInfraredFrameSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Id
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties");
      m_Factory     : IKnownPerceptionFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Id(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PhysicalDeviceIds
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties");
      m_Factory     : IKnownPerceptionFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PhysicalDeviceIds(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FrameKind
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties");
      m_Factory     : IKnownPerceptionFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FrameKind(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DeviceModelVersion
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties");
      m_Factory     : IKnownPerceptionFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeviceModelVersion(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EnclosureLocation
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties");
      m_Factory     : IKnownPerceptionFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EnclosureLocation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DeviceId
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties");
      m_Factory     : IKnownPerceptionFrameSourcePropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionFrameSourcePropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeviceId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideoProfile
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties");
      m_Factory     : IKnownPerceptionVideoFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideoProfile(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedVideoProfiles
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties");
      m_Factory     : IKnownPerceptionVideoFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedVideoProfiles(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AvailableVideoProfiles
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties");
      m_Factory     : IKnownPerceptionVideoFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AvailableVideoProfiles(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsMirrored
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties");
      m_Factory     : IKnownPerceptionVideoFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsMirrored(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CameraIntrinsics
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties");
      m_Factory     : IKnownPerceptionVideoFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CameraIntrinsics(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Exposure
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties");
      m_Factory     : IKnownPerceptionInfraredFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionInfraredFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Exposure(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AutoExposureEnabled
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties");
      m_Factory     : IKnownPerceptionInfraredFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionInfraredFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutoExposureEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExposureCompensation
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties");
      m_Factory     : IKnownPerceptionInfraredFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionInfraredFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExposureCompensation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ActiveIlluminationEnabled
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties");
      m_Factory     : IKnownPerceptionInfraredFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionInfraredFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ActiveIlluminationEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AmbientSubtractionEnabled
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties");
      m_Factory     : IKnownPerceptionInfraredFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionInfraredFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AmbientSubtractionEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StructureLightPatternEnabled
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties");
      m_Factory     : IKnownPerceptionInfraredFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionInfraredFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StructureLightPatternEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InterleavedIlluminationEnabled
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties");
      m_Factory     : IKnownPerceptionInfraredFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionInfraredFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InterleavedIlluminationEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinDepth
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionDepthFrameSourceProperties");
      m_Factory     : IKnownPerceptionDepthFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionDepthFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinDepth(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxDepth
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionDepthFrameSourceProperties");
      m_Factory     : IKnownPerceptionDepthFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionDepthFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxDepth(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Exposure_KnownPerceptionColorFrameSourceProperties
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionColorFrameSourceProperties");
      m_Factory     : IKnownPerceptionColorFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionColorFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Exposure(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AutoExposureEnabled_KnownPerceptionColorFrameSourceProperties
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionColorFrameSourceProperties");
      m_Factory     : IKnownPerceptionColorFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionColorFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutoExposureEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExposureCompensation_KnownPerceptionColorFrameSourceProperties
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionColorFrameSourceProperties");
      m_Factory     : IKnownPerceptionColorFrameSourcePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionColorFrameSourcePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExposureCompensation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BitmapPixelFormat
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties");
      m_Factory     : IKnownPerceptionVideoProfilePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoProfilePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BitmapPixelFormat(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BitmapAlphaMode
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties");
      m_Factory     : IKnownPerceptionVideoProfilePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoProfilePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BitmapAlphaMode(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Width
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties");
      m_Factory     : IKnownPerceptionVideoProfilePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoProfilePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Width(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Height
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties");
      m_Factory     : IKnownPerceptionVideoProfilePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoProfilePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Height(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FrameDuration
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownPerceptionVideoProfileProperties");
      m_Factory     : IKnownPerceptionVideoProfilePropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownPerceptionVideoProfilePropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FrameDuration(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FocalLength
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownCameraIntrinsicsProperties");
      m_Factory     : IKnownCameraIntrinsicsPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownCameraIntrinsicsPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FocalLength(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PrincipalPoint
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownCameraIntrinsicsProperties");
      m_Factory     : IKnownCameraIntrinsicsPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownCameraIntrinsicsPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PrincipalPoint(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RadialDistortion
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownCameraIntrinsicsProperties");
      m_Factory     : IKnownCameraIntrinsicsPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownCameraIntrinsicsPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RadialDistortion(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TangentialDistortion
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Perception.KnownCameraIntrinsicsProperties");
      m_Factory     : IKnownCameraIntrinsicsPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownCameraIntrinsicsPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TangentialDistortion(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
