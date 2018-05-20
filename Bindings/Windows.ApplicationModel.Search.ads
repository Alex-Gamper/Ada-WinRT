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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Search is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type SearchContract is null record;
   pragma Convention (C_Pass_By_Copy , SearchContract);
   
   type SearchContract_Ptr is access SearchContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ISearchPane_add_VisibilityChanged_Interface;
   type TypedEventHandler_ISearchPane_add_VisibilityChanged is access all TypedEventHandler_ISearchPane_add_VisibilityChanged_Interface'Class;
   type TypedEventHandler_ISearchPane_add_VisibilityChanged_Ptr is access all TypedEventHandler_ISearchPane_add_VisibilityChanged;
   type TypedEventHandler_ISearchPane_add_QueryChanged_Interface;
   type TypedEventHandler_ISearchPane_add_QueryChanged is access all TypedEventHandler_ISearchPane_add_QueryChanged_Interface'Class;
   type TypedEventHandler_ISearchPane_add_QueryChanged_Ptr is access all TypedEventHandler_ISearchPane_add_QueryChanged;
   type TypedEventHandler_ISearchPane_add_SuggestionsRequested_Interface;
   type TypedEventHandler_ISearchPane_add_SuggestionsRequested is access all TypedEventHandler_ISearchPane_add_SuggestionsRequested_Interface'Class;
   type TypedEventHandler_ISearchPane_add_SuggestionsRequested_Ptr is access all TypedEventHandler_ISearchPane_add_SuggestionsRequested;
   type TypedEventHandler_ISearchPane_add_QuerySubmitted_Interface;
   type TypedEventHandler_ISearchPane_add_QuerySubmitted is access all TypedEventHandler_ISearchPane_add_QuerySubmitted_Interface'Class;
   type TypedEventHandler_ISearchPane_add_QuerySubmitted_Ptr is access all TypedEventHandler_ISearchPane_add_QuerySubmitted;
   type TypedEventHandler_ISearchPane_add_ResultSuggestionChosen_Interface;
   type TypedEventHandler_ISearchPane_add_ResultSuggestionChosen is access all TypedEventHandler_ISearchPane_add_ResultSuggestionChosen_Interface'Class;
   type TypedEventHandler_ISearchPane_add_ResultSuggestionChosen_Ptr is access all TypedEventHandler_ISearchPane_add_ResultSuggestionChosen;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISearchPaneVisibilityChangedEventArgs_Interface;
   type ISearchPaneVisibilityChangedEventArgs is access all ISearchPaneVisibilityChangedEventArgs_Interface'Class;
   type ISearchPaneVisibilityChangedEventArgs_Ptr is access all ISearchPaneVisibilityChangedEventArgs;
   type ISearchPaneQueryChangedEventArgs_Interface;
   type ISearchPaneQueryChangedEventArgs is access all ISearchPaneQueryChangedEventArgs_Interface'Class;
   type ISearchPaneQueryChangedEventArgs_Ptr is access all ISearchPaneQueryChangedEventArgs;
   type ISearchPaneQuerySubmittedEventArgs_Interface;
   type ISearchPaneQuerySubmittedEventArgs is access all ISearchPaneQuerySubmittedEventArgs_Interface'Class;
   type ISearchPaneQuerySubmittedEventArgs_Ptr is access all ISearchPaneQuerySubmittedEventArgs;
   type ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails_Interface;
   type ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails is access all ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails_Interface'Class;
   type ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails_Ptr is access all ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails;
   type ISearchPaneResultSuggestionChosenEventArgs_Interface;
   type ISearchPaneResultSuggestionChosenEventArgs is access all ISearchPaneResultSuggestionChosenEventArgs_Interface'Class;
   type ISearchPaneResultSuggestionChosenEventArgs_Ptr is access all ISearchPaneResultSuggestionChosenEventArgs;
   type ISearchPaneSuggestionsRequestDeferral_Interface;
   type ISearchPaneSuggestionsRequestDeferral is access all ISearchPaneSuggestionsRequestDeferral_Interface'Class;
   type ISearchPaneSuggestionsRequestDeferral_Ptr is access all ISearchPaneSuggestionsRequestDeferral;
   type ISearchPaneSuggestionsRequest_Interface;
   type ISearchPaneSuggestionsRequest is access all ISearchPaneSuggestionsRequest_Interface'Class;
   type ISearchPaneSuggestionsRequest_Ptr is access all ISearchPaneSuggestionsRequest;
   type ISearchPaneSuggestionsRequestedEventArgs_Interface;
   type ISearchPaneSuggestionsRequestedEventArgs is access all ISearchPaneSuggestionsRequestedEventArgs_Interface'Class;
   type ISearchPaneSuggestionsRequestedEventArgs_Ptr is access all ISearchPaneSuggestionsRequestedEventArgs;
   type ISearchPaneStatics_Interface;
   type ISearchPaneStatics is access all ISearchPaneStatics_Interface'Class;
   type ISearchPaneStatics_Ptr is access all ISearchPaneStatics;
   type ISearchPaneStaticsWithHideThisApplication_Interface;
   type ISearchPaneStaticsWithHideThisApplication is access all ISearchPaneStaticsWithHideThisApplication_Interface'Class;
   type ISearchPaneStaticsWithHideThisApplication_Ptr is access all ISearchPaneStaticsWithHideThisApplication;
   type ISearchPane_Interface;
   type ISearchPane is access all ISearchPane_Interface'Class;
   type ISearchPane_Ptr is access all ISearchPane;
   type ISearchPaneQueryLinguisticDetails_Interface;
   type ISearchPaneQueryLinguisticDetails is access all ISearchPaneQueryLinguisticDetails_Interface'Class;
   type ISearchPaneQueryLinguisticDetails_Ptr is access all ISearchPaneQueryLinguisticDetails;
   type ISearchSuggestionCollection_Interface;
   type ISearchSuggestionCollection is access all ISearchSuggestionCollection_Interface'Class;
   type ISearchSuggestionCollection_Ptr is access all ISearchSuggestionCollection;
   type ILocalContentSuggestionSettings_Interface;
   type ILocalContentSuggestionSettings is access all ILocalContentSuggestionSettings_Interface'Class;
   type ILocalContentSuggestionSettings_Ptr is access all ILocalContentSuggestionSettings;
   type ISearchQueryLinguisticDetailsFactory_Interface;
   type ISearchQueryLinguisticDetailsFactory is access all ISearchQueryLinguisticDetailsFactory_Interface'Class;
   type ISearchQueryLinguisticDetailsFactory_Ptr is access all ISearchQueryLinguisticDetailsFactory;
   type ISearchQueryLinguisticDetails_Interface;
   type ISearchQueryLinguisticDetails is access all ISearchQueryLinguisticDetails_Interface'Class;
   type ISearchQueryLinguisticDetails_Ptr is access all ISearchQueryLinguisticDetails;
   type ISearchSuggestionsRequestDeferral_Interface;
   type ISearchSuggestionsRequestDeferral is access all ISearchSuggestionsRequestDeferral_Interface'Class;
   type ISearchSuggestionsRequestDeferral_Ptr is access all ISearchSuggestionsRequestDeferral;
   type ISearchSuggestionsRequest_Interface;
   type ISearchSuggestionsRequest is access all ISearchSuggestionsRequest_Interface'Class;
   type ISearchSuggestionsRequest_Ptr is access all ISearchSuggestionsRequest;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneVisibilityChangedEventArgs : aliased constant Windows.IID := (1011691590, 44107, 18930, (151, 214, 2, 14, 97, 130, 203, 156 ));
   
   type ISearchPaneVisibilityChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Visible
   (
      This       : access ISearchPaneVisibilityChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneQueryChangedEventArgs : aliased constant Windows.IID := (1007046633, 9041, 16968, (165, 41, 113, 16, 244, 100, 167, 133 ));
   
   type ISearchPaneQueryChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QueryText
   (
      This       : access ISearchPaneQueryChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ISearchPaneQueryChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LinguisticDetails
   (
      This       : access ISearchPaneQueryChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchPaneQueryLinguisticDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneQuerySubmittedEventArgs : aliased constant Windows.IID := (339453180, 59845, 18230, (145, 178, 232, 235, 156, 184, 131, 86 ));
   
   type ISearchPaneQuerySubmittedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QueryText
   (
      This       : access ISearchPaneQuerySubmittedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ISearchPaneQuerySubmittedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails : aliased constant Windows.IID := (1175229157, 19506, 17720, (164, 212, 182, 180, 64, 13, 20, 15 ));
   
   type ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LinguisticDetails
   (
      This       : access ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchPaneQueryLinguisticDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneResultSuggestionChosenEventArgs : aliased constant Windows.IID := (3358682304, 44754, 16864, (188, 224, 194, 108, 167, 79, 133, 236 ));
   
   type ISearchPaneResultSuggestionChosenEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Tag
   (
      This       : access ISearchPaneResultSuggestionChosenEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneSuggestionsRequestDeferral : aliased constant Windows.IID := (2697988599, 34632, 20194, (173, 68, 175, 166, 190, 153, 124, 81 ));
   
   type ISearchPaneSuggestionsRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ISearchPaneSuggestionsRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneSuggestionsRequest : aliased constant Windows.IID := (2175863580, 58721, 16531, (155, 77, 42, 212, 130, 121, 74, 83 ));
   
   type ISearchPaneSuggestionsRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCanceled
   (
      This       : access ISearchPaneSuggestionsRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SearchSuggestionCollection
   (
      This       : access ISearchPaneSuggestionsRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchSuggestionCollection
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ISearchPaneSuggestionsRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneSuggestionsRequestedEventArgs : aliased constant Windows.IID := (3365636655, 44118, 17504, (141, 47, 128, 2, 59, 236, 79, 197 ));
   
   type ISearchPaneSuggestionsRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access ISearchPaneSuggestionsRequestedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneStatics : aliased constant Windows.IID := (2507320817, 36637, 18463, (161, 91, 198, 22, 85, 241, 106, 14 ));
   
   type ISearchPaneStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ISearchPaneStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchPane
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneStaticsWithHideThisApplication : aliased constant Windows.IID := (7546928, 20721, 19715, (153, 172, 198, 100, 76, 142, 216, 181 ));
   
   type ISearchPaneStaticsWithHideThisApplication_Interface is interface and Windows.IInspectable_Interface;
   
   function HideThisApplication
   (
      This       : access ISearchPaneStaticsWithHideThisApplication_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPane : aliased constant Windows.IID := (4255968312, 14080, 19827, (145, 161, 47, 153, 134, 116, 35, 138 ));
   
   type ISearchPane_Interface is interface and Windows.IInspectable_Interface;
   
   function put_SearchHistoryEnabled
   (
      This       : access ISearchPane_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SearchHistoryEnabled
   (
      This       : access ISearchPane_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SearchHistoryContext
   (
      This       : access ISearchPane_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SearchHistoryContext
   (
      This       : access ISearchPane_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PlaceholderText
   (
      This       : access ISearchPane_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaceholderText
   (
      This       : access ISearchPane_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_QueryText
   (
      This       : access ISearchPane_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ISearchPane_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Visible
   (
      This       : access ISearchPane_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_VisibilityChanged
   (
      This       : access ISearchPane_Interface
      ; handler : TypedEventHandler_ISearchPane_add_VisibilityChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VisibilityChanged
   (
      This       : access ISearchPane_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_QueryChanged
   (
      This       : access ISearchPane_Interface
      ; handler : TypedEventHandler_ISearchPane_add_QueryChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_QueryChanged
   (
      This       : access ISearchPane_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SuggestionsRequested
   (
      This       : access ISearchPane_Interface
      ; handler : TypedEventHandler_ISearchPane_add_SuggestionsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SuggestionsRequested
   (
      This       : access ISearchPane_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_QuerySubmitted
   (
      This       : access ISearchPane_Interface
      ; handler : TypedEventHandler_ISearchPane_add_QuerySubmitted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_QuerySubmitted
   (
      This       : access ISearchPane_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ResultSuggestionChosen
   (
      This       : access ISearchPane_Interface
      ; handler : TypedEventHandler_ISearchPane_add_ResultSuggestionChosen
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ResultSuggestionChosen
   (
      This       : access ISearchPane_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SetLocalContentSuggestionSettings
   (
      This       : access ISearchPane_Interface
      ; settings : Windows.ApplicationModel.Search.ILocalContentSuggestionSettings
   )
   return Windows.HRESULT is abstract;
   
   function ShowOverloadDefault
   (
      This       : access ISearchPane_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ShowOverloadWithQuery
   (
      This       : access ISearchPane_Interface
      ; query : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ShowOnKeyboardInput
   (
      This       : access ISearchPane_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowOnKeyboardInput
   (
      This       : access ISearchPane_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TrySetQueryText
   (
      This       : access ISearchPane_Interface
      ; query : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchPaneQueryLinguisticDetails : aliased constant Windows.IID := (2197505550, 2368, 19309, (184, 208, 100, 43, 48, 152, 158, 21 ));
   
   type ISearchPaneQueryLinguisticDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QueryTextAlternatives
   (
      This       : access ISearchPaneQueryLinguisticDetails_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_QueryTextCompositionStart
   (
      This       : access ISearchPaneQueryLinguisticDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_QueryTextCompositionLength
   (
      This       : access ISearchPaneQueryLinguisticDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchSuggestionCollection : aliased constant Windows.IID := (842697291, 64490, 17478, (171, 188, 61, 167, 145, 95, 221, 58 ));
   
   type ISearchSuggestionCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access ISearchSuggestionCollection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function AppendQuerySuggestion
   (
      This       : access ISearchSuggestionCollection_Interface
      ; text : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AppendQuerySuggestions
   (
      This       : access ISearchSuggestionCollection_Interface
      ; suggestions : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.HRESULT is abstract;
   
   function AppendResultSuggestion
   (
      This       : access ISearchSuggestionCollection_Interface
      ; text : Windows.String
      ; detailText : Windows.String
      ; tag : Windows.String
      ; image : Windows.Storage.Streams.IRandomAccessStreamReference
      ; imageAlternateText : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AppendSearchSeparator
   (
      This       : access ISearchSuggestionCollection_Interface
      ; label : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalContentSuggestionSettings : aliased constant Windows.IID := (4004425826, 29757, 17774, (132, 163, 35, 240, 111, 45, 21, 215 ));
   
   type ILocalContentSuggestionSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Enabled
   (
      This       : access ILocalContentSuggestionSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access ILocalContentSuggestionSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Locations
   (
      This       : access ILocalContentSuggestionSettings_Interface
      ; RetVal : access Windows.Storage.IVector_IStorageFolder -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_AqsFilter
   (
      This       : access ILocalContentSuggestionSettings_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AqsFilter
   (
      This       : access ILocalContentSuggestionSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PropertiesToMatch
   (
      This       : access ILocalContentSuggestionSettings_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchQueryLinguisticDetailsFactory : aliased constant Windows.IID := (3402023864, 15460, 19965, (173, 159, 71, 158, 77, 64, 101, 164 ));
   
   type ISearchQueryLinguisticDetailsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ISearchQueryLinguisticDetailsFactory_Interface
      ; queryTextAlternatives : Windows.Foundation.Collections.IIterable_String
      ; queryTextCompositionStart : Windows.UInt32
      ; queryTextCompositionLength : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Search.ISearchQueryLinguisticDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchQueryLinguisticDetails : aliased constant Windows.IID := (1184964699, 27081, 18245, (183, 47, 168, 164, 252, 143, 36, 174 ));
   
   type ISearchQueryLinguisticDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QueryTextAlternatives
   (
      This       : access ISearchQueryLinguisticDetails_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_QueryTextCompositionStart
   (
      This       : access ISearchQueryLinguisticDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_QueryTextCompositionLength
   (
      This       : access ISearchQueryLinguisticDetails_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchSuggestionsRequestDeferral : aliased constant Windows.IID := (3071645865, 49253, 17773, (168, 69, 30, 204, 236, 93, 194, 139 ));
   
   type ISearchSuggestionsRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ISearchSuggestionsRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchSuggestionsRequest : aliased constant Windows.IID := (1313744551, 17637, 16441, (144, 153, 96, 0, 234, 209, 240, 198 ));
   
   type ISearchSuggestionsRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCanceled
   (
      This       : access ISearchSuggestionsRequest_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SearchSuggestionCollection
   (
      This       : access ISearchSuggestionsRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchSuggestionCollection
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ISearchSuggestionsRequest_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchSuggestionsRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISearchPane_add_VisibilityChanged : aliased constant Windows.IID := (964034418, 38683, 21686, (155, 95, 204, 68, 46, 42, 135, 240 ));
   
   type TypedEventHandler_ISearchPane_add_VisibilityChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Search.ISearchPane ; args : Windows.ApplicationModel.Search.ISearchPaneVisibilityChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISearchPane_add_VisibilityChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_VisibilityChanged_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneVisibilityChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISearchPane_add_QueryChanged : aliased constant Windows.IID := (2093841825, 34663, 24303, (151, 45, 49, 208, 159, 27, 243, 8 ));
   
   type TypedEventHandler_ISearchPane_add_QueryChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Search.ISearchPane ; args : Windows.ApplicationModel.Search.ISearchPaneQueryChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISearchPane_add_QueryChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_QueryChanged_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneQueryChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISearchPane_add_SuggestionsRequested : aliased constant Windows.IID := (2500365760, 27668, 21944, (138, 143, 157, 241, 202, 68, 209, 212 ));
   
   type TypedEventHandler_ISearchPane_add_SuggestionsRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Search.ISearchPane ; args : Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISearchPane_add_SuggestionsRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_SuggestionsRequested_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISearchPane_add_QuerySubmitted : aliased constant Windows.IID := (1594167835, 24998, 24427, (176, 7, 32, 129, 109, 254, 112, 9 ));
   
   type TypedEventHandler_ISearchPane_add_QuerySubmitted_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Search.ISearchPane ; args : Windows.ApplicationModel.Search.ISearchPaneQuerySubmittedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISearchPane_add_QuerySubmitted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_QuerySubmitted_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneQuerySubmittedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISearchPane_add_ResultSuggestionChosen : aliased constant Windows.IID := (3962693076, 15244, 22359, (150, 191, 20, 9, 107, 233, 70, 205 ));
   
   type TypedEventHandler_ISearchPane_add_ResultSuggestionChosen_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Search.ISearchPane ; args : Windows.ApplicationModel.Search.ISearchPaneResultSuggestionChosenEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISearchPane_add_ResultSuggestionChosen'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_ResultSuggestionChosen_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneResultSuggestionChosenEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SearchPaneVisibilityChangedEventArgs is Windows.ApplicationModel.Search.ISearchPaneVisibilityChangedEventArgs;
   subtype SearchPaneQueryChangedEventArgs is Windows.ApplicationModel.Search.ISearchPaneQueryChangedEventArgs;
   subtype SearchPaneQuerySubmittedEventArgs is Windows.ApplicationModel.Search.ISearchPaneQuerySubmittedEventArgs;
   subtype SearchPaneResultSuggestionChosenEventArgs is Windows.ApplicationModel.Search.ISearchPaneResultSuggestionChosenEventArgs;
   subtype SearchPaneSuggestionsRequestDeferral is Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequestDeferral;
   subtype SearchPaneSuggestionsRequest is Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequest;
   subtype SearchPaneSuggestionsRequestedEventArgs is Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequestedEventArgs;
   subtype SearchPane is Windows.ApplicationModel.Search.ISearchPane;
   subtype SearchPaneQueryLinguisticDetails is Windows.ApplicationModel.Search.ISearchPaneQueryLinguisticDetails;
   subtype SearchSuggestionCollection is Windows.ApplicationModel.Search.ISearchSuggestionCollection;
   subtype LocalContentSuggestionSettings is Windows.ApplicationModel.Search.ILocalContentSuggestionSettings;
   function Create return Windows.ApplicationModel.Search.ILocalContentSuggestionSettings;
   
   subtype SearchQueryLinguisticDetails is Windows.ApplicationModel.Search.ISearchQueryLinguisticDetails;
   function CreateInstance
   (
      queryTextAlternatives : Windows.Foundation.Collections.IIterable_String
      ; queryTextCompositionStart : Windows.UInt32
      ; queryTextCompositionLength : Windows.UInt32
   )
   return Windows.ApplicationModel.Search.ISearchQueryLinguisticDetails;
   
   subtype SearchSuggestionsRequestDeferral is Windows.ApplicationModel.Search.ISearchSuggestionsRequestDeferral;
   subtype SearchSuggestionsRequest is Windows.ApplicationModel.Search.ISearchSuggestionsRequest;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   procedure HideThisApplication
   ;
   
   function GetForCurrentView
   return Windows.ApplicationModel.Search.ISearchPane;
   
end;
