--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Devices.Adc.Provider;
with Windows.Devices.Pwm.Provider;
with Windows.Devices.Gpio.Provider;
with Windows.Devices.I2c.Provider;
with Windows.Devices.Spi.Provider;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      adc : Windows.Devices.Adc.Provider.IAdcControllerProvider
      ; pwm : Windows.Devices.Pwm.Provider.IPwmControllerProvider
      ; gpio : Windows.Devices.Gpio.Provider.IGpioControllerProvider
      ; i2c : Windows.Devices.I2c.Provider.II2cControllerProvider
      ; spi : Windows.Devices.Spi.Provider.ISpiControllerProvider
   )
   return Windows.Devices.ILowLevelDevicesAggregateProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.LowLevelDevicesAggregateProvider");
      m_Factory     : Windows.Devices.ILowLevelDevicesAggregateProviderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.ILowLevelDevicesAggregateProvider := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILowLevelDevicesAggregateProviderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(adc, pwm, gpio, i2c, spi, RetVal'Access);
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
   
   
   function get_DefaultProvider
   return Windows.Devices.ILowLevelDevicesAggregateProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.LowLevelDevicesController");
      m_Factory     : ILowLevelDevicesControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.ILowLevelDevicesAggregateProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILowLevelDevicesControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DefaultProvider(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_DefaultProvider
   (
      value : Windows.Devices.ILowLevelDevicesAggregateProvider
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.LowLevelDevicesController");
      m_Factory     : ILowLevelDevicesControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILowLevelDevicesControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_DefaultProvider(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;

end;
