--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Search.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SearchSuggestionKind is (
      Query,
      Result,
      Separator
   );
   for SearchSuggestionKind use (
      Query => 0,
      Result => 1,
      Separator => 2
   );
   for SearchSuggestionKind'Size use 32;
   
   type SearchSuggestionKind_Ptr is access SearchSuggestionKind;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type SearchCoreContract is null record;
   pragma Convention (C_Pass_By_Copy , SearchCoreContract);
   
   type SearchCoreContract_Ptr is access SearchCoreContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type VectorChangedEventHandler_ISearchSuggestion_Interface;
   type VectorChangedEventHandler_ISearchSuggestion is access all VectorChangedEventHandler_ISearchSuggestion_Interface'Class;
   type VectorChangedEventHandler_ISearchSuggestion_Ptr is access all VectorChangedEventHandler_ISearchSuggestion;
   type TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested_Interface;
   type TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested is access all TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested_Interface'Class;
   type TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested_Ptr is access all TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested;
   type TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput_Interface;
   type TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput is access all TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput_Interface'Class;
   type TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput_Ptr is access all TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISearchSuggestion_Interface;
   type ISearchSuggestion is access all ISearchSuggestion_Interface'Class;
   type ISearchSuggestion_Ptr is access all ISearchSuggestion;
   type ISearchSuggestionsRequestedEventArgs_Interface;
   type ISearchSuggestionsRequestedEventArgs is access all ISearchSuggestionsRequestedEventArgs_Interface'Class;
   type ISearchSuggestionsRequestedEventArgs_Ptr is access all ISearchSuggestionsRequestedEventArgs;
   type IRequestingFocusOnKeyboardInputEventArgs_Interface;
   type IRequestingFocusOnKeyboardInputEventArgs is access all IRequestingFocusOnKeyboardInputEventArgs_Interface'Class;
   type IRequestingFocusOnKeyboardInputEventArgs_Ptr is access all IRequestingFocusOnKeyboardInputEventArgs;
   type ISearchSuggestionManager_Interface;
   type ISearchSuggestionManager is access all ISearchSuggestionManager_Interface'Class;
   type ISearchSuggestionManager_Ptr is access all ISearchSuggestionManager;
   type IIterator_ISearchSuggestion_Interface;
   type IIterator_ISearchSuggestion is access all IIterator_ISearchSuggestion_Interface'Class;
   type IIterator_ISearchSuggestion_Ptr is access all IIterator_ISearchSuggestion;
   type IIterable_ISearchSuggestion_Interface;
   type IIterable_ISearchSuggestion is access all IIterable_ISearchSuggestion_Interface'Class;
   type IIterable_ISearchSuggestion_Ptr is access all IIterable_ISearchSuggestion;
   type IVectorView_ISearchSuggestion_Interface;
   type IVectorView_ISearchSuggestion is access all IVectorView_ISearchSuggestion_Interface'Class;
   type IVectorView_ISearchSuggestion_Ptr is access all IVectorView_ISearchSuggestion;
   type IVector_ISearchSuggestion_Interface;
   type IVector_ISearchSuggestion is access all IVector_ISearchSuggestion_Interface'Class;
   type IVector_ISearchSuggestion_Ptr is access all IVector_ISearchSuggestion;
   type IObservableVector_ISearchSuggestion_Interface;
   type IObservableVector_ISearchSuggestion is access all IObservableVector_ISearchSuggestion_Interface'Class;
   type IObservableVector_ISearchSuggestion_Ptr is access all IObservableVector_ISearchSuggestion;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISearchSuggestion : aliased constant Windows.IID := (1532318896, 5415, 17275, (149, 197, 141, 24, 210, 184, 175, 85 ));
   
   type ISearchSuggestion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access ISearchSuggestion_Interface
      ; RetVal : access Windows.ApplicationModel.Search.Core.SearchSuggestionKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access ISearchSuggestion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access ISearchSuggestion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DetailText
   (
      This       : access ISearchSuggestion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Image
   (
      This       : access ISearchSuggestion_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageAlternateText
   (
      This       : access ISearchSuggestion_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISearchSuggestionsRequestedEventArgs : aliased constant Windows.IID := (1876236773, 40574, 19124, (139, 227, 199, 107, 27, 212, 52, 74 ));
   
   type ISearchSuggestionsRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QueryText
   (
      This       : access ISearchSuggestionsRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access ISearchSuggestionsRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LinguisticDetails
   (
      This       : access ISearchSuggestionsRequestedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchQueryLinguisticDetails
   )
   return Windows.HRESULT is abstract;
   
   function get_Request
   (
      This       : access ISearchSuggestionsRequestedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Search.ISearchSuggestionsRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRequestingFocusOnKeyboardInputEventArgs : aliased constant Windows.IID := (2702794535, 45479, 16802, (135, 157, 106, 104, 104, 126, 89, 133 ));
   
   type IRequestingFocusOnKeyboardInputEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISearchSuggestionManager : aliased constant Windows.IID := (1057771681, 52125, 18811, (181, 0, 60, 4, 172, 149, 154, 210 ));
   
   type ISearchSuggestionManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SearchHistoryEnabled
   (
      This       : access ISearchSuggestionManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SearchHistoryEnabled
   (
      This       : access ISearchSuggestionManager_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SearchHistoryContext
   (
      This       : access ISearchSuggestionManager_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SearchHistoryContext
   (
      This       : access ISearchSuggestionManager_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetLocalContentSuggestionSettings
   (
      This       : access ISearchSuggestionManager_Interface
      ; settings : Windows.ApplicationModel.Search.ILocalContentSuggestionSettings
   )
   return Windows.HRESULT is abstract;
   
   function SetQuery
   (
      This       : access ISearchSuggestionManager_Interface
      ; queryText : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetQueryWithLanguage
   (
      This       : access ISearchSuggestionManager_Interface
      ; queryText : Windows.String
      ; language : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetQueryWithSearchQueryLinguisticDetails
   (
      This       : access ISearchSuggestionManager_Interface
      ; queryText : Windows.String
      ; language : Windows.String
      ; linguisticDetails : Windows.ApplicationModel.Search.ISearchQueryLinguisticDetails
   )
   return Windows.HRESULT is abstract;
   
   function get_Suggestions
   (
      This       : access ISearchSuggestionManager_Interface
      ; RetVal : access Windows.ApplicationModel.Search.Core.IObservableVector_ISearchSuggestion -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddToHistory
   (
      This       : access ISearchSuggestionManager_Interface
      ; queryText : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddToHistoryWithLanguage
   (
      This       : access ISearchSuggestionManager_Interface
      ; queryText : Windows.String
      ; language : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ClearHistory
   (
      This       : access ISearchSuggestionManager_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_SuggestionsRequested
   (
      This       : access ISearchSuggestionManager_Interface
      ; handler : TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SuggestionsRequested
   (
      This       : access ISearchSuggestionManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RequestingFocusOnKeyboardInput
   (
      This       : access ISearchSuggestionManager_Interface
      ; handler : TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RequestingFocusOnKeyboardInput
   (
      This       : access ISearchSuggestionManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ISearchSuggestion : aliased constant Windows.IID := (3272963458, 63279, 20794, (176, 137, 98, 8, 24, 142, 194, 182 ));
   
   type IIterator_ISearchSuggestion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISearchSuggestion_Interface
      ; RetVal : access Windows.ApplicationModel.Search.Core.ISearchSuggestion
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISearchSuggestion_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISearchSuggestion_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISearchSuggestion_Interface
      ; items : Windows.ApplicationModel.Search.Core.ISearchSuggestion_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ISearchSuggestion : aliased constant Windows.IID := (3751108960, 61781, 22550, (179, 139, 162, 255, 6, 41, 186, 14 ));
   
   type IIterable_ISearchSuggestion_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISearchSuggestion_Interface
      ; RetVal : access Windows.ApplicationModel.Search.Core.IIterator_ISearchSuggestion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ISearchSuggestion : aliased constant Windows.IID := (95170240, 61640, 23725, (180, 249, 249, 133, 224, 247, 159, 233 ));
   
   type IVectorView_ISearchSuggestion_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISearchSuggestion_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Search.Core.ISearchSuggestion
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISearchSuggestion_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISearchSuggestion_Interface
      ; value : Windows.ApplicationModel.Search.Core.ISearchSuggestion
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISearchSuggestion_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Search.Core.ISearchSuggestion_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ISearchSuggestion : aliased constant Windows.IID := (482569286, 6590, 23915, (165, 109, 4, 116, 19, 37, 44, 105 ));
   
   type IVector_ISearchSuggestion_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Search.Core.ISearchSuggestion
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; RetVal : access Windows.ApplicationModel.Search.Core.IVectorView_ISearchSuggestion
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; value : Windows.ApplicationModel.Search.Core.ISearchSuggestion
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Search.Core.ISearchSuggestion
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Search.Core.ISearchSuggestion
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; value : Windows.ApplicationModel.Search.Core.ISearchSuggestion
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISearchSuggestion_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISearchSuggestion_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Search.Core.ISearchSuggestion_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISearchSuggestion_Interface
      ; items : Windows.ApplicationModel.Search.Core.ISearchSuggestion_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IObservableVector_ISearchSuggestion : aliased constant Windows.IID := (3901068652, 29377, 20815, (173, 154, 41, 67, 184, 128, 174, 19 ));
   
   type IObservableVector_ISearchSuggestion_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IObservableVector_ISearchSuggestion_Interface
      ; vhnd : Windows.ApplicationModel.Search.Core.VectorChangedEventHandler_ISearchSuggestion
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IObservableVector_ISearchSuggestion_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_VectorChangedEventHandler_ISearchSuggestion : aliased constant Windows.IID := (3413874827, 18058, 24238, (175, 228, 223, 139, 0, 95, 128, 175 ));
   
   type VectorChangedEventHandler_ISearchSuggestion_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Search.Core.IObservableVector_ISearchSuggestion ; event : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_VectorChangedEventHandler_ISearchSuggestion'access) with null record;
   function Invoke
   (
      This       : access VectorChangedEventHandler_ISearchSuggestion_Interface
      ; sender : Windows.ApplicationModel.Search.Core.IObservableVector_ISearchSuggestion
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested : aliased constant Windows.IID := (2122267871, 32985, 22086, (135, 67, 236, 30, 56, 100, 93, 104 ));
   
   type TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Search.Core.ISearchSuggestionManager ; args : Windows.ApplicationModel.Search.Core.ISearchSuggestionsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested_Interface
      ; sender : Windows.ApplicationModel.Search.Core.ISearchSuggestionManager
      ; args : Windows.ApplicationModel.Search.Core.ISearchSuggestionsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput : aliased constant Windows.IID := (3139012448, 18233, 21849, (128, 230, 240, 225, 175, 83, 85, 253 ));
   
   type TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Search.Core.ISearchSuggestionManager ; args : Windows.ApplicationModel.Search.Core.IRequestingFocusOnKeyboardInputEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput_Interface
      ; sender : Windows.ApplicationModel.Search.Core.ISearchSuggestionManager
      ; args : Windows.ApplicationModel.Search.Core.IRequestingFocusOnKeyboardInputEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SearchSuggestion is Windows.ApplicationModel.Search.Core.ISearchSuggestion;
   subtype SearchSuggestionManager is Windows.ApplicationModel.Search.Core.ISearchSuggestionManager;
   
   function CreateSearchSuggestionManager return Windows.ApplicationModel.Search.Core.ISearchSuggestionManager;
   
   subtype SearchSuggestionsRequestedEventArgs is Windows.ApplicationModel.Search.Core.ISearchSuggestionsRequestedEventArgs;
   subtype RequestingFocusOnKeyboardInputEventArgs is Windows.ApplicationModel.Search.Core.IRequestingFocusOnKeyboardInputEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
