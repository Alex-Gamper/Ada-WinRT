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
with Windows.Foundation.Collections;
with Windows.Foundation;
package Windows.Graphics.Display.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HdmiDisplayColorSpace is (
      RgbLimited,
      RgbFull,
      BT2020,
      BT709
   );
   for HdmiDisplayColorSpace use (
      RgbLimited => 0,
      RgbFull => 1,
      BT2020 => 2,
      BT709 => 3
   );
   for HdmiDisplayColorSpace'Size use 32;
   
   type HdmiDisplayColorSpace_Ptr is access HdmiDisplayColorSpace;
   
   type HdmiDisplayPixelEncoding is (
      Rgb444,
      Ycc444,
      Ycc422,
      Ycc420
   );
   for HdmiDisplayPixelEncoding use (
      Rgb444 => 0,
      Ycc444 => 1,
      Ycc422 => 2,
      Ycc420 => 3
   );
   for HdmiDisplayPixelEncoding'Size use 32;
   
   type HdmiDisplayPixelEncoding_Ptr is access HdmiDisplayPixelEncoding;
   
   type HdmiDisplayHdrOption is (
      None,
      EotfSdr,
      Eotf2084
   );
   for HdmiDisplayHdrOption use (
      None => 0,
      EotfSdr => 1,
      Eotf2084 => 2
   );
   for HdmiDisplayHdrOption'Size use 32;
   
   type HdmiDisplayHdrOption_Ptr is access HdmiDisplayHdrOption;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type HdmiDisplayHdr2086Metadata is record
      RedPrimaryX : Windows.UInt16;
      RedPrimaryY : Windows.UInt16;
      GreenPrimaryX : Windows.UInt16;
      GreenPrimaryY : Windows.UInt16;
      BluePrimaryX : Windows.UInt16;
      BluePrimaryY : Windows.UInt16;
      WhitePointX : Windows.UInt16;
      WhitePointY : Windows.UInt16;
      MaxMasteringLuminance : Windows.UInt16;
      MinMasteringLuminance : Windows.UInt16;
      MaxContentLightLevel : Windows.UInt16;
      MaxFrameAverageLightLevel : Windows.UInt16;
   end record;
   pragma Convention (C_Pass_By_Copy , HdmiDisplayHdr2086Metadata);
   
   type HdmiDisplayHdr2086Metadata_Ptr is access HdmiDisplayHdr2086Metadata;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged_Interface;
   type TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged is access all TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged_Interface'Class;
   type TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged_Ptr is access all TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHdmiDisplayMode_Interface;
   type IHdmiDisplayMode is access all IHdmiDisplayMode_Interface'Class;
   type IHdmiDisplayMode_Ptr is access all IHdmiDisplayMode;
   type IHdmiDisplayInformationStatics_Interface;
   type IHdmiDisplayInformationStatics is access all IHdmiDisplayInformationStatics_Interface'Class;
   type IHdmiDisplayInformationStatics_Ptr is access all IHdmiDisplayInformationStatics;
   type IHdmiDisplayInformation_Interface;
   type IHdmiDisplayInformation is access all IHdmiDisplayInformation_Interface'Class;
   type IHdmiDisplayInformation_Ptr is access all IHdmiDisplayInformation;
   type IIterator_IHdmiDisplayMode_Interface;
   type IIterator_IHdmiDisplayMode is access all IIterator_IHdmiDisplayMode_Interface'Class;
   type IIterator_IHdmiDisplayMode_Ptr is access all IIterator_IHdmiDisplayMode;
   type IIterable_IHdmiDisplayMode_Interface;
   type IIterable_IHdmiDisplayMode is access all IIterable_IHdmiDisplayMode_Interface'Class;
   type IIterable_IHdmiDisplayMode_Ptr is access all IIterable_IHdmiDisplayMode;
   type IVectorView_IHdmiDisplayMode_Interface;
   type IVectorView_IHdmiDisplayMode is access all IVectorView_IHdmiDisplayMode_Interface'Class;
   type IVectorView_IHdmiDisplayMode_Ptr is access all IVectorView_IHdmiDisplayMode;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IHdmiDisplayMode : aliased constant Windows.IID := (201774509, 7056, 20305, (153, 129, 239, 90, 28, 13, 223, 102 ));
   
   type IHdmiDisplayMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResolutionWidthInRawPixels
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolutionHeightInRawPixels
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_RefreshRate
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_StereoEnabled
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BitsPerPixel
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function IsEqual
   (
      This       : access IHdmiDisplayMode_Interface
      ; mode : Windows.Graphics.Display.Core.IHdmiDisplayMode
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorSpace
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Graphics.Display.Core.HdmiDisplayColorSpace
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelEncoding
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Graphics.Display.Core.HdmiDisplayPixelEncoding
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSdrLuminanceSupported
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSmpte2084Supported
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Is2086MetadataSupported
   (
      This       : access IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHdmiDisplayInformationStatics : aliased constant Windows.IID := (1827058272, 62506, 18965, (145, 76, 123, 142, 42, 90, 101, 223 ));
   
   type IHdmiDisplayInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IHdmiDisplayInformationStatics_Interface
      ; RetVal : access Windows.Graphics.Display.Core.IHdmiDisplayInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHdmiDisplayInformation : aliased constant Windows.IID := (319503370, 62821, 18286, (171, 213, 234, 5, 174, 231, 76, 105 ));
   
   type IHdmiDisplayInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSupportedDisplayModes
   (
      This       : access IHdmiDisplayInformation_Interface
      ; RetVal : access Windows.Graphics.Display.Core.IVectorView_IHdmiDisplayMode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentDisplayMode
   (
      This       : access IHdmiDisplayInformation_Interface
      ; RetVal : access Windows.Graphics.Display.Core.IHdmiDisplayMode
   )
   return Windows.HRESULT is abstract;
   
   function SetDefaultDisplayModeAsync
   (
      This       : access IHdmiDisplayInformation_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RequestSetCurrentDisplayModeAsync
   (
      This       : access IHdmiDisplayInformation_Interface
      ; mode : Windows.Graphics.Display.Core.IHdmiDisplayMode
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestSetCurrentDisplayModeWithHdrAsync
   (
      This       : access IHdmiDisplayInformation_Interface
      ; mode : Windows.Graphics.Display.Core.IHdmiDisplayMode
      ; hdrOption : Windows.Graphics.Display.Core.HdmiDisplayHdrOption
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestSetCurrentDisplayModeWithHdrAndMetadataAsync
   (
      This       : access IHdmiDisplayInformation_Interface
      ; mode : Windows.Graphics.Display.Core.IHdmiDisplayMode
      ; hdrOption : Windows.Graphics.Display.Core.HdmiDisplayHdrOption
      ; hdrMetadata : Windows.Graphics.Display.Core.HdmiDisplayHdr2086Metadata
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_DisplayModesChanged
   (
      This       : access IHdmiDisplayInformation_Interface
      ; value : TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisplayModesChanged
   (
      This       : access IHdmiDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IHdmiDisplayMode : aliased constant Windows.IID := (3597580337, 57900, 24291, (175, 69, 225, 192, 61, 228, 188, 98 ));
   
   type IIterator_IHdmiDisplayMode_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Graphics.Display.Core.IHdmiDisplayMode
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHdmiDisplayMode_Interface
      ; items : Windows.Graphics.Display.Core.IHdmiDisplayMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IHdmiDisplayMode : aliased constant Windows.IID := (1233010001, 3745, 23520, (141, 186, 143, 127, 76, 228, 251, 51 ));
   
   type IIterable_IHdmiDisplayMode_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHdmiDisplayMode_Interface
      ; RetVal : access Windows.Graphics.Display.Core.IIterator_IHdmiDisplayMode
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IHdmiDisplayMode : aliased constant Windows.IID := (2098101348, 57102, 21402, (171, 95, 60, 38, 0, 38, 197, 206 ));
   
   type IVectorView_IHdmiDisplayMode_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHdmiDisplayMode_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.Display.Core.IHdmiDisplayMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHdmiDisplayMode_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHdmiDisplayMode_Interface
      ; value : Windows.Graphics.Display.Core.IHdmiDisplayMode
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHdmiDisplayMode_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.Display.Core.IHdmiDisplayMode_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged : aliased constant Windows.IID := (3507065643, 40161, 23773, (148, 199, 147, 198, 12, 131, 58, 163 ));
   
   type TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.Core.IHdmiDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IHdmiDisplayInformation_add_DisplayModesChanged_Interface
      ; sender : Windows.Graphics.Display.Core.IHdmiDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HdmiDisplayMode is Windows.Graphics.Display.Core.IHdmiDisplayMode;
   subtype HdmiDisplayInformation is Windows.Graphics.Display.Core.IHdmiDisplayInformation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.Graphics.Display.Core.IHdmiDisplayInformation;
   
end;
