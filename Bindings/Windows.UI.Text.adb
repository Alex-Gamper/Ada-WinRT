--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.UI;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Text is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_AutoColor
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.TextConstants");
      m_Factory     : ITextConstantsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConstantsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutoColor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinUnitCount
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.TextConstants");
      m_Factory     : ITextConstantsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConstantsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinUnitCount(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxUnitCount
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.TextConstants");
      m_Factory     : ITextConstantsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConstantsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxUnitCount(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UndefinedColor
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.TextConstants");
      m_Factory     : ITextConstantsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConstantsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UndefinedColor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UndefinedFloatValue
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.TextConstants");
      m_Factory     : ITextConstantsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConstantsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UndefinedFloatValue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UndefinedInt32Value
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.TextConstants");
      m_Factory     : ITextConstantsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConstantsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UndefinedInt32Value(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UndefinedFontStretch
   return Windows.UI.Text.FontStretch is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.TextConstants");
      m_Factory     : ITextConstantsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontStretch;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConstantsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UndefinedFontStretch(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UndefinedFontStyle
   return Windows.UI.Text.FontStyle is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.TextConstants");
      m_Factory     : ITextConstantsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontStyle;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITextConstantsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UndefinedFontStyle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Black
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Black(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bold
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bold(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExtraBlack
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExtraBlack(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExtraBold
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExtraBold(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExtraLight
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExtraLight(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Light
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Light(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Medium
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Medium(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Normal
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Normal(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SemiBold
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SemiBold(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SemiLight
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SemiLight(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Thin
   return Windows.UI.Text.FontWeight is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Text.FontWeights");
      m_Factory     : IFontWeightsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Text.FontWeight;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFontWeightsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Thin(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
