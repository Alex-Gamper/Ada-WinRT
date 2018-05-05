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
with Windows.Storage.Streams;
with Windows.Gaming.Input;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Gaming.Input.Custom is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   procedure RegisterCustomFactoryForGipInterface
   (
      factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; interfaceId : Windows.Guid
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Custom.GameControllerFactoryManager");
      m_Factory     : IGameControllerFactoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameControllerFactoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterCustomFactoryForGipInterface(factory, interfaceId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure RegisterCustomFactoryForHardwareId
   (
      factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; hardwareVendorId : Windows.UInt16
      ; hardwareProductId : Windows.UInt16
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Custom.GameControllerFactoryManager");
      m_Factory     : IGameControllerFactoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameControllerFactoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterCustomFactoryForHardwareId(factory, hardwareVendorId, hardwareProductId);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure RegisterCustomFactoryForXusbType
   (
      factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; xusbType : Windows.Gaming.Input.Custom.XusbDeviceType
      ; xusbSubtype : Windows.Gaming.Input.Custom.XusbDeviceSubtype
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Custom.GameControllerFactoryManager");
      m_Factory     : IGameControllerFactoryManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameControllerFactoryManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterCustomFactoryForXusbType(factory, xusbType, xusbSubtype);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function TryGetFactoryControllerFromGameController
   (
      factory : Windows.Gaming.Input.Custom.ICustomGameControllerFactory
      ; gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IGameController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Custom.GameControllerFactoryManager");
      m_Factory     : IGameControllerFactoryManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IGameController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameControllerFactoryManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryGetFactoryControllerFromGameController(factory, gameController, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
