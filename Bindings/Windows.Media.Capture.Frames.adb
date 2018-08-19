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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Media.Capture;
with Windows.Devices.Enumeration;
with Windows.Perception.Spatial;
with Windows.Media.Devices.Core;
with Windows.Media.Devices;
with Windows.Media.MediaProperties;
with Windows.Storage.Streams;
with Windows.Graphics.Imaging;
with Windows.Graphics.DirectX.Direct3D11;
with Windows.Media;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Capture.Frames is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaFrameReader_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameReader
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
      This       : access AsyncOperationCompletedHandler_IMultiSourceMediaFrameReader_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMultiSourceMediaFrameReader
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
      This       : access AsyncOperationCompletedHandler_IMediaFrameSourceGroup_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGroup
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
      This       : access TypedEventHandler_IMediaFrameSource_add_FormatChanged_Interface
      ; sender : Windows.Media.Capture.Frames.IMediaFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.Frames.IMediaFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Media.Capture.Frames.IMediaFrameReader
      ; args : Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.Frames.IMediaFrameReader(sender), Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MediaFrameReaderStartStatus_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameReaderStartStatus
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
      This       : access TypedEventHandler_IMultiSourceMediaFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader
      ; args : Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader(sender), Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MultiSourceMediaFrameReaderStartStatus_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MultiSourceMediaFrameReaderStartStatus
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
      This       : access AsyncOperationCompletedHandler_IMediaFrameSourceGetPropertyResult_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGetPropertyResult
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
      This       : access AsyncOperationCompletedHandler_MediaFrameSourceSetPropertyStatus_Interface
      ; asyncInfo : Windows.Media.Capture.Frames.IAsyncOperation_MediaFrameSourceSetPropertyStatus
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
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function FindAllAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.Frames.MediaFrameSourceGroup");
      m_Factory     : IMediaFrameSourceGroupStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaFrameSourceGroupStatics'Access , m_Factory'Address);
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
   return Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.Frames.MediaFrameSourceGroup");
      m_Factory     : IMediaFrameSourceGroupStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameSourceGroup;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaFrameSourceGroupStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Capture.Frames.MediaFrameSourceGroup");
      m_Factory     : IMediaFrameSourceGroupStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaFrameSourceGroupStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
