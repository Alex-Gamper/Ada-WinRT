--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Globalization.NumberFormatting is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateSignificantDigitsNumberRounder return Windows.Globalization.NumberFormatting.INumberRounder is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumberFormatting.SignificantDigitsNumberRounder");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.NumberFormatting.INumberRounder := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Globalization.NumberFormatting.IID_INumberRounder'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateIncrementNumberRounder return Windows.Globalization.NumberFormatting.INumberRounder is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumberFormatting.IncrementNumberRounder");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.NumberFormatting.INumberRounder := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Globalization.NumberFormatting.IID_INumberRounder'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDecimalFormatter
   (
      languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
   )
   return Windows.Globalization.NumberFormatting.INumberFormatterOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumberFormatting.DecimalFormatter");
      m_Factory     : Windows.Globalization.NumberFormatting.IDecimalFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.NumberFormatting.INumberFormatterOptions := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDecimalFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDecimalFormatter(languages, geographicRegion, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePercentFormatter
   (
      languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
   )
   return Windows.Globalization.NumberFormatting.INumberFormatterOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumberFormatting.PercentFormatter");
      m_Factory     : Windows.Globalization.NumberFormatting.IPercentFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.NumberFormatting.INumberFormatterOptions := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPercentFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePercentFormatter(languages, geographicRegion, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePermilleFormatter
   (
      languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
   )
   return Windows.Globalization.NumberFormatting.INumberFormatterOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumberFormatting.PermilleFormatter");
      m_Factory     : Windows.Globalization.NumberFormatting.IPermilleFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.NumberFormatting.INumberFormatterOptions := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPermilleFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePermilleFormatter(languages, geographicRegion, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCurrencyFormatterCode
   (
      currencyCode : Windows.String
   )
   return Windows.Globalization.NumberFormatting.ICurrencyFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumberFormatting.CurrencyFormatter");
      m_Factory     : Windows.Globalization.NumberFormatting.ICurrencyFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.NumberFormatting.ICurrencyFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCurrencyFormatterCode(currencyCode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCurrencyFormatterCodeContext
   (
      currencyCode : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
   )
   return Windows.Globalization.NumberFormatting.ICurrencyFormatter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumberFormatting.CurrencyFormatter");
      m_Factory     : Windows.Globalization.NumberFormatting.ICurrencyFormatterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.NumberFormatting.ICurrencyFormatter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICurrencyFormatterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCurrencyFormatterCodeContext(currencyCode, languages, geographicRegion, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNumeralSystemTranslator return Windows.Globalization.NumberFormatting.INumeralSystemTranslator is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Globalization.NumberFormatting.NumeralSystemTranslator");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.NumberFormatting.INumeralSystemTranslator := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Globalization.NumberFormatting.IID_INumeralSystemTranslator'Access, RetVal'Address);
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
   

end;
