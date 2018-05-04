--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
with Windows.Storage.Streams;
with Windows.ApplicationModel.Search;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Search.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access VectorChangedEventHandler_ISearchSuggestion_Interface
      ; sender : Windows.ApplicationModel.Search.Core.IObservableVector_ISearchSuggestion
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, event);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISearchSuggestionManager_add_SuggestionsRequested_Interface
      ; sender : Windows.ApplicationModel.Search.Core.ISearchSuggestionManager
      ; args : Windows.ApplicationModel.Search.Core.ISearchSuggestionsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Search.Core.ISearchSuggestionManager(sender), Windows.ApplicationModel.Search.Core.ISearchSuggestionsRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISearchSuggestionManager_add_RequestingFocusOnKeyboardInput_Interface
      ; sender : Windows.ApplicationModel.Search.Core.ISearchSuggestionManager
      ; args : Windows.ApplicationModel.Search.Core.IRequestingFocusOnKeyboardInputEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Search.Core.ISearchSuggestionManager(sender), Windows.ApplicationModel.Search.Core.IRequestingFocusOnKeyboardInputEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateSearchSuggestionManager return Windows.ApplicationModel.Search.Core.ISearchSuggestionManager is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Search.Core.SearchSuggestionManager");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Search.Core.ISearchSuggestionManager) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Search.Core.IID_ISearchSuggestionManager'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
end;
