--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage;
limited with Windows.Globalization;
--------------------------------------------------------------------------------
package Windows.Media.SpeechRecognition is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SpeechRecognitionConstraintProbability is (
      Default,
      Min,
      Max
   );
   for SpeechRecognitionConstraintProbability use (
      Default => 0,
      Min => 1,
      Max => 2
   );
   for SpeechRecognitionConstraintProbability'Size use 32;
   
   type SpeechRecognitionConstraintProbability_Ptr is access SpeechRecognitionConstraintProbability;
   
   type SpeechRecognitionConfidence is (
      High,
      Medium,
      Low,
      Rejected
   );
   for SpeechRecognitionConfidence use (
      High => 0,
      Medium => 1,
      Low => 2,
      Rejected => 3
   );
   for SpeechRecognitionConfidence'Size use 32;
   
   type SpeechRecognitionConfidence_Ptr is access SpeechRecognitionConfidence;
   
   type SpeechRecognitionScenario is (
      WebSearch,
      Dictation,
      FormFilling
   );
   for SpeechRecognitionScenario use (
      WebSearch => 0,
      Dictation => 1,
      FormFilling => 2
   );
   for SpeechRecognitionScenario'Size use 32;
   
   type SpeechRecognitionScenario_Ptr is access SpeechRecognitionScenario;
   
   type SpeechRecognitionConstraintType is (
      Topic,
      List,
      Grammar,
      VoiceCommandDefinition
   );
   for SpeechRecognitionConstraintType use (
      Topic => 0,
      List => 1,
      Grammar => 2,
      VoiceCommandDefinition => 3
   );
   for SpeechRecognitionConstraintType'Size use 32;
   
   type SpeechRecognitionConstraintType_Ptr is access SpeechRecognitionConstraintType;
   
   type SpeechRecognizerState is (
      Idle,
      Capturing,
      Processing,
      SoundStarted,
      SoundEnded,
      SpeechDetected,
      Paused
   );
   for SpeechRecognizerState use (
      Idle => 0,
      Capturing => 1,
      Processing => 2,
      SoundStarted => 3,
      SoundEnded => 4,
      SpeechDetected => 5,
      Paused => 6
   );
   for SpeechRecognizerState'Size use 32;
   
   type SpeechRecognizerState_Ptr is access SpeechRecognizerState;
   
   type SpeechRecognitionAudioProblem is (
      None,
      TooNoisy,
      NoSignal,
      TooLoud,
      TooQuiet,
      TooFast,
      TooSlow
   );
   for SpeechRecognitionAudioProblem use (
      None => 0,
      TooNoisy => 1,
      NoSignal => 2,
      TooLoud => 3,
      TooQuiet => 4,
      TooFast => 5,
      TooSlow => 6
   );
   for SpeechRecognitionAudioProblem'Size use 32;
   
   type SpeechRecognitionAudioProblem_Ptr is access SpeechRecognitionAudioProblem;
   
   type SpeechRecognitionResultStatus is (
      Success,
      TopicLanguageNotSupported,
      GrammarLanguageMismatch,
      GrammarCompilationFailure,
      AudioQualityFailure,
      UserCanceled,
      Unknown,
      TimeoutExceeded,
      PauseLimitExceeded,
      NetworkFailure,
      MicrophoneUnavailable
   );
   for SpeechRecognitionResultStatus use (
      Success => 0,
      TopicLanguageNotSupported => 1,
      GrammarLanguageMismatch => 2,
      GrammarCompilationFailure => 3,
      AudioQualityFailure => 4,
      UserCanceled => 5,
      Unknown => 6,
      TimeoutExceeded => 7,
      PauseLimitExceeded => 8,
      NetworkFailure => 9,
      MicrophoneUnavailable => 10
   );
   for SpeechRecognitionResultStatus'Size use 32;
   
   type SpeechRecognitionResultStatus_Ptr is access SpeechRecognitionResultStatus;
   
   type SpeechContinuousRecognitionMode is (
      Default,
      PauseOnRecognition
   );
   for SpeechContinuousRecognitionMode use (
      Default => 0,
      PauseOnRecognition => 1
   );
   for SpeechContinuousRecognitionMode'Size use 32;
   
   type SpeechContinuousRecognitionMode_Ptr is access SpeechContinuousRecognitionMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Interface;
   type AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult is access all AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Interface'Class;
   type AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Ptr is access all AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult;
   type AsyncOperationCompletedHandler_ISpeechRecognitionResult_Interface;
   type AsyncOperationCompletedHandler_ISpeechRecognitionResult is access all AsyncOperationCompletedHandler_ISpeechRecognitionResult_Interface'Class;
   type AsyncOperationCompletedHandler_ISpeechRecognitionResult_Ptr is access all AsyncOperationCompletedHandler_ISpeechRecognitionResult;
   type TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Interface;
   type TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading is access all TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Interface'Class;
   type TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Ptr is access all TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading;
   type TypedEventHandler_ISpeechRecognizer_add_StateChanged_Interface;
   type TypedEventHandler_ISpeechRecognizer_add_StateChanged is access all TypedEventHandler_ISpeechRecognizer_add_StateChanged_Interface'Class;
   type TypedEventHandler_ISpeechRecognizer_add_StateChanged_Ptr is access all TypedEventHandler_ISpeechRecognizer_add_StateChanged;
   type TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Interface;
   type TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated is access all TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Interface'Class;
   type TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Ptr is access all TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated;
   type TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Interface;
   type TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed is access all TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Interface'Class;
   type TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Ptr is access all TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed;
   type TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Interface;
   type TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated is access all TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Interface'Class;
   type TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Ptr is access all TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISpeechRecognitionCompilationResult_Interface;
   type ISpeechRecognitionCompilationResult is access all ISpeechRecognitionCompilationResult_Interface'Class;
   type ISpeechRecognitionCompilationResult_Ptr is access all ISpeechRecognitionCompilationResult;
   type ISpeechRecognizerTimeouts_Interface;
   type ISpeechRecognizerTimeouts is access all ISpeechRecognizerTimeouts_Interface'Class;
   type ISpeechRecognizerTimeouts_Ptr is access all ISpeechRecognizerTimeouts;
   type ISpeechRecognizerUIOptions_Interface;
   type ISpeechRecognizerUIOptions is access all ISpeechRecognizerUIOptions_Interface'Class;
   type ISpeechRecognizerUIOptions_Ptr is access all ISpeechRecognizerUIOptions;
   type ISpeechRecognitionResult_Interface;
   type ISpeechRecognitionResult is access all ISpeechRecognitionResult_Interface'Class;
   type ISpeechRecognitionResult_Ptr is access all ISpeechRecognitionResult;
   type ISpeechRecognitionConstraint_Interface;
   type ISpeechRecognitionConstraint is access all ISpeechRecognitionConstraint_Interface'Class;
   type ISpeechRecognitionConstraint_Ptr is access all ISpeechRecognitionConstraint;
   type ISpeechRecognitionResult2_Interface;
   type ISpeechRecognitionResult2 is access all ISpeechRecognitionResult2_Interface'Class;
   type ISpeechRecognitionResult2_Ptr is access all ISpeechRecognitionResult2;
   type ISpeechRecognitionSemanticInterpretation_Interface;
   type ISpeechRecognitionSemanticInterpretation is access all ISpeechRecognitionSemanticInterpretation_Interface'Class;
   type ISpeechRecognitionSemanticInterpretation_Ptr is access all ISpeechRecognitionSemanticInterpretation;
   type ISpeechRecognitionTopicConstraint_Interface;
   type ISpeechRecognitionTopicConstraint is access all ISpeechRecognitionTopicConstraint_Interface'Class;
   type ISpeechRecognitionTopicConstraint_Ptr is access all ISpeechRecognitionTopicConstraint;
   type ISpeechRecognitionTopicConstraintFactory_Interface;
   type ISpeechRecognitionTopicConstraintFactory is access all ISpeechRecognitionTopicConstraintFactory_Interface'Class;
   type ISpeechRecognitionTopicConstraintFactory_Ptr is access all ISpeechRecognitionTopicConstraintFactory;
   type ISpeechRecognitionListConstraint_Interface;
   type ISpeechRecognitionListConstraint is access all ISpeechRecognitionListConstraint_Interface'Class;
   type ISpeechRecognitionListConstraint_Ptr is access all ISpeechRecognitionListConstraint;
   type ISpeechRecognitionListConstraintFactory_Interface;
   type ISpeechRecognitionListConstraintFactory is access all ISpeechRecognitionListConstraintFactory_Interface'Class;
   type ISpeechRecognitionListConstraintFactory_Ptr is access all ISpeechRecognitionListConstraintFactory;
   type ISpeechRecognitionGrammarFileConstraint_Interface;
   type ISpeechRecognitionGrammarFileConstraint is access all ISpeechRecognitionGrammarFileConstraint_Interface'Class;
   type ISpeechRecognitionGrammarFileConstraint_Ptr is access all ISpeechRecognitionGrammarFileConstraint;
   type ISpeechRecognitionGrammarFileConstraintFactory_Interface;
   type ISpeechRecognitionGrammarFileConstraintFactory is access all ISpeechRecognitionGrammarFileConstraintFactory_Interface'Class;
   type ISpeechRecognitionGrammarFileConstraintFactory_Ptr is access all ISpeechRecognitionGrammarFileConstraintFactory;
   type ISpeechRecognitionVoiceCommandDefinitionConstraint_Interface;
   type ISpeechRecognitionVoiceCommandDefinitionConstraint is access all ISpeechRecognitionVoiceCommandDefinitionConstraint_Interface'Class;
   type ISpeechRecognitionVoiceCommandDefinitionConstraint_Ptr is access all ISpeechRecognitionVoiceCommandDefinitionConstraint;
   type ISpeechRecognitionQualityDegradingEventArgs_Interface;
   type ISpeechRecognitionQualityDegradingEventArgs is access all ISpeechRecognitionQualityDegradingEventArgs_Interface'Class;
   type ISpeechRecognitionQualityDegradingEventArgs_Ptr is access all ISpeechRecognitionQualityDegradingEventArgs;
   type ISpeechRecognizerStateChangedEventArgs_Interface;
   type ISpeechRecognizerStateChangedEventArgs is access all ISpeechRecognizerStateChangedEventArgs_Interface'Class;
   type ISpeechRecognizerStateChangedEventArgs_Ptr is access all ISpeechRecognizerStateChangedEventArgs;
   type ISpeechRecognizer_Interface;
   type ISpeechRecognizer is access all ISpeechRecognizer_Interface'Class;
   type ISpeechRecognizer_Ptr is access all ISpeechRecognizer;
   type ISpeechRecognizerFactory_Interface;
   type ISpeechRecognizerFactory is access all ISpeechRecognizerFactory_Interface'Class;
   type ISpeechRecognizerFactory_Ptr is access all ISpeechRecognizerFactory;
   type ISpeechRecognizerStatics_Interface;
   type ISpeechRecognizerStatics is access all ISpeechRecognizerStatics_Interface'Class;
   type ISpeechRecognizerStatics_Ptr is access all ISpeechRecognizerStatics;
   type ISpeechRecognizerStatics2_Interface;
   type ISpeechRecognizerStatics2 is access all ISpeechRecognizerStatics2_Interface'Class;
   type ISpeechRecognizerStatics2_Ptr is access all ISpeechRecognizerStatics2;
   type ISpeechRecognizer2_Interface;
   type ISpeechRecognizer2 is access all ISpeechRecognizer2_Interface'Class;
   type ISpeechRecognizer2_Ptr is access all ISpeechRecognizer2;
   type ISpeechRecognitionHypothesis_Interface;
   type ISpeechRecognitionHypothesis is access all ISpeechRecognitionHypothesis_Interface'Class;
   type ISpeechRecognitionHypothesis_Ptr is access all ISpeechRecognitionHypothesis;
   type ISpeechRecognitionHypothesisGeneratedEventArgs_Interface;
   type ISpeechRecognitionHypothesisGeneratedEventArgs is access all ISpeechRecognitionHypothesisGeneratedEventArgs_Interface'Class;
   type ISpeechRecognitionHypothesisGeneratedEventArgs_Ptr is access all ISpeechRecognitionHypothesisGeneratedEventArgs;
   type ISpeechContinuousRecognitionSession_Interface;
   type ISpeechContinuousRecognitionSession is access all ISpeechContinuousRecognitionSession_Interface'Class;
   type ISpeechContinuousRecognitionSession_Ptr is access all ISpeechContinuousRecognitionSession;
   type ISpeechContinuousRecognitionCompletedEventArgs_Interface;
   type ISpeechContinuousRecognitionCompletedEventArgs is access all ISpeechContinuousRecognitionCompletedEventArgs_Interface'Class;
   type ISpeechContinuousRecognitionCompletedEventArgs_Ptr is access all ISpeechContinuousRecognitionCompletedEventArgs;
   type ISpeechContinuousRecognitionResultGeneratedEventArgs_Interface;
   type ISpeechContinuousRecognitionResultGeneratedEventArgs is access all ISpeechContinuousRecognitionResultGeneratedEventArgs_Interface'Class;
   type ISpeechContinuousRecognitionResultGeneratedEventArgs_Ptr is access all ISpeechContinuousRecognitionResultGeneratedEventArgs;
   type IVoiceCommandManager_Interface;
   type IVoiceCommandManager is access all IVoiceCommandManager_Interface'Class;
   type IVoiceCommandManager_Ptr is access all IVoiceCommandManager;
   type IVoiceCommandSet_Interface;
   type IVoiceCommandSet is access all IVoiceCommandSet_Interface'Class;
   type IVoiceCommandSet_Ptr is access all IVoiceCommandSet;
   type IIterator_ISpeechRecognitionResult_Interface;
   type IIterator_ISpeechRecognitionResult is access all IIterator_ISpeechRecognitionResult_Interface'Class;
   type IIterator_ISpeechRecognitionResult_Ptr is access all IIterator_ISpeechRecognitionResult;
   type IIterable_ISpeechRecognitionResult_Interface;
   type IIterable_ISpeechRecognitionResult is access all IIterable_ISpeechRecognitionResult_Interface'Class;
   type IIterable_ISpeechRecognitionResult_Ptr is access all IIterable_ISpeechRecognitionResult;
   type IVectorView_ISpeechRecognitionResult_Interface;
   type IVectorView_ISpeechRecognitionResult is access all IVectorView_ISpeechRecognitionResult_Interface'Class;
   type IVectorView_ISpeechRecognitionResult_Ptr is access all IVectorView_ISpeechRecognitionResult;
   type IIterator_ISpeechRecognitionConstraint_Interface;
   type IIterator_ISpeechRecognitionConstraint is access all IIterator_ISpeechRecognitionConstraint_Interface'Class;
   type IIterator_ISpeechRecognitionConstraint_Ptr is access all IIterator_ISpeechRecognitionConstraint;
   type IIterable_ISpeechRecognitionConstraint_Interface;
   type IIterable_ISpeechRecognitionConstraint is access all IIterable_ISpeechRecognitionConstraint_Interface'Class;
   type IIterable_ISpeechRecognitionConstraint_Ptr is access all IIterable_ISpeechRecognitionConstraint;
   type IVectorView_ISpeechRecognitionConstraint_Interface;
   type IVectorView_ISpeechRecognitionConstraint is access all IVectorView_ISpeechRecognitionConstraint_Interface'Class;
   type IVectorView_ISpeechRecognitionConstraint_Ptr is access all IVectorView_ISpeechRecognitionConstraint;
   type IVector_ISpeechRecognitionConstraint_Interface;
   type IVector_ISpeechRecognitionConstraint is access all IVector_ISpeechRecognitionConstraint_Interface'Class;
   type IVector_ISpeechRecognitionConstraint_Ptr is access all IVector_ISpeechRecognitionConstraint;
   type IAsyncOperation_ISpeechRecognitionCompilationResult_Interface;
   type IAsyncOperation_ISpeechRecognitionCompilationResult is access all IAsyncOperation_ISpeechRecognitionCompilationResult_Interface'Class;
   type IAsyncOperation_ISpeechRecognitionCompilationResult_Ptr is access all IAsyncOperation_ISpeechRecognitionCompilationResult;
   type IAsyncOperation_ISpeechRecognitionResult_Interface;
   type IAsyncOperation_ISpeechRecognitionResult is access all IAsyncOperation_ISpeechRecognitionResult_Interface'Class;
   type IAsyncOperation_ISpeechRecognitionResult_Ptr is access all IAsyncOperation_ISpeechRecognitionResult;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionCompilationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ISpeechRecognitionCompilationResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognitionResultStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionCompilationResult : aliased constant Windows.IID := (1082027101, 27335, 19876, (156, 193, 47, 206, 50, 207, 116, 137 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognizerTimeouts_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InitialSilenceTimeout
   (
      This       : access ISpeechRecognizerTimeouts_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialSilenceTimeout
   (
      This       : access ISpeechRecognizerTimeouts_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_EndSilenceTimeout
   (
      This       : access ISpeechRecognizerTimeouts_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_EndSilenceTimeout
   (
      This       : access ISpeechRecognizerTimeouts_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_BabbleTimeout
   (
      This       : access ISpeechRecognizerTimeouts_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_BabbleTimeout
   (
      This       : access ISpeechRecognizerTimeouts_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognizerTimeouts : aliased constant Windows.IID := (787967946, 27196, 19914, (161, 83, 223, 27, 200, 138, 121, 175 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognizerUIOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExampleText
   (
      This       : access ISpeechRecognizerUIOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ExampleText
   (
      This       : access ISpeechRecognizerUIOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudiblePrompt
   (
      This       : access ISpeechRecognizerUIOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AudiblePrompt
   (
      This       : access ISpeechRecognizerUIOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReadBackEnabled
   (
      This       : access ISpeechRecognizerUIOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsReadBackEnabled
   (
      This       : access ISpeechRecognizerUIOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowConfirmation
   (
      This       : access ISpeechRecognizerUIOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShowConfirmation
   (
      This       : access ISpeechRecognizerUIOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognizerUIOptions : aliased constant Windows.IID := (2022233665, 47403, 17594, (162, 95, 209, 134, 70, 48, 100, 31 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognitionResultStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Confidence
   (
      This       : access ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognitionConfidence
   )
   return Windows.HRESULT is abstract;
   
   function get_SemanticInterpretation
   (
      This       : access ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionSemanticInterpretation
   )
   return Windows.HRESULT is abstract;
   
   function GetAlternates
   (
      This       : access ISpeechRecognitionResult_Interface
      ; maxAlternates : Windows.UInt32
      ; RetVal : access Windows.Media.SpeechRecognition.IVectorView_ISpeechRecognitionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Constraint
   (
      This       : access ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   function get_RulePath
   (
      This       : access ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RawConfidence
   (
      This       : access ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionResult : aliased constant Windows.IID := (1311781207, 846, 18002, (133, 126, 208, 69, 76, 196, 190, 236 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access ISpeechRecognitionConstraint_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Tag
   (
      This       : access ISpeechRecognitionConstraint_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognitionConstraintType
   )
   return Windows.HRESULT is abstract;
   
   function get_Probability
   (
      This       : access ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognitionConstraintProbability
   )
   return Windows.HRESULT is abstract;
   
   function put_Probability
   (
      This       : access ISpeechRecognitionConstraint_Interface
      ; value : Windows.Media.SpeechRecognition.SpeechRecognitionConstraintProbability
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionConstraint : aliased constant Windows.IID := (2041321000, 19816, 17348, (137, 17, 64, 220, 65, 1, 181, 91 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PhraseStartTime
   (
      This       : access ISpeechRecognitionResult2_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_PhraseDuration
   (
      This       : access ISpeechRecognitionResult2_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionResult2 : aliased constant Windows.IID := (2944324026, 17691, 16742, (160, 193, 31, 254, 132, 3, 45, 3 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionSemanticInterpretation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Properties
   (
      This       : access ISpeechRecognitionSemanticInterpretation_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionSemanticInterpretation : aliased constant Windows.IID := (2866928283, 32306, 19487, (137, 254, 12, 101, 244, 134, 245, 46 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionTopicConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Scenario
   (
      This       : access ISpeechRecognitionTopicConstraint_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognitionScenario
   )
   return Windows.HRESULT is abstract;
   
   function get_TopicHint
   (
      This       : access ISpeechRecognitionTopicConstraint_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionTopicConstraint : aliased constant Windows.IID := (3211779865, 33373, 20073, (166, 129, 54, 228, 140, 241, 201, 62 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionTopicConstraintFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISpeechRecognitionTopicConstraintFactory_Interface
      ; scenario : Windows.Media.SpeechRecognition.SpeechRecognitionScenario
      ; topicHint : Windows.String
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTag
   (
      This       : access ISpeechRecognitionTopicConstraintFactory_Interface
      ; scenario : Windows.Media.SpeechRecognition.SpeechRecognitionScenario
      ; topicHint : Windows.String
      ; tag : Windows.String
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionTopicConstraintFactory : aliased constant Windows.IID := (1852335071, 60421, 18391, (165, 223, 86, 163, 67, 30, 88, 210 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionListConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Commands
   (
      This       : access ISpeechRecognitionListConstraint_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionListConstraint : aliased constant Windows.IID := (163874793, 58541, 17702, (129, 242, 73, 70, 251, 72, 29, 152 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionListConstraintFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISpeechRecognitionListConstraintFactory_Interface
      ; commands : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTag
   (
      This       : access ISpeechRecognitionListConstraintFactory_Interface
      ; commands : Windows.Foundation.Collections.IIterable_String
      ; tag : Windows.String
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionListConstraintFactory : aliased constant Windows.IID := (1089719751, 22058, 17002, (159, 59, 59, 78, 40, 43, 225, 213 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionGrammarFileConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GrammarFile
   (
      This       : access ISpeechRecognitionGrammarFileConstraint_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionGrammarFileConstraint : aliased constant Windows.IID := (3036879503, 34250, 20388, (177, 26, 71, 79, 196, 27, 56, 53 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionGrammarFileConstraintFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISpeechRecognitionGrammarFileConstraintFactory_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithTag
   (
      This       : access ISpeechRecognitionGrammarFileConstraintFactory_Interface
      ; file : Windows.Storage.IStorageFile
      ; tag : Windows.String
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionGrammarFileConstraintFactory : aliased constant Windows.IID := (1034383595, 50297, 19495, (159, 25, 137, 151, 78, 243, 146, 209 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionVoiceCommandDefinitionConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ISpeechRecognitionVoiceCommandDefinitionConstraint : aliased constant Windows.IID := (4068023339, 7924, 19175, (157, 119, 182, 255, 16, 184, 163, 194 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionQualityDegradingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Problem
   (
      This       : access ISpeechRecognitionQualityDegradingEventArgs_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognitionAudioProblem
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionQualityDegradingEventArgs : aliased constant Windows.IID := (1340227845, 35898, 19582, (141, 10, 91, 212, 245, 177, 74, 216 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognizerStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access ISpeechRecognizerStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognizerState
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognizerStateChangedEventArgs : aliased constant Windows.IID := (1446858505, 47619, 19373, (173, 129, 221, 198, 196, 218, 176, 195 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognizer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentLanguage
   (
      This       : access ISpeechRecognizer_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function get_Constraints
   (
      This       : access ISpeechRecognizer_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.IVector_ISpeechRecognitionConstraint -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Timeouts
   (
      This       : access ISpeechRecognizer_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognizerTimeouts
   )
   return Windows.HRESULT is abstract;
   
   function get_UIOptions
   (
      This       : access ISpeechRecognizer_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognizerUIOptions
   )
   return Windows.HRESULT is abstract;
   
   function CompileConstraintsAsync
   (
      This       : access ISpeechRecognizer_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionCompilationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RecognizeAsync
   (
      This       : access ISpeechRecognizer_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RecognizeWithUIAsync
   (
      This       : access ISpeechRecognizer_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_RecognitionQualityDegrading
   (
      This       : access ISpeechRecognizer_Interface
      ; speechRecognitionQualityDegradingHandler : TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecognitionQualityDegrading
   (
      This       : access ISpeechRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access ISpeechRecognizer_Interface
      ; stateChangedHandler : TypedEventHandler_ISpeechRecognizer_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access ISpeechRecognizer_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognizer : aliased constant Windows.IID := (197380555, 49770, 16626, (174, 181, 128, 150, 178, 228, 128, 115 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognizerFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ISpeechRecognizerFactory_Interface
      ; language : Windows.Globalization.ILanguage
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognizer
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognizerFactory : aliased constant Windows.IID := (1623492829, 32696, 16435, (172, 112, 208, 70, 246, 72, 24, 225 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognizerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SystemSpeechLanguage
   (
      This       : access ISpeechRecognizerStatics_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedTopicLanguages
   (
      This       : access ISpeechRecognizerStatics_Interface
      ; RetVal : access Windows.Globalization.IVectorView_ILanguage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedGrammarLanguages
   (
      This       : access ISpeechRecognizerStatics_Interface
      ; RetVal : access Windows.Globalization.IVectorView_ILanguage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognizerStatics : aliased constant Windows.IID := (2275630764, 42972, 19211, (188, 201, 36, 244, 124, 11, 126, 191 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognizerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function TrySetSystemSpeechLanguageAsync
   (
      This       : access ISpeechRecognizerStatics2_Interface
      ; speechLanguage : Windows.Globalization.ILanguage
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognizerStatics2 : aliased constant Windows.IID := (488312213, 30053, 20217, (162, 243, 186, 21, 22, 42, 150, 207 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognizer2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContinuousRecognitionSession
   (
      This       : access ISpeechRecognizer2_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access ISpeechRecognizer2_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognizerState
   )
   return Windows.HRESULT is abstract;
   
   function StopRecognitionAsync
   (
      This       : access ISpeechRecognizer2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_HypothesisGenerated
   (
      This       : access ISpeechRecognizer2_Interface
      ; value : TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HypothesisGenerated
   (
      This       : access ISpeechRecognizer2_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognizer2 : aliased constant Windows.IID := (1674164977, 37347, 20132, (134, 161, 124, 56, 103, 208, 132, 166 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionHypothesis_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access ISpeechRecognitionHypothesis_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionHypothesis : aliased constant Windows.IID := (2054890928, 39365, 20349, (191, 132, 16, 170, 19, 2, 182, 52 ));
   
   ------------------------------------------------------------------------
   type ISpeechRecognitionHypothesisGeneratedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Hypothesis
   (
      This       : access ISpeechRecognitionHypothesisGeneratedEventArgs_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesis
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechRecognitionHypothesisGeneratedEventArgs : aliased constant Windows.IID := (1427511930, 32803, 22630, (65, 29, 18, 19, 187, 39, 20, 118 ));
   
   ------------------------------------------------------------------------
   type ISpeechContinuousRecognitionSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AutoStopSilenceTimeout
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoStopSilenceTimeout
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartWithModeAsync
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; mode : Windows.Media.SpeechRecognition.SpeechContinuousRecognitionMode
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopAsync
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CancelAsync
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function PauseAsync
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function Resume
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; value : TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ResultGenerated
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; value : TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ResultGenerated
   (
      This       : access ISpeechContinuousRecognitionSession_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechContinuousRecognitionSession : aliased constant Windows.IID := (1780562948, 26132, 18936, (153, 162, 181, 233, 179, 160, 133, 200 ));
   
   ------------------------------------------------------------------------
   type ISpeechContinuousRecognitionCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ISpeechContinuousRecognitionCompletedEventArgs_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.SpeechRecognitionResultStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechContinuousRecognitionCompletedEventArgs : aliased constant Windows.IID := (3822086587, 58124, 24088, (66, 75, 127, 190, 129, 248, 251, 208 ));
   
   ------------------------------------------------------------------------
   type ISpeechContinuousRecognitionResultGeneratedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Result
   (
      This       : access ISpeechContinuousRecognitionResultGeneratedEventArgs_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   IID_ISpeechContinuousRecognitionResultGeneratedEventArgs : aliased constant Windows.IID := (420027934, 28286, 23110, (64, 251, 118, 89, 79, 120, 101, 4 ));
   
   ------------------------------------------------------------------------
   type IVoiceCommandManager_Interface is interface and Windows.IInspectable_Interface;
   
   function InstallCommandSetsFromStorageFileAsync
   (
      This       : access IVoiceCommandManager_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_InstalledCommandSets
   (
      This       : access IVoiceCommandManager_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IVoiceCommandManager : aliased constant Windows.IID := (2855964117, 46823, 20194, (186, 169, 221, 107, 172, 237, 10, 43 ));
   
   ------------------------------------------------------------------------
   type IVoiceCommandSet_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Language
   (
      This       : access IVoiceCommandSet_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IVoiceCommandSet_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetPhraseListAsync
   (
      This       : access IVoiceCommandSet_Interface
      ; phraseListName : Windows.String
      ; phraseList : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IVoiceCommandSet : aliased constant Windows.IID := (200137333, 18150, 19217, (160, 136, 92, 104, 99, 40, 153, 181 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISpeechRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISpeechRecognitionResult_Interface
      ; items : Windows.Media.SpeechRecognition.ISpeechRecognitionResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISpeechRecognitionResult : aliased constant Windows.IID := (544566738, 27967, 21513, (132, 106, 15, 15, 1, 215, 191, 154 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISpeechRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.IIterator_ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISpeechRecognitionResult : aliased constant Windows.IID := (228293448, 39073, 23330, (154, 102, 111, 129, 47, 89, 71, 170 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISpeechRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISpeechRecognitionResult_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISpeechRecognitionResult_Interface
      ; value : Windows.Media.SpeechRecognition.ISpeechRecognitionResult
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISpeechRecognitionResult_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.SpeechRecognition.ISpeechRecognitionResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISpeechRecognitionResult : aliased constant Windows.IID := (238518543, 7654, 20889, (131, 63, 90, 107, 11, 217, 30, 35 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISpeechRecognitionConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISpeechRecognitionConstraint_Interface
      ; items : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISpeechRecognitionConstraint : aliased constant Windows.IID := (1938751665, 57740, 20800, (165, 58, 241, 120, 141, 16, 201, 61 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISpeechRecognitionConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.IIterator_ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISpeechRecognitionConstraint : aliased constant Windows.IID := (2296791916, 12883, 21003, (158, 216, 166, 59, 23, 140, 68, 162 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISpeechRecognitionConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISpeechRecognitionConstraint_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISpeechRecognitionConstraint_Interface
      ; value : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISpeechRecognitionConstraint_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISpeechRecognitionConstraint : aliased constant Windows.IID := (874376733, 27330, 23814, (144, 38, 179, 10, 218, 32, 86, 101 ));
   
   ------------------------------------------------------------------------
   type IVector_ISpeechRecognitionConstraint_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.IVectorView_ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; value : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; value : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISpeechRecognitionConstraint_Interface
      ; items : Windows.Media.SpeechRecognition.ISpeechRecognitionConstraint_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_ISpeechRecognitionConstraint : aliased constant Windows.IID := (647092067, 22046, 20576, (187, 201, 123, 7, 54, 26, 204, 149 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISpeechRecognitionCompilationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISpeechRecognitionCompilationResult_Interface
      ; handler : Windows.Media.SpeechRecognition.AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISpeechRecognitionCompilationResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISpeechRecognitionCompilationResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionCompilationResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISpeechRecognitionCompilationResult : aliased constant Windows.IID := (2744263834, 57994, 22090, (158, 115, 29, 218, 99, 202, 100, 60 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISpeechRecognitionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISpeechRecognitionResult_Interface
      ; handler : Windows.Media.SpeechRecognition.AsyncOperationCompletedHandler_ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.AsyncOperationCompletedHandler_ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISpeechRecognitionResult_Interface
      ; RetVal : access Windows.Media.SpeechRecognition.ISpeechRecognitionResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISpeechRecognitionResult : aliased constant Windows.IID := (3124685800, 36220, 20978, (158, 212, 235, 175, 227, 103, 77, 180 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionCompilationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Interface
      ; asyncInfo : Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionCompilationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult : aliased constant Windows.IID := (2026396093, 5332, 23616, (171, 255, 73, 6, 22, 213, 233, 45 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISpeechRecognitionResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISpeechRecognitionResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpeechRecognitionResult_Interface
      ; asyncInfo : Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISpeechRecognitionResult : aliased constant Windows.IID := (3256441981, 56514, 23661, (145, 98, 200, 223, 102, 82, 135, 98 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Interface(Callback : access procedure (sender : Windows.Media.SpeechRecognition.ISpeechRecognizer ; args : Windows.Media.SpeechRecognition.ISpeechRecognitionQualityDegradingEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognitionQualityDegradingEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading : aliased constant Windows.IID := (365590808, 25042, 22450, (185, 51, 68, 6, 62, 139, 182, 98 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISpeechRecognizer_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Media.SpeechRecognition.ISpeechRecognizer ; args : Windows.Media.SpeechRecognition.ISpeechRecognizerStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISpeechRecognizer_add_StateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechRecognizer_add_StateChanged_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognizerStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISpeechRecognizer_add_StateChanged : aliased constant Windows.IID := (3508035218, 23600, 21857, (179, 226, 232, 45, 219, 216, 114, 195 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Interface(Callback : access procedure (sender : Windows.Media.SpeechRecognition.ISpeechRecognizer ; args : Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesisGeneratedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesisGeneratedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated : aliased constant Windows.IID := (1286888122, 30067, 21594, (178, 154, 233, 190, 53, 189, 70, 130 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Interface(Callback : access procedure (sender : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession ; args : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession
      ; args : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionCompletedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed : aliased constant Windows.IID := (2164506648, 31058, 23033, (159, 65, 35, 177, 125, 110, 69, 45 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Interface(Callback : access procedure (sender : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession ; args : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionResultGeneratedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession
      ; args : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionResultGeneratedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated : aliased constant Windows.IID := (639180915, 41673, 21117, (155, 211, 145, 28, 5, 224, 1, 30 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SpeechRecognitionSemanticInterpretation is Windows.Media.SpeechRecognition.ISpeechRecognitionSemanticInterpretation;
   subtype SpeechRecognitionResult is Windows.Media.SpeechRecognition.ISpeechRecognitionResult;
   subtype SpeechRecognitionTopicConstraint is Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint;
   
   function Create
   (
      scenario : Windows.Media.SpeechRecognition.SpeechRecognitionScenario
      ; topicHint : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint;
   
   function CreateWithTag
   (
      scenario : Windows.Media.SpeechRecognition.SpeechRecognitionScenario
      ; topicHint : Windows.String
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint;
   
   subtype SpeechRecognitionListConstraint is Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint;
   
   function Create
   (
      commands : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint;
   
   function CreateWithTag
   (
      commands : Windows.Foundation.Collections.IIterable_String
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint;
   
   subtype SpeechRecognitionGrammarFileConstraint is Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint;
   
   function Create
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint;
   
   function CreateWithTag
   (
      file : Windows.Storage.IStorageFile
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint;
   
   subtype SpeechRecognizerTimeouts is Windows.Media.SpeechRecognition.ISpeechRecognizerTimeouts;
   subtype SpeechRecognizerUIOptions is Windows.Media.SpeechRecognition.ISpeechRecognizerUIOptions;
   subtype SpeechRecognitionCompilationResult is Windows.Media.SpeechRecognition.ISpeechRecognitionCompilationResult;
   subtype SpeechRecognizer is Windows.Media.SpeechRecognition.ISpeechRecognizer;
   
   function Create
   (
      language : Windows.Globalization.ILanguage
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognizer;
   
   subtype SpeechRecognitionQualityDegradingEventArgs is Windows.Media.SpeechRecognition.ISpeechRecognitionQualityDegradingEventArgs;
   subtype SpeechRecognizerStateChangedEventArgs is Windows.Media.SpeechRecognition.ISpeechRecognizerStateChangedEventArgs;
   subtype SpeechRecognitionVoiceCommandDefinitionConstraint is Windows.Media.SpeechRecognition.ISpeechRecognitionVoiceCommandDefinitionConstraint;
   subtype SpeechContinuousRecognitionSession is Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession;
   subtype SpeechRecognitionHypothesisGeneratedEventArgs is Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesisGeneratedEventArgs;
   subtype SpeechRecognitionHypothesis is Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesis;
   subtype SpeechContinuousRecognitionCompletedEventArgs is Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionCompletedEventArgs;
   subtype SpeechContinuousRecognitionResultGeneratedEventArgs is Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionResultGeneratedEventArgs;
   subtype VoiceCommandSet is Windows.Media.SpeechRecognition.IVoiceCommandSet;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_SystemSpeechLanguage
   return Windows.Globalization.ILanguage;
   
   function get_SupportedTopicLanguages
   return Windows.Globalization.IVectorView_ILanguage;
   
   function get_SupportedGrammarLanguages
   return Windows.Globalization.IVectorView_ILanguage;
   
   function TrySetSystemSpeechLanguageAsync
   (
      speechLanguage : Windows.Globalization.ILanguage
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function InstallCommandSetsFromStorageFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction;
   
   function get_InstalledCommandSets
   return Windows.Address;

end;
