--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Media;
with Windows.Storage.Streams;
with Windows.Media.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.SpeechSynthesis is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISpeechSynthesisStream_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISpeechSynthesisStream or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ISpeechSynthesisStream_Interface
      ; asyncInfo : Windows.Media.SpeechSynthesis.IAsyncOperation_ISpeechSynthesisStream
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
   
   
   function CreateSpeechSynthesizer return Windows.Media.SpeechSynthesis.ISpeechSynthesizer is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechSynthesis.SpeechSynthesizer");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechSynthesis.ISpeechSynthesizer := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.SpeechSynthesis.IID_ISpeechSynthesizer'Access, RetVal'Address);
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
   
   
   function get_AllVoices
   return Windows.Media.SpeechSynthesis.IVectorView_IVoiceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechSynthesis.SpeechSynthesizer");
      m_Factory     : IInstalledVoicesStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechSynthesis.IVectorView_IVoiceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInstalledVoicesStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllVoices(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DefaultVoice
   return Windows.Media.SpeechSynthesis.IVoiceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechSynthesis.SpeechSynthesizer");
      m_Factory     : IInstalledVoicesStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechSynthesis.IVoiceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInstalledVoicesStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DefaultVoice(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TrySetDefaultVoiceAsync
   (
      voice : Windows.Media.SpeechSynthesis.IVoiceInformation
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechSynthesis.SpeechSynthesizer");
      m_Factory     : IInstalledVoicesStatic2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInstalledVoicesStatic2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetDefaultVoiceAsync(voice, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
