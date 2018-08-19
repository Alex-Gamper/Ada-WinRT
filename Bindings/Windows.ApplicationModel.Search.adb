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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Search is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_VisibilityChanged_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneVisibilityChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Search.ISearchPane(sender), Windows.ApplicationModel.Search.ISearchPaneVisibilityChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_QueryChanged_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneQueryChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Search.ISearchPane(sender), Windows.ApplicationModel.Search.ISearchPaneQueryChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_SuggestionsRequested_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Search.ISearchPane(sender), Windows.ApplicationModel.Search.ISearchPaneSuggestionsRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_QuerySubmitted_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneQuerySubmittedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Search.ISearchPane(sender), Windows.ApplicationModel.Search.ISearchPaneQuerySubmittedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISearchPane_add_ResultSuggestionChosen_Interface
      ; sender : Windows.ApplicationModel.Search.ISearchPane
      ; args : Windows.ApplicationModel.Search.ISearchPaneResultSuggestionChosenEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Search.ISearchPane(sender), Windows.ApplicationModel.Search.ISearchPaneResultSuggestionChosenEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.ApplicationModel.Search.ILocalContentSuggestionSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Search.LocalContentSuggestionSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Search.ILocalContentSuggestionSettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Search.IID_ILocalContentSuggestionSettings'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstance
   (
      queryTextAlternatives : Windows.Foundation.Collections.IIterable_String
      ; queryTextCompositionStart : Windows.UInt32
      ; queryTextCompositionLength : Windows.UInt32
   )
   return Windows.ApplicationModel.Search.ISearchQueryLinguisticDetails is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Search.SearchQueryLinguisticDetails");
      m_Factory     : Windows.ApplicationModel.Search.ISearchQueryLinguisticDetailsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Search.ISearchQueryLinguisticDetails := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISearchQueryLinguisticDetailsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(queryTextAlternatives, queryTextCompositionStart, queryTextCompositionLength, RetVal'Access);
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
   
   procedure HideThisApplication
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Search.SearchPane");
      m_Factory     : ISearchPaneStaticsWithHideThisApplication := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISearchPaneStaticsWithHideThisApplication'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.HideThisApplication;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetForCurrentView
   return Windows.ApplicationModel.Search.ISearchPane is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Search.SearchPane");
      m_Factory     : ISearchPaneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Search.ISearchPane;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISearchPaneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
