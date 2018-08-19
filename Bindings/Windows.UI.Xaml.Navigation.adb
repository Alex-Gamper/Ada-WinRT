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
with Windows.UI.Xaml.Interop;
with Windows.UI.Xaml.Media.Animation;
with Windows.UI.Xaml;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Navigation is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access LoadCompletedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Navigation.INavigationEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access NavigatedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Navigation.INavigationEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access NavigatingCancelEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigatingCancelEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Navigation.INavigatingCancelEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access NavigationFailedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigationFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Navigation.INavigationFailedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access NavigationStoppedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Navigation.INavigationEventArgs(e));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      sourcePageType : Windows.UI.Xaml.Interop.TypeName
      ; parameter : Windows.Object
      ; navigationTransitionInfo : Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
   )
   return Windows.UI.Xaml.Navigation.IPageStackEntry is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Navigation.PageStackEntry");
      m_Factory     : Windows.UI.Xaml.Navigation.IPageStackEntryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Navigation.IPageStackEntry := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPageStackEntryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(sourcePageType, parameter, navigationTransitionInfo, RetVal'Access);
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
   
   function get_SourcePageTypeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Navigation.PageStackEntry");
      m_Factory     : IPageStackEntryStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPageStackEntryStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SourcePageTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
