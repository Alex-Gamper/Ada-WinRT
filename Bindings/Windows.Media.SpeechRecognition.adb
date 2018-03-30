--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage;
with Windows.Globalization;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.SpeechRecognition is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Interface
      ; asyncInfo : Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionCompilationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISpeechRecognitionResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISpeechRecognitionResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ISpeechRecognitionResult_Interface
      ; asyncInfo : Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognitionQualityDegradingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechRecognizer(sender), Windows.Media.SpeechRecognition.ISpeechRecognitionQualityDegradingEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ISpeechRecognizer_add_StateChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpeechRecognizer_add_StateChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ISpeechRecognizer_add_StateChanged_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognizerStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechRecognizer(sender), Windows.Media.SpeechRecognition.ISpeechRecognizerStateChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesisGeneratedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechRecognizer(sender), Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesisGeneratedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession
      ; args : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession(sender), Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionCompletedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession
      ; args : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionResultGeneratedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession(sender), Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionResultGeneratedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      scenario : Windows.Media.SpeechRecognition.SpeechRecognitionScenario
      ; topicHint : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionTopicConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionTopicConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(scenario, topicHint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithTag
   (
      scenario : Windows.Media.SpeechRecognition.SpeechRecognitionScenario
      ; topicHint : Windows.String
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionTopicConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionTopicConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTag(scenario, topicHint, tag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      commands : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionListConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionListConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(commands, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithTag
   (
      commands : Windows.Foundation.Collections.IIterable_String
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionListConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionListConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTag(commands, tag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionGrammarFileConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionGrammarFileConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithTag
   (
      file : Windows.Storage.IStorageFile
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionGrammarFileConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionGrammarFileConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTag(file, tag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      language : Windows.Globalization.ILanguage
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognizer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognizerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognizer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(language, RetVal'Access);
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
   
   
   function get_SystemSpeechLanguage
   return Windows.Globalization.ILanguage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : ISpeechRecognizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.ILanguage;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SystemSpeechLanguage(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedTopicLanguages
   return Windows.Globalization.IVectorView_ILanguage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : ISpeechRecognizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.IVectorView_ILanguage;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedTopicLanguages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedGrammarLanguages
   return Windows.Globalization.IVectorView_ILanguage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : ISpeechRecognizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.IVectorView_ILanguage;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedGrammarLanguages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TrySetSystemSpeechLanguageAsync
   (
      speechLanguage : Windows.Globalization.ILanguage
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : ISpeechRecognizerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetSystemSpeechLanguageAsync(speechLanguage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function InstallCommandSetsFromStorageFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.VoiceCommandManager");
      m_Factory     : IVoiceCommandManager := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandManager'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.InstallCommandSetsFromStorageFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InstalledCommandSets
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.VoiceCommandManager");
      m_Factory     : IVoiceCommandManager := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandManager'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InstalledCommandSets(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
