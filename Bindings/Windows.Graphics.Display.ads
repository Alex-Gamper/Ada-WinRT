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
--------------------------------------------------------------------------------
package Windows.Graphics.Display is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DisplayOrientations is (
      None,
      Landscape,
      Portrait,
      LandscapeFlipped,
      PortraitFlipped
   );
   for DisplayOrientations use (
      None => 0,
      Landscape => 1,
      Portrait => 2,
      LandscapeFlipped => 4,
      PortraitFlipped => 8
   );
   for DisplayOrientations'Size use 32;
   
   type DisplayOrientations_Ptr is access DisplayOrientations;
   
   type ResolutionScale is (
      Invalid,
      Scale100Percent,
      Scale120Percent,
      Scale125Percent,
      Scale140Percent,
      Scale150Percent,
      Scale160Percent,
      Scale175Percent,
      Scale180Percent,
      Scale200Percent,
      Scale225Percent,
      Scale250Percent,
      Scale300Percent,
      Scale350Percent,
      Scale400Percent,
      Scale450Percent,
      Scale500Percent
   );
   for ResolutionScale use (
      Invalid => 0,
      Scale100Percent => 100,
      Scale120Percent => 120,
      Scale125Percent => 125,
      Scale140Percent => 140,
      Scale150Percent => 150,
      Scale160Percent => 160,
      Scale175Percent => 175,
      Scale180Percent => 180,
      Scale200Percent => 200,
      Scale225Percent => 225,
      Scale250Percent => 250,
      Scale300Percent => 300,
      Scale350Percent => 350,
      Scale400Percent => 400,
      Scale450Percent => 450,
      Scale500Percent => 500
   );
   for ResolutionScale'Size use 32;
   
   type ResolutionScale_Ptr is access ResolutionScale;
   
   type DisplayBrightnessScenario is (
      DefaultBrightness,
      IdleBrightness,
      BarcodeReadingBrightness,
      FullBrightness
   );
   for DisplayBrightnessScenario use (
      DefaultBrightness => 0,
      IdleBrightness => 1,
      BarcodeReadingBrightness => 2,
      FullBrightness => 3
   );
   for DisplayBrightnessScenario'Size use 32;
   
   type DisplayBrightnessScenario_Ptr is access DisplayBrightnessScenario;
   
   type DisplayBrightnessOverrideOptions is (
      None,
      UseDimmedPolicyWhenBatteryIsLow
   );
   for DisplayBrightnessOverrideOptions use (
      None => 0,
      UseDimmedPolicyWhenBatteryIsLow => 1
   );
   for DisplayBrightnessOverrideOptions'Size use 32;
   
   type DisplayBrightnessOverrideOptions_Ptr is access DisplayBrightnessOverrideOptions;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type DisplayPropertiesEventHandler_Interface;
   type DisplayPropertiesEventHandler is access all DisplayPropertiesEventHandler_Interface'Class;
   type DisplayPropertiesEventHandler_Ptr is access all DisplayPropertiesEventHandler;
   type TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface;
   type TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated is access all TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface'Class;
   type TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Ptr is access all TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated;
   type TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface;
   type TypedEventHandler_IDisplayInformation_add_OrientationChanged is access all TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation_add_OrientationChanged_Ptr is access all TypedEventHandler_IDisplayInformation_add_OrientationChanged;
   type TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface;
   type TypedEventHandler_IDisplayInformation_add_DpiChanged is access all TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation_add_DpiChanged_Ptr is access all TypedEventHandler_IDisplayInformation_add_DpiChanged;
   type TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface;
   type TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged is access all TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Ptr is access all TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged;
   type TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface;
   type TypedEventHandler_IDisplayInformation_add_ColorProfileChanged is access all TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface'Class;
   type TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Ptr is access all TypedEventHandler_IDisplayInformation_add_ColorProfileChanged;
   type TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface;
   type TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged is access all TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface'Class;
   type TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Ptr is access all TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged;
   type TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface;
   type TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged is access all TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface'Class;
   type TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Ptr is access all TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged;
   type TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface;
   type TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged is access all TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface'Class;
   type TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Ptr is access all TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDisplayInformationStatics_Interface;
   type IDisplayInformationStatics is access all IDisplayInformationStatics_Interface'Class;
   type IDisplayInformationStatics_Ptr is access all IDisplayInformationStatics;
   type IDisplayInformation_Interface;
   type IDisplayInformation is access all IDisplayInformation_Interface'Class;
   type IDisplayInformation_Ptr is access all IDisplayInformation;
   type IDisplayInformation2_Interface;
   type IDisplayInformation2 is access all IDisplayInformation2_Interface'Class;
   type IDisplayInformation2_Ptr is access all IDisplayInformation2;
   type IDisplayInformation3_Interface;
   type IDisplayInformation3 is access all IDisplayInformation3_Interface'Class;
   type IDisplayInformation3_Ptr is access all IDisplayInformation3;
   type IDisplayInformation4_Interface;
   type IDisplayInformation4 is access all IDisplayInformation4_Interface'Class;
   type IDisplayInformation4_Ptr is access all IDisplayInformation4;
   type IDisplayPropertiesStatics_Interface;
   type IDisplayPropertiesStatics is access all IDisplayPropertiesStatics_Interface'Class;
   type IDisplayPropertiesStatics_Ptr is access all IDisplayPropertiesStatics;
   type IBrightnessOverrideStatics_Interface;
   type IBrightnessOverrideStatics is access all IBrightnessOverrideStatics_Interface'Class;
   type IBrightnessOverrideStatics_Ptr is access all IBrightnessOverrideStatics;
   type IBrightnessOverride_Interface;
   type IBrightnessOverride is access all IBrightnessOverride_Interface'Class;
   type IBrightnessOverride_Ptr is access all IBrightnessOverride;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformationStatics : aliased constant Windows.IID := (3332385388, 54354, 17628, (186, 7, 150, 243, 198, 173, 249, 209 ));
   
   type IDisplayInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IDisplayInformationStatics_Interface
      ; RetVal : access Windows.Graphics.Display.IDisplayInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoRotationPreferences
   (
      This       : access IDisplayInformationStatics_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoRotationPreferences
   (
      This       : access IDisplayInformationStatics_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function add_DisplayContentsInvalidated
   (
      This       : access IDisplayInformationStatics_Interface
      ; handler : TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisplayContentsInvalidated
   (
      This       : access IDisplayInformationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation : aliased constant Windows.IID := (3201372846, 44483, 19913, (174, 101, 133, 31, 77, 125, 71, 153 ));
   
   type IDisplayInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentOrientation
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_NativeOrientation
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function add_OrientationChanged
   (
      This       : access IDisplayInformation_Interface
      ; handler : TypedEventHandler_IDisplayInformation_add_OrientationChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OrientationChanged
   (
      This       : access IDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolutionScale
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Graphics.Display.ResolutionScale
   )
   return Windows.HRESULT is abstract;
   
   function get_LogicalDpi
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RawDpiX
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RawDpiY
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function add_DpiChanged
   (
      This       : access IDisplayInformation_Interface
      ; handler : TypedEventHandler_IDisplayInformation_add_DpiChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DpiChanged
   (
      This       : access IDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_StereoEnabled
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_StereoEnabledChanged
   (
      This       : access IDisplayInformation_Interface
      ; handler : TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StereoEnabledChanged
   (
      This       : access IDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetColorProfileAsync
   (
      This       : access IDisplayInformation_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ColorProfileChanged
   (
      This       : access IDisplayInformation_Interface
      ; handler : TypedEventHandler_IDisplayInformation_add_ColorProfileChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ColorProfileChanged
   (
      This       : access IDisplayInformation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation2 : aliased constant Windows.IID := (1305280545, 64209, 19342, (142, 223, 119, 88, 135, 184, 191, 25 ));
   
   type IDisplayInformation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RawPixelsPerViewPixel
   (
      This       : access IDisplayInformation2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation3 : aliased constant Windows.IID := (3675586845, 3849, 17510, (143, 243, 17, 222, 154, 60, 146, 154 ));
   
   type IDisplayInformation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DiagonalSizeInInches
   (
      This       : access IDisplayInformation3_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayInformation4 : aliased constant Windows.IID := (3379744303, 4674, 18110, (181, 54, 225, 170, 254, 158, 122, 207 ));
   
   type IDisplayInformation4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ScreenWidthInRawPixels
   (
      This       : access IDisplayInformation4_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ScreenHeightInRawPixels
   (
      This       : access IDisplayInformation4_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayPropertiesStatics : aliased constant Windows.IID := (1765272973, 12522, 19949, (130, 113, 69, 83, 255, 2, 246, 138 ));
   
   type IDisplayPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentOrientation
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_NativeOrientation
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoRotationPreferences
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoRotationPreferences
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function add_OrientationChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OrientationChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolutionScale
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Graphics.Display.ResolutionScale
   )
   return Windows.HRESULT is abstract;
   
   function get_LogicalDpi
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function add_LogicalDpiChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LogicalDpiChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_StereoEnabled
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_StereoEnabledChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StereoEnabledChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetColorProfileAsync
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ColorProfileChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ColorProfileChanged
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DisplayContentsInvalidated
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisplayContentsInvalidated
   (
      This       : access IDisplayPropertiesStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBrightnessOverrideStatics : aliased constant Windows.IID := (61323757, 57841, 19048, (161, 31, 148, 106, 216, 206, 83, 147 ));
   
   type IBrightnessOverrideStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultForSystem
   (
      This       : access IBrightnessOverrideStatics_Interface
      ; RetVal : access Windows.Graphics.Display.IBrightnessOverride
   )
   return Windows.HRESULT is abstract;
   
   function GetForCurrentView
   (
      This       : access IBrightnessOverrideStatics_Interface
      ; RetVal : access Windows.Graphics.Display.IBrightnessOverride
   )
   return Windows.HRESULT is abstract;
   
   function SaveForSystemAsync
   (
      This       : access IBrightnessOverrideStatics_Interface
      ; value : Windows.Graphics.Display.IBrightnessOverride
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBrightnessOverride : aliased constant Windows.IID := (2529780250, 49475, 17298, (190, 221, 74, 126, 149, 116, 200, 253 ));
   
   type IBrightnessOverride_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSupported
   (
      This       : access IBrightnessOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOverrideActive
   (
      This       : access IBrightnessOverride_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BrightnessLevel
   (
      This       : access IBrightnessOverride_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetBrightnessLevel
   (
      This       : access IBrightnessOverride_Interface
      ; brightnessLevel : Windows.Double
      ; options : Windows.Graphics.Display.DisplayBrightnessOverrideOptions
   )
   return Windows.HRESULT is abstract;
   
   function SetBrightnessScenario
   (
      This       : access IBrightnessOverride_Interface
      ; scenario : Windows.Graphics.Display.DisplayBrightnessScenario
      ; options : Windows.Graphics.Display.DisplayBrightnessOverrideOptions
   )
   return Windows.HRESULT is abstract;
   
   function GetLevelForScenario
   (
      This       : access IBrightnessOverride_Interface
      ; scenario : Windows.Graphics.Display.DisplayBrightnessScenario
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function StartOverride
   (
      This       : access IBrightnessOverride_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StopOverride
   (
      This       : access IBrightnessOverride_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_IsSupportedChanged
   (
      This       : access IBrightnessOverride_Interface
      ; handler : TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsSupportedChanged
   (
      This       : access IBrightnessOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_IsOverrideActiveChanged
   (
      This       : access IBrightnessOverride_Interface
      ; handler : TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_IsOverrideActiveChanged
   (
      This       : access IBrightnessOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BrightnessLevelChanged
   (
      This       : access IBrightnessOverride_Interface
      ; handler : TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BrightnessLevelChanged
   (
      This       : access IBrightnessOverride_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_DisplayPropertiesEventHandler : aliased constant Windows.IID := (3688729345, 61857, 18129, (158, 227, 84, 59, 204, 153, 89, 128 ));
   
   type DisplayPropertiesEventHandler_Interface(Callback : access procedure (sender : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_DisplayPropertiesEventHandler'access) with null record;
   function Invoke
   (
      This       : access DisplayPropertiesEventHandler_Interface
      ; sender : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation_add_OrientationChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation_add_OrientationChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation_add_DpiChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation_add_DpiChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDisplayInformation_add_ColorProfileChanged : aliased constant Windows.IID := (2261055001, 26550, 20935, (179, 13, 216, 207, 19, 98, 83, 39 ));
   
   type TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IDisplayInformation ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDisplayInformation_add_ColorProfileChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged : aliased constant Windows.IID := (2757763406, 26144, 21021, (156, 185, 160, 160, 247, 50, 206, 144 ));
   
   type TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IBrightnessOverride ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged : aliased constant Windows.IID := (2757763406, 26144, 21021, (156, 185, 160, 160, 247, 50, 206, 144 ));
   
   type TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IBrightnessOverride ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged : aliased constant Windows.IID := (2757763406, 26144, 21021, (156, 185, 160, 160, 247, 50, 206, 144 ));
   
   type TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface(Callback : access procedure (sender : Windows.Graphics.Display.IBrightnessOverride ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DisplayInformation is Windows.Graphics.Display.IDisplayInformation;
   subtype BrightnessOverride is Windows.Graphics.Display.IBrightnessOverride;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.Graphics.Display.IDisplayInformation;
   
   function get_AutoRotationPreferences
   return Windows.Graphics.Display.DisplayOrientations;
   
   procedure put_AutoRotationPreferences
   (
      value : Windows.Graphics.Display.DisplayOrientations
   )
   ;
   
   function add_DisplayContentsInvalidated
   (
      handler : TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_DisplayContentsInvalidated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function GetDefaultForSystem
   return Windows.Graphics.Display.IBrightnessOverride;
   
   function GetForCurrentView
   return Windows.Graphics.Display.IBrightnessOverride;
   
   function SaveForSystemAsync
   (
      value : Windows.Graphics.Display.IBrightnessOverride
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
end;
