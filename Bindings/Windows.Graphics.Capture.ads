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
limited with Windows.Graphics.DirectX.Direct3D11;
with Windows.Foundation;
limited with Windows.Graphics.DirectX;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.Graphics.Capture is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IGraphicsCaptureItem_add_Closed_Interface;
   type TypedEventHandler_IGraphicsCaptureItem_add_Closed is access all TypedEventHandler_IGraphicsCaptureItem_add_Closed_Interface'Class;
   type TypedEventHandler_IGraphicsCaptureItem_add_Closed_Ptr is access all TypedEventHandler_IGraphicsCaptureItem_add_Closed;
   type AsyncOperationCompletedHandler_IGraphicsCaptureItem_Interface;
   type AsyncOperationCompletedHandler_IGraphicsCaptureItem is access all AsyncOperationCompletedHandler_IGraphicsCaptureItem_Interface'Class;
   type AsyncOperationCompletedHandler_IGraphicsCaptureItem_Ptr is access all AsyncOperationCompletedHandler_IGraphicsCaptureItem;
   type TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived_Interface;
   type TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived is access all TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived_Interface'Class;
   type TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived_Ptr is access all TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDirect3D11CaptureFrame_Interface;
   type IDirect3D11CaptureFrame is access all IDirect3D11CaptureFrame_Interface'Class;
   type IDirect3D11CaptureFrame_Ptr is access all IDirect3D11CaptureFrame;
   type IGraphicsCaptureItem_Interface;
   type IGraphicsCaptureItem is access all IGraphicsCaptureItem_Interface'Class;
   type IGraphicsCaptureItem_Ptr is access all IGraphicsCaptureItem;
   type IGraphicsCapturePicker_Interface;
   type IGraphicsCapturePicker is access all IGraphicsCapturePicker_Interface'Class;
   type IGraphicsCapturePicker_Ptr is access all IGraphicsCapturePicker;
   type IGraphicsCaptureSession_Interface;
   type IGraphicsCaptureSession is access all IGraphicsCaptureSession_Interface'Class;
   type IGraphicsCaptureSession_Ptr is access all IGraphicsCaptureSession;
   type IGraphicsCaptureSessionStatics_Interface;
   type IGraphicsCaptureSessionStatics is access all IGraphicsCaptureSessionStatics_Interface'Class;
   type IGraphicsCaptureSessionStatics_Ptr is access all IGraphicsCaptureSessionStatics;
   type IDirect3D11CaptureFramePool_Interface;
   type IDirect3D11CaptureFramePool is access all IDirect3D11CaptureFramePool_Interface'Class;
   type IDirect3D11CaptureFramePool_Ptr is access all IDirect3D11CaptureFramePool;
   type IDirect3D11CaptureFramePoolStatics_Interface;
   type IDirect3D11CaptureFramePoolStatics is access all IDirect3D11CaptureFramePoolStatics_Interface'Class;
   type IDirect3D11CaptureFramePoolStatics_Ptr is access all IDirect3D11CaptureFramePoolStatics;
   type IAsyncOperation_IGraphicsCaptureItem_Interface;
   type IAsyncOperation_IGraphicsCaptureItem is access all IAsyncOperation_IGraphicsCaptureItem_Interface'Class;
   type IAsyncOperation_IGraphicsCaptureItem_Ptr is access all IAsyncOperation_IGraphicsCaptureItem;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDirect3D11CaptureFrame : aliased constant Windows.IID := (4199597603, 14554, 19250, (172, 243, 250, 151, 52, 173, 128, 14 ));
   
   type IDirect3D11CaptureFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Surface
   (
      This       : access IDirect3D11CaptureFrame_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemRelativeTime
   (
      This       : access IDirect3D11CaptureFrame_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentSize
   (
      This       : access IDirect3D11CaptureFrame_Interface
      ; RetVal : access Windows.Graphics.SizeInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGraphicsCaptureItem : aliased constant Windows.IID := (2042886491, 12791, 20162, (164, 100, 99, 46, 245, 211, 7, 96 ));
   
   type IGraphicsCaptureItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IGraphicsCaptureItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IGraphicsCaptureItem_Interface
      ; RetVal : access Windows.Graphics.SizeInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_Closed
   (
      This       : access IGraphicsCaptureItem_Interface
      ; handler : TypedEventHandler_IGraphicsCaptureItem_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IGraphicsCaptureItem_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGraphicsCapturePicker : aliased constant Windows.IID := (1511461299, 44409, 19274, (147, 54, 19, 24, 253, 222, 53, 57 ));
   
   type IGraphicsCapturePicker_Interface is interface and Windows.IInspectable_Interface;
   
   function PickSingleItemAsync
   (
      This       : access IGraphicsCapturePicker_Interface
      ; RetVal : access Windows.Graphics.Capture.IAsyncOperation_IGraphicsCaptureItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGraphicsCaptureSession : aliased constant Windows.IID := (2169389737, 63247, 19159, (147, 155, 253, 220, 198, 235, 136, 13 ));
   
   type IGraphicsCaptureSession_Interface is interface and Windows.IInspectable_Interface;
   
   function StartCapture
   (
      This       : access IGraphicsCaptureSession_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGraphicsCaptureSessionStatics : aliased constant Windows.IID := (572826944, 22900, 18858, (178, 50, 8, 130, 83, 111, 76, 181 ));
   
   type IGraphicsCaptureSessionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access IGraphicsCaptureSessionStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDirect3D11CaptureFramePool : aliased constant Windows.IID := (619408674, 6517, 16942, (130, 231, 120, 13, 189, 141, 223, 36 ));
   
   type IDirect3D11CaptureFramePool_Interface is interface and Windows.IInspectable_Interface;
   
   function Recreate
   (
      This       : access IDirect3D11CaptureFramePool_Interface
      ; device : Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
      ; numberOfBuffers : Windows.Int32
      ; size : Windows.Graphics.SizeInt32
   )
   return Windows.HRESULT is abstract;
   
   function TryGetNextFrame
   (
      This       : access IDirect3D11CaptureFramePool_Interface
      ; RetVal : access Windows.Graphics.Capture.IDirect3D11CaptureFrame
   )
   return Windows.HRESULT is abstract;
   
   function add_FrameArrived
   (
      This       : access IDirect3D11CaptureFramePool_Interface
      ; handler : TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameArrived
   (
      This       : access IDirect3D11CaptureFramePool_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateCaptureSession
   (
      This       : access IDirect3D11CaptureFramePool_Interface
      ; item : Windows.Graphics.Capture.IGraphicsCaptureItem
      ; RetVal : access Windows.Graphics.Capture.IGraphicsCaptureSession
   )
   return Windows.HRESULT is abstract;
   
   function get_DispatcherQueue
   (
      This       : access IDirect3D11CaptureFramePool_Interface
      ; RetVal : access Windows.System.IDispatcherQueue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDirect3D11CaptureFramePoolStatics : aliased constant Windows.IID := (2005140842, 26538, 19795, (174, 84, 16, 136, 213, 168, 202, 33 ));
   
   type IDirect3D11CaptureFramePoolStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IDirect3D11CaptureFramePoolStatics_Interface
      ; device : Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
      ; numberOfBuffers : Windows.Int32
      ; size : Windows.Graphics.SizeInt32
      ; RetVal : access Windows.Graphics.Capture.IDirect3D11CaptureFramePool
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGraphicsCaptureItem : aliased constant Windows.IID := (30208686, 4185, 23895, (168, 5, 10, 29, 252, 84, 202, 185 ));
   
   type IAsyncOperation_IGraphicsCaptureItem_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGraphicsCaptureItem_Interface
      ; handler : Windows.Graphics.Capture.AsyncOperationCompletedHandler_IGraphicsCaptureItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGraphicsCaptureItem_Interface
      ; RetVal : access Windows.Graphics.Capture.AsyncOperationCompletedHandler_IGraphicsCaptureItem
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGraphicsCaptureItem_Interface
      ; RetVal : access Windows.Graphics.Capture.IGraphicsCaptureItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGraphicsCaptureItem_add_Closed : aliased constant Windows.IID := (3922071744, 42636, 23513, (128, 33, 133, 137, 52, 110, 238, 226 ));
   
   type TypedEventHandler_IGraphicsCaptureItem_add_Closed_Interface(Callback : access procedure (sender : Windows.Graphics.Capture.IGraphicsCaptureItem ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGraphicsCaptureItem_add_Closed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGraphicsCaptureItem_add_Closed_Interface
      ; sender : Windows.Graphics.Capture.IGraphicsCaptureItem
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGraphicsCaptureItem : aliased constant Windows.IID := (1124092476, 65511, 21330, (133, 166, 123, 196, 27, 120, 47, 202 ));
   
   type AsyncOperationCompletedHandler_IGraphicsCaptureItem_Interface(Callback : access procedure (asyncInfo : Windows.Graphics.Capture.IAsyncOperation_IGraphicsCaptureItem ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGraphicsCaptureItem'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGraphicsCaptureItem_Interface
      ; asyncInfo : Windows.Graphics.Capture.IAsyncOperation_IGraphicsCaptureItem
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived : aliased constant Windows.IID := (1370048503, 31183, 23102, (163, 165, 18, 137, 207, 166, 223, 232 ));
   
   type TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived_Interface(Callback : access procedure (sender : Windows.Graphics.Capture.IDirect3D11CaptureFramePool ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDirect3D11CaptureFramePool_add_FrameArrived_Interface
      ; sender : Windows.Graphics.Capture.IDirect3D11CaptureFramePool
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GraphicsCaptureItem is Windows.Graphics.Capture.IGraphicsCaptureItem;
   subtype Direct3D11CaptureFrame is Windows.Graphics.Capture.IDirect3D11CaptureFrame;
   subtype Direct3D11CaptureFramePool is Windows.Graphics.Capture.IDirect3D11CaptureFramePool;
   subtype GraphicsCaptureSession is Windows.Graphics.Capture.IGraphicsCaptureSession;
   subtype GraphicsCapturePicker is Windows.Graphics.Capture.IGraphicsCapturePicker;
   function Create return Windows.Graphics.Capture.IGraphicsCapturePicker;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function Create
   (
      device : Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
      ; numberOfBuffers : Windows.Int32
      ; size : Windows.Graphics.SizeInt32
   )
   return Windows.Graphics.Capture.IDirect3D11CaptureFramePool;
   
   function IsSupported
   return Windows.Boolean;
   
end;