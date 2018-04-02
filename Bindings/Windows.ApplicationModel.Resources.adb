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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Resources is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateResourceLoaderByName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : Windows.ApplicationModel.Resources.IResourceLoaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResourceLoaderByName(name, RetVal'Access);
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
   
   
   function GetStringForReference
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStringForReference(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentViewWithName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentViewWithName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForViewIndependentUse
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForViewIndependentUse(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForViewIndependentUseWithName
   (
      name : Windows.String
   )
   return Windows.ApplicationModel.Resources.IResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.ResourceLoader");
      m_Factory     : IResourceLoaderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.IResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceLoaderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForViewIndependentUseWithName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
