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
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Resources is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IResourceLoader_Interface;
   type IResourceLoader is access all IResourceLoader_Interface'Class;
   type IResourceLoader_Ptr is access all IResourceLoader;
   type IResourceLoader2_Interface;
   type IResourceLoader2 is access all IResourceLoader2_Interface'Class;
   type IResourceLoader2_Ptr is access all IResourceLoader2;
   type IResourceLoaderStatics_Interface;
   type IResourceLoaderStatics is access all IResourceLoaderStatics_Interface'Class;
   type IResourceLoaderStatics_Ptr is access all IResourceLoaderStatics;
   type IResourceLoaderStatics2_Interface;
   type IResourceLoaderStatics2 is access all IResourceLoaderStatics2_Interface'Class;
   type IResourceLoaderStatics2_Ptr is access all IResourceLoaderStatics2;
   type IResourceLoaderFactory_Interface;
   type IResourceLoaderFactory is access all IResourceLoaderFactory_Interface'Class;
   type IResourceLoaderFactory_Ptr is access all IResourceLoaderFactory;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IResourceLoader : aliased constant Windows.IID := (139610376, 5871, 17837, (166, 2, 41, 54, 55, 215, 230, 26 ));
   
   type IResourceLoader_Interface is interface and Windows.IInspectable_Interface;
   
   function GetString
   (
      This       : access IResourceLoader_Interface
      ; resource : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IResourceLoader2 : aliased constant Windows.IID := (283864774, 33080, 18625, (188, 101, 225, 241, 66, 7, 54, 124 ));
   
   type IResourceLoader2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStringForUri
   (
      This       : access IResourceLoader2_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IResourceLoaderStatics : aliased constant Windows.IID := (3212279009, 6600, 18882, (149, 60, 71, 233, 34, 123, 51, 78 ));
   
   type IResourceLoaderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStringForReference
   (
      This       : access IResourceLoaderStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IResourceLoaderStatics2 : aliased constant Windows.IID := (213926209, 25702, 18825, (148, 148, 11, 130, 223, 197, 63, 31 ));
   
   type IResourceLoaderStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IResourceLoaderStatics2_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.IResourceLoader
   )
   return Windows.HRESULT is abstract;
   
   function GetForCurrentViewWithName
   (
      This       : access IResourceLoaderStatics2_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Resources.IResourceLoader
   )
   return Windows.HRESULT is abstract;
   
   function GetForViewIndependentUse
   (
      This       : access IResourceLoaderStatics2_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.IResourceLoader
   )
   return Windows.HRESULT is abstract;
   
   function GetForViewIndependentUseWithName
   (
      This       : access IResourceLoaderStatics2_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Resources.IResourceLoader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IResourceLoaderFactory : aliased constant Windows.IID := (3275372035, 27100, 17029, (160, 119, 213, 192, 228, 124, 203, 232 ));
   
   type IResourceLoaderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateResourceLoaderByName
   (
      This       : access IResourceLoaderFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.ApplicationModel.Resources.IResourceLoader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ResourceLoader is Windows.ApplicationModel.Resources.IResourceLoader;
   function CreateResourceLoaderByName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetStringForReference
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.String;
   
   function GetForCurrentView
   return Windows.ApplicationModel.Resources.IResourceLoader;
   
   function GetForCurrentViewWithName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader;
   
   function GetForViewIndependentUse
   return Windows.ApplicationModel.Resources.IResourceLoader;
   
   function GetForViewIndependentUseWithName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader;
   

end;
