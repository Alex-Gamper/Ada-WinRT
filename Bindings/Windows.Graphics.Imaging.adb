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
with Windows.Graphics.DirectX.Direct3D11;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Imaging is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMap_String_BitmapTypedValue_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IMap_String_BitmapTypedValue
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
      This       : access AsyncOperationCompletedHandler_IPixelDataProvider_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IPixelDataProvider
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
      This       : access AsyncOperationCompletedHandler_ISoftwareBitmap_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap
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
      This       : access AsyncOperationCompletedHandler_IBitmapDecoder_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder
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
      This       : access AsyncOperationCompletedHandler_IBitmapFrame_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapFrame
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
      This       : access AsyncOperationCompletedHandler_IBitmapEncoder_Interface
      ; asyncInfo : Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder
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
   
   function CreateBitmapTransform return Windows.Graphics.Imaging.IBitmapTransform is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapTransform");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Imaging.IBitmapTransform) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Imaging.IID_IBitmapTransform'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      value : Windows.Object
      ; type_x : Windows.Foundation.PropertyType
   )
   return Windows.Graphics.Imaging.IBitmapTypedValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapTypedValue");
      m_Factory     : Windows.Graphics.Imaging.IBitmapTypedValueFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IBitmapTypedValue := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapTypedValueFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(value, type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBitmapPropertySet return Windows.Graphics.Imaging.IMap_String_BitmapTypedValue is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapPropertySet");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Imaging.IMap_String_BitmapTypedValue) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Imaging.IID_IMap_String_BitmapTypedValue'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : Windows.Graphics.Imaging.ISoftwareBitmapFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.ISoftwareBitmap := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(format, width, height, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAlpha
   (
      format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : Windows.Graphics.Imaging.ISoftwareBitmapFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.ISoftwareBitmap := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAlpha(format, width, height, alpha, RetVal'Access);
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
   
   function get_BmpDecoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BmpDecoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JpegDecoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JpegDecoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PngDecoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PngDecoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TiffDecoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TiffDecoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GifDecoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GifDecoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JpegXRDecoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JpegXRDecoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IcoDecoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IcoDecoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDecoderInformationEnumerator
   return Windows.Graphics.Imaging.IVectorView_IBitmapCodecInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IVectorView_IBitmapCodecInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDecoderInformationEnumerator(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAsync
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(stream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithIdAsync
   (
      decoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapDecoder");
      m_Factory     : IBitmapDecoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IAsyncOperation_IBitmapDecoder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapDecoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithIdAsync(decoderId, stream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BmpEncoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BmpEncoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JpegEncoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JpegEncoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PngEncoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PngEncoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TiffEncoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TiffEncoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GifEncoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GifEncoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JpegXREncoderId
   return Windows.Guid is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Guid;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JpegXREncoderId(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetEncoderInformationEnumerator
   return Windows.Graphics.Imaging.IVectorView_IBitmapCodecInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IVectorView_IBitmapCodecInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEncoderInformationEnumerator(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAsync
   (
      encoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(encoderId, stream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithEncodingOptionsAsync
   (
      encoderId : Windows.Guid
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; encodingOptions : Windows.Address
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithEncodingOptionsAsync(encoderId, stream, encodingOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateForTranscodingAsync
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
      ; bitmapDecoder : Windows.Graphics.Imaging.IBitmapDecoder
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForTranscodingAsync(stream, bitmapDecoder, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateForInPlacePropertyEncodingAsync
   (
      bitmapDecoder : Windows.Graphics.Imaging.IBitmapDecoder
   )
   return Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.BitmapEncoder");
      m_Factory     : IBitmapEncoderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IAsyncOperation_IBitmapEncoder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBitmapEncoderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForInPlacePropertyEncodingAsync(bitmapDecoder, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Copy
   (
      source : Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : ISoftwareBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.ISoftwareBitmap;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Copy(source, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Convert
   (
      source : Windows.Graphics.Imaging.ISoftwareBitmap
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : ISoftwareBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.ISoftwareBitmap;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Convert(source, format, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConvertWithAlpha
   (
      source : Windows.Graphics.Imaging.ISoftwareBitmap
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : ISoftwareBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.ISoftwareBitmap;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertWithAlpha(source, format, alpha, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCopyFromBuffer
   (
      source : Windows.Storage.Streams.IBuffer
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : ISoftwareBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.ISoftwareBitmap;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCopyFromBuffer(source, format, width, height, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCopyWithAlphaFromBuffer
   (
      source : Windows.Storage.Streams.IBuffer
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Graphics.Imaging.ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : ISoftwareBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.ISoftwareBitmap;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCopyWithAlphaFromBuffer(source, format, width, height, alpha, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCopyFromSurfaceAsync
   (
      surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : ISoftwareBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCopyFromSurfaceAsync(surface, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCopyWithAlphaFromSurfaceAsync
   (
      surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Imaging.SoftwareBitmap");
      m_Factory     : ISoftwareBitmapStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Imaging.IAsyncOperation_ISoftwareBitmap;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISoftwareBitmapStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCopyWithAlphaFromSurfaceAsync(surface, alpha, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
