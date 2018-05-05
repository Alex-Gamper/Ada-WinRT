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
with Windows.Graphics.Imaging;
with Windows.Media;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.FaceAnalysis is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IFaceDetector_Interface
      ; asyncInfo : Windows.Media.FaceAnalysis.IAsyncOperation_IFaceDetector
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
      This       : access AsyncOperationCompletedHandler_IFaceTracker_Interface
      ; asyncInfo : Windows.Media.FaceAnalysis.IAsyncOperation_IFaceTracker
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
   
   function CreateAsync
   return Windows.Media.FaceAnalysis.IAsyncOperation_IFaceTracker is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.FaceAnalysis.FaceTracker");
      m_Factory     : IFaceTrackerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.FaceAnalysis.IAsyncOperation_IFaceTracker;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFaceTrackerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSupportedBitmapPixelFormats
   return Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.FaceAnalysis.FaceTracker");
      m_Factory     : IFaceTrackerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFaceTrackerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSupportedBitmapPixelFormats(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsBitmapPixelFormatSupported
   (
      bitmapPixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.FaceAnalysis.FaceTracker");
      m_Factory     : IFaceTrackerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFaceTrackerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsBitmapPixelFormatSupported(bitmapPixelFormat, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.FaceAnalysis.FaceTracker");
      m_Factory     : IFaceTrackerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFaceTrackerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAsync
   return Windows.Media.FaceAnalysis.IAsyncOperation_IFaceDetector is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.FaceAnalysis.FaceDetector");
      m_Factory     : IFaceDetectorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.FaceAnalysis.IAsyncOperation_IFaceDetector;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFaceDetectorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSupportedBitmapPixelFormats_IFaceDetector
   return Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.FaceAnalysis.FaceDetector");
      m_Factory     : IFaceDetectorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFaceDetectorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSupportedBitmapPixelFormats(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsBitmapPixelFormatSupported_IFaceDetector
   (
      bitmapPixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.FaceAnalysis.FaceDetector");
      m_Factory     : IFaceDetectorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFaceDetectorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsBitmapPixelFormatSupported(bitmapPixelFormat, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsSupported_IFaceDetector
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.FaceAnalysis.FaceDetector");
      m_Factory     : IFaceDetectorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFaceDetectorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
