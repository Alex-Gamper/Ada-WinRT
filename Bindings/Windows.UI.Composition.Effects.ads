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
limited with Windows.Graphics.Effects;
--------------------------------------------------------------------------------
package Windows.UI.Composition.Effects is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SceneLightingEffectReflectanceModel is (
      BlinnPhong,
      PhysicallyBasedBlinnPhong
   );
   for SceneLightingEffectReflectanceModel use (
      BlinnPhong => 0,
      PhysicallyBasedBlinnPhong => 1
   );
   for SceneLightingEffectReflectanceModel'Size use 32;
   
   type SceneLightingEffectReflectanceModel_Ptr is access SceneLightingEffectReflectanceModel;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISceneLightingEffect_Interface;
   type ISceneLightingEffect is access all ISceneLightingEffect_Interface'Class;
   type ISceneLightingEffect_Ptr is access all ISceneLightingEffect;
   type ISceneLightingEffect2_Interface;
   type ISceneLightingEffect2 is access all ISceneLightingEffect2_Interface'Class;
   type ISceneLightingEffect2_Ptr is access all ISceneLightingEffect2;
   type IGraphicsEffect_Imported_Interface;
   type IGraphicsEffect_Imported is access all IGraphicsEffect_Imported_Interface'Class;
   type IGraphicsEffect_Imported_Ptr is access all IGraphicsEffect_Imported;
   type IGraphicsEffectSource_Imported_Interface;
   type IGraphicsEffectSource_Imported is access all IGraphicsEffectSource_Imported_Interface'Class;
   type IGraphicsEffectSource_Imported_Ptr is access all IGraphicsEffectSource_Imported;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISceneLightingEffect : aliased constant Windows.IID := (2444975698, 38353, 20363, (154, 90, 100, 8, 178, 75, 140, 106 ));
   
   type ISceneLightingEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AmbientAmount
   (
      This       : access ISceneLightingEffect_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_AmbientAmount
   (
      This       : access ISceneLightingEffect_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_DiffuseAmount
   (
      This       : access ISceneLightingEffect_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_DiffuseAmount
   (
      This       : access ISceneLightingEffect_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalMapSource
   (
      This       : access ISceneLightingEffect_Interface
      ; RetVal : access Windows.Graphics.Effects.IGraphicsEffectSource
   )
   return Windows.HRESULT is abstract;
   
   function put_NormalMapSource
   (
      This       : access ISceneLightingEffect_Interface
      ; value : Windows.Graphics.Effects.IGraphicsEffectSource
   )
   return Windows.HRESULT is abstract;
   
   function get_SpecularAmount
   (
      This       : access ISceneLightingEffect_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_SpecularAmount
   (
      This       : access ISceneLightingEffect_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_SpecularShine
   (
      This       : access ISceneLightingEffect_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_SpecularShine
   (
      This       : access ISceneLightingEffect_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISceneLightingEffect2 : aliased constant Windows.IID := (2653359745, 29424, 19548, (149, 248, 138, 110, 0, 36, 244, 9 ));
   
   type ISceneLightingEffect2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReflectanceModel
   (
      This       : access ISceneLightingEffect2_Interface
      ; RetVal : access Windows.UI.Composition.Effects.SceneLightingEffectReflectanceModel
   )
   return Windows.HRESULT is abstract;
   
   function put_ReflectanceModel
   (
      This       : access ISceneLightingEffect2_Interface
      ; value : Windows.UI.Composition.Effects.SceneLightingEffectReflectanceModel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IGraphicsEffect_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IGraphicsEffect_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IGraphicsEffect_Imported_Interface
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IGraphicsEffectSource_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SceneLightingEffect is Windows.UI.Composition.Effects.ISceneLightingEffect;
   function Create return Windows.UI.Composition.Effects.ISceneLightingEffect;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
