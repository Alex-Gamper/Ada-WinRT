--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
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
