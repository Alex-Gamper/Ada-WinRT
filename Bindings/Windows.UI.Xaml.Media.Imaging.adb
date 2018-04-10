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
with Windows.Storage.Streams;
with Windows.UI.Xaml;
with Windows.ApplicationModel.Background;
with Windows.Graphics.Imaging;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Media.Imaging is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access DownloadProgressEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Media.Imaging.IDownloadProgressEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Media.Imaging.IDownloadProgressEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISvgImageSource_add_Opened_Interface
      ; sender : Windows.UI.Xaml.Media.Imaging.ISvgImageSource
      ; args : Windows.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Media.Imaging.ISvgImageSource(sender), Windows.UI.Xaml.Media.Imaging.ISvgImageSourceOpenedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISvgImageSource_add_OpenFailed_Interface
      ; sender : Windows.UI.Xaml.Media.Imaging.ISvgImageSource
      ; args : Windows.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Media.Imaging.ISvgImageSource(sender), Windows.UI.Xaml.Media.Imaging.ISvgImageSourceFailedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SvgImageSourceLoadStatus_Interface
      ; asyncInfo : Windows.UI.Xaml.Media.Imaging.IAsyncOperation_SvgImageSourceLoadStatus
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
   
   function CreateRenderTargetBitmap return Windows.UI.Xaml.Media.Imaging.IRenderTargetBitmap is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.RenderTargetBitmap");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.Media.Imaging.IRenderTargetBitmap) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Imaging.IID_IRenderTargetBitmap'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstanceWithUriSource
   (
      uriSource : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.UI.Xaml.Media.Imaging.IBitmapImage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : Windows.UI.Xaml.Media.Imaging.IBitmapImageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.IBitmapImage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithUriSource(uriSource, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDimensions
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
   )
   return Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.VirtualSurfaceImageSource");
      m_Factory     : Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVirtualSurfaceImageSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDimensions(pixelWidth, pixelHeight, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDimensionsAndOpacity
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; isOpaque : Windows.Boolean
   )
   return Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.VirtualSurfaceImageSource");
      m_Factory     : Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.IVirtualSurfaceImageSource := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVirtualSurfaceImageSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDimensions
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
   )
   return Windows.UI.Xaml.Media.Imaging.IWriteableBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.WriteableBitmap");
      m_Factory     : Windows.UI.Xaml.Media.Imaging.IWriteableBitmapFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.IWriteableBitmap := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWriteableBitmapFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDimensions(pixelWidth, pixelHeight, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSoftwareBitmapSource return Windows.UI.Xaml.Media.Imaging.ISoftwareBitmapSource is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.SoftwareBitmapSource");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.Media.Imaging.ISoftwareBitmapSource) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Imaging.IID_ISoftwareBitmapSource'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IBitmapSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IBitmapSource or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IBitmapSource_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IBitmapSource_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IBitmapSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IBitmapSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.IBitmapSource");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IBitmapSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_PixelWidth
   (
      This       : access IBitmapSource_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_PixelHeight
   (
      This       : access IBitmapSource_Interface_Impl
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetSource
   (
      This       : access IBitmapSource_Interface_Impl
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetSourceAsync
   (
      This       : access IBitmapSource_Interface_Impl
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IXamlRenderingBackgroundTask , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IXamlRenderingBackgroundTaskOverrides or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IXamlRenderingBackgroundTask then
               pvObject.all := Convert(This.m_IXamlRenderingBackgroundTask);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTaskOverrides");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function OnRun
   (
      This       : access IXamlRenderingBackgroundTaskOverrides_Interface_Impl
      ; taskInstance : Windows.ApplicationModel.Background.IBackgroundTaskInstance
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IXamlRenderingBackgroundTask or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IXamlRenderingBackgroundTask_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access ISvgImageSource_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_ISvgImageSource or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access ISvgImageSource_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access ISvgImageSource_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access ISvgImageSource_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access ISvgImageSource_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.ISvgImageSource");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access ISvgImageSource_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_UriSource
   (
      This       : access ISvgImageSource_Interface_Impl
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_UriSource
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_RasterizePixelWidth
   (
      This       : access ISvgImageSource_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_RasterizePixelWidth
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_RasterizePixelHeight
   (
      This       : access ISvgImageSource_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_RasterizePixelHeight
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Opened
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : TypedEventHandler_ISvgImageSource_add_Opened
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Opened
   (
      This       : access ISvgImageSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_OpenFailed
   (
      This       : access ISvgImageSource_Interface_Impl
      ; value : TypedEventHandler_ISvgImageSource_add_OpenFailed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_OpenFailed
   (
      This       : access ISvgImageSource_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetSourceAsync
   (
      This       : access ISvgImageSource_Interface_Impl
      ; streamSource : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.UI.Xaml.Media.Imaging.IAsyncOperation_SvgImageSourceLoadStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function get_PixelWidthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapSource");
      m_Factory     : IBitmapSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PixelWidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PixelHeightProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapSource");
      m_Factory     : IBitmapSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PixelHeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.IBitmapSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapSource");
      m_Factory     : IBitmapSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.IBitmapSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PixelWidthProperty_IRenderTargetBitmap
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.RenderTargetBitmap");
      m_Factory     : IRenderTargetBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRenderTargetBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PixelWidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PixelHeightProperty_IRenderTargetBitmap
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.RenderTargetBitmap");
      m_Factory     : IRenderTargetBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRenderTargetBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PixelHeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDimensions
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.SurfaceImageSource");
      m_Factory     : ISurfaceImageSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISurfaceImageSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDimensions(pixelWidth, pixelHeight, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDimensionsAndOpacity
   (
      pixelWidth : Windows.Int32
      ; pixelHeight : Windows.Int32
      ; isOpaque : Windows.Boolean
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.SurfaceImageSource");
      m_Factory     : ISurfaceImageSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.ISurfaceImageSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISurfaceImageSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsAnimatedBitmapProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : IBitmapImageStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsAnimatedBitmapProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsPlayingProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : IBitmapImageStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsPlayingProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AutoPlayProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : IBitmapImageStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutoPlayProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CreateOptionsProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : IBitmapImageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CreateOptionsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UriSourceProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : IBitmapImageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UriSourceProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DecodePixelWidthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : IBitmapImageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DecodePixelWidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DecodePixelHeightProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : IBitmapImageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DecodePixelHeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DecodePixelTypeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.BitmapImage");
      m_Factory     : IBitmapImageStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapImageStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DecodePixelTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.XamlRenderingBackgroundTask");
      m_Factory     : IXamlRenderingBackgroundTaskFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.IXamlRenderingBackgroundTask;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlRenderingBackgroundTaskFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UriSourceProperty_ISvgImageSource
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.SvgImageSource");
      m_Factory     : ISvgImageSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISvgImageSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UriSourceProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RasterizePixelWidthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.SvgImageSource");
      m_Factory     : ISvgImageSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISvgImageSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RasterizePixelWidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RasterizePixelHeightProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.SvgImageSource");
      m_Factory     : ISvgImageSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISvgImageSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RasterizePixelHeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.ISvgImageSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.SvgImageSource");
      m_Factory     : ISvgImageSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.ISvgImageSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISvgImageSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithUriSource
   (
      uriSource : Windows.Foundation.IUriRuntimeClass
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Imaging.ISvgImageSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Imaging.SvgImageSource");
      m_Factory     : ISvgImageSourceFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Imaging.ISvgImageSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISvgImageSourceFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithUriSource(uriSource, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
