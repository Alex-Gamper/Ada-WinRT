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
with Windows.Storage;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Resources.Core is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateResourceContext return Windows.ApplicationModel.Resources.Core.IResourceContext is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceContext");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.Core.IResourceContext := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Resources.Core.IID_IResourceContext'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   procedure SetGlobalQualifierValueWithPersistence
   (
      key : Windows.String
      ; value : Windows.String
      ; persistence : Windows.ApplicationModel.Resources.Core.ResourceQualifierPersistence
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceContext");
      m_Factory     : IResourceContextStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceContextStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetGlobalQualifierValueWithPersistence(key, value, persistence);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetForCurrentView
   return Windows.ApplicationModel.Resources.Core.IResourceContext is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceContext");
      m_Factory     : IResourceContextStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.Core.IResourceContext;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceContextStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetGlobalQualifierValue
   (
      key : Windows.String
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceContext");
      m_Factory     : IResourceContextStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceContextStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetGlobalQualifierValue(key, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ResetGlobalQualifierValues
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceContext");
      m_Factory     : IResourceContextStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceContextStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ResetGlobalQualifierValues;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ResetGlobalQualifierValuesForSpecifiedQualifiers
   (
      qualifierNames : Windows.Foundation.Collections.IIterable_String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceContext");
      m_Factory     : IResourceContextStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceContextStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ResetGlobalQualifierValuesForSpecifiedQualifiers(qualifierNames);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetForViewIndependentUse
   return Windows.ApplicationModel.Resources.Core.IResourceContext is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceContext");
      m_Factory     : IResourceContextStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.Core.IResourceContext;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceContextStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForViewIndependentUse(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMatchingContext
   (
      result : Windows.ApplicationModel.Resources.Core.IIterable_IResourceQualifier
   )
   return Windows.ApplicationModel.Resources.Core.IResourceContext is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceContext");
      m_Factory     : IResourceContextStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.Core.IResourceContext;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceContextStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMatchingContext(result, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Current
   return Windows.ApplicationModel.Resources.Core.IResourceManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceManager");
      m_Factory     : IResourceManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Resources.Core.IResourceManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsResourceReference
   (
      resourceReference : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Resources.Core.ResourceManager");
      m_Factory     : IResourceManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsResourceReference(resourceReference, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
