--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
limited with Windows.UI;
--------------------------------------------------------------------------------
package Windows.Media.ClosedCaptioning is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ClosedCaptionStyle is (
      Default,
      MonospacedWithSerifs,
      ProportionalWithSerifs,
      MonospacedWithoutSerifs,
      ProportionalWithoutSerifs,
      Casual,
      Cursive,
      SmallCapitals
   );
   for ClosedCaptionStyle use (
      Default => 0,
      MonospacedWithSerifs => 1,
      ProportionalWithSerifs => 2,
      MonospacedWithoutSerifs => 3,
      ProportionalWithoutSerifs => 4,
      Casual => 5,
      Cursive => 6,
      SmallCapitals => 7
   );
   for ClosedCaptionStyle'Size use 32;
   
   type ClosedCaptionStyle_Ptr is access ClosedCaptionStyle;
   
   type ClosedCaptionEdgeEffect is (
      Default,
      None,
      Raised,
      Depressed,
      Uniform,
      DropShadow
   );
   for ClosedCaptionEdgeEffect use (
      Default => 0,
      None => 1,
      Raised => 2,
      Depressed => 3,
      Uniform => 4,
      DropShadow => 5
   );
   for ClosedCaptionEdgeEffect'Size use 32;
   
   type ClosedCaptionEdgeEffect_Ptr is access ClosedCaptionEdgeEffect;
   
   type ClosedCaptionOpacity is (
      Default,
      OneHundredPercent,
      SeventyFivePercent,
      TwentyFivePercent,
      ZeroPercent
   );
   for ClosedCaptionOpacity use (
      Default => 0,
      OneHundredPercent => 1,
      SeventyFivePercent => 2,
      TwentyFivePercent => 3,
      ZeroPercent => 4
   );
   for ClosedCaptionOpacity'Size use 32;
   
   type ClosedCaptionOpacity_Ptr is access ClosedCaptionOpacity;
   
   type ClosedCaptionColor is (
      Default,
      White,
      Black,
      Red,
      Green,
      Blue,
      Yellow,
      Magenta,
      Cyan
   );
   for ClosedCaptionColor use (
      Default => 0,
      White => 1,
      Black => 2,
      Red => 3,
      Green => 4,
      Blue => 5,
      Yellow => 6,
      Magenta => 7,
      Cyan => 8
   );
   for ClosedCaptionColor'Size use 32;
   
   type ClosedCaptionColor_Ptr is access ClosedCaptionColor;
   
   type ClosedCaptionSize is (
      Default,
      FiftyPercent,
      OneHundredPercent,
      OneHundredFiftyPercent,
      TwoHundredPercent
   );
   for ClosedCaptionSize use (
      Default => 0,
      FiftyPercent => 1,
      OneHundredPercent => 2,
      OneHundredFiftyPercent => 3,
      TwoHundredPercent => 4
   );
   for ClosedCaptionSize'Size use 32;
   
   type ClosedCaptionSize_Ptr is access ClosedCaptionSize;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IClosedCaptionPropertiesStatics_Interface;
   type IClosedCaptionPropertiesStatics is access all IClosedCaptionPropertiesStatics_Interface'Class;
   type IClosedCaptionPropertiesStatics_Ptr is access all IClosedCaptionPropertiesStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IClosedCaptionPropertiesStatics : aliased constant Windows.IID := (279584644, 52272, 16705, (181, 3, 82, 114, 40, 158, 12, 32 ));
   
   type IClosedCaptionPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FontColor
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionColor
   )
   return Windows.HRESULT is abstract;
   
   function get_ComputedFontColor
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_FontOpacity
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionOpacity
   )
   return Windows.HRESULT is abstract;
   
   function get_FontSize
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionSize
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStyle
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_FontEffect
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionEdgeEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionColor
   )
   return Windows.HRESULT is abstract;
   
   function get_ComputedBackgroundColor
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundOpacity
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionOpacity
   )
   return Windows.HRESULT is abstract;
   
   function get_RegionColor
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionColor
   )
   return Windows.HRESULT is abstract;
   
   function get_ComputedRegionColor
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_RegionOpacity
   (
      This       : access IClosedCaptionPropertiesStatics_Interface
      ; RetVal : access Windows.Media.ClosedCaptioning.ClosedCaptionOpacity
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_FontColor
   return Windows.Media.ClosedCaptioning.ClosedCaptionColor;
   
   function get_ComputedFontColor
   return Windows.UI.Color;
   
   function get_FontOpacity
   return Windows.Media.ClosedCaptioning.ClosedCaptionOpacity;
   
   function get_FontSize
   return Windows.Media.ClosedCaptioning.ClosedCaptionSize;
   
   function get_FontStyle
   return Windows.Media.ClosedCaptioning.ClosedCaptionStyle;
   
   function get_FontEffect
   return Windows.Media.ClosedCaptioning.ClosedCaptionEdgeEffect;
   
   function get_BackgroundColor
   return Windows.Media.ClosedCaptioning.ClosedCaptionColor;
   
   function get_ComputedBackgroundColor
   return Windows.UI.Color;
   
   function get_BackgroundOpacity
   return Windows.Media.ClosedCaptioning.ClosedCaptionOpacity;
   
   function get_RegionColor
   return Windows.Media.ClosedCaptioning.ClosedCaptionColor;
   
   function get_ComputedRegionColor
   return Windows.UI.Color;
   
   function get_RegionOpacity
   return Windows.Media.ClosedCaptioning.ClosedCaptionOpacity;
   
end;
