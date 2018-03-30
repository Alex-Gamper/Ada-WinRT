--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Gaming.Input.ForceFeedback is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ForceFeedbackLoadEffectResult_Interface
      ; asyncInfo : Windows.Gaming.Input.ForceFeedback.IAsyncOperation_ForceFeedbackLoadEffectResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateInstance
   (
      effectKind : Windows.Gaming.Input.ForceFeedback.ConditionForceEffectKind
   )
   return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ForceFeedback.ConditionForceEffect");
      m_Factory     : Windows.Gaming.Input.ForceFeedback.IConditionForceEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IConditionForceEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(effectKind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      effectKind : Windows.Gaming.Input.ForceFeedback.PeriodicForceEffectKind
   )
   return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ForceFeedback.PeriodicForceEffect");
      m_Factory     : Windows.Gaming.Input.ForceFeedback.IPeriodicForceEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeriodicForceEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(effectKind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateConstantForceEffect return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ForceFeedback.ConstantForceEffect");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Gaming.Input.ForceFeedback.IID_IForceFeedbackEffect'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRampForceEffect return Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ForceFeedback.RampForceEffect");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.ForceFeedback.IForceFeedbackEffect := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Gaming.Input.ForceFeedback.IID_IForceFeedbackEffect'Access, RetVal'Address);
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
