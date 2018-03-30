--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Gaming.Input;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Input.Preview.Injection is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateInjectedInputGamepadInfo return Windows.UI.Input.Preview.Injection.IInjectedInputGamepadInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Preview.Injection.InjectedInputGamepadInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Preview.Injection.IInjectedInputGamepadInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Preview.Injection.IID_IInjectedInputGamepadInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInjectedInputKeyboardInfo return Windows.UI.Input.Preview.Injection.IInjectedInputKeyboardInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Preview.Injection.InjectedInputKeyboardInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Preview.Injection.IInjectedInputKeyboardInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Preview.Injection.IID_IInjectedInputKeyboardInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInjectedInputMouseInfo return Windows.UI.Input.Preview.Injection.IInjectedInputMouseInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Preview.Injection.InjectedInputMouseInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Preview.Injection.IInjectedInputMouseInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Preview.Injection.IID_IInjectedInputMouseInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInjectedInputTouchInfo return Windows.UI.Input.Preview.Injection.IInjectedInputTouchInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Preview.Injection.InjectedInputTouchInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Preview.Injection.IInjectedInputTouchInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Preview.Injection.IID_IInjectedInputTouchInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInjectedInputPenInfo return Windows.UI.Input.Preview.Injection.IInjectedInputPenInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Preview.Injection.InjectedInputPenInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Preview.Injection.IInjectedInputPenInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Preview.Injection.IID_IInjectedInputPenInfo'Access, RetVal'Address);
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
   
   
   function TryCreateForAppBroadcastOnly
   return Windows.UI.Input.Preview.Injection.IInputInjector is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Preview.Injection.InputInjector");
      m_Factory     : IInputInjectorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Preview.Injection.IInputInjector;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInputInjectorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreateForAppBroadcastOnly(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryCreate
   return Windows.UI.Input.Preview.Injection.IInputInjector is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Preview.Injection.InputInjector");
      m_Factory     : IInputInjectorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Preview.Injection.IInputInjector;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInputInjectorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
