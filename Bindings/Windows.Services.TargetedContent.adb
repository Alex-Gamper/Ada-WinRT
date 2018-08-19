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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Services.TargetedContent is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ITargetedContentSubscription_Interface
      ; asyncInfo : Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentSubscription
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ITargetedContentContainer_Interface
      ; asyncInfo : Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentContainer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITargetedContentSubscription_add_ContentChanged_Interface
      ; sender : Windows.Services.TargetedContent.ITargetedContentSubscription
      ; args : Windows.Services.TargetedContent.ITargetedContentChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.TargetedContent.ITargetedContentSubscription(sender), Windows.Services.TargetedContent.ITargetedContentChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITargetedContentSubscription_add_AvailabilityChanged_Interface
      ; sender : Windows.Services.TargetedContent.ITargetedContentSubscription
      ; args : Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.TargetedContent.ITargetedContentSubscription(sender), Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ITargetedContentSubscription_add_StateChanged_Interface
      ; sender : Windows.Services.TargetedContent.ITargetedContentSubscription
      ; args : Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Services.TargetedContent.ITargetedContentSubscription(sender), Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetAsync
   (
      subscriptionId : Windows.String
   )
   return Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentSubscription is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.TargetedContent.TargetedContentSubscription");
      m_Factory     : ITargetedContentSubscriptionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentSubscription;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITargetedContentSubscriptionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAsync(subscriptionId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetOptions
   (
      subscriptionId : Windows.String
   )
   return Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.TargetedContent.TargetedContentSubscription");
      m_Factory     : ITargetedContentSubscriptionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITargetedContentSubscriptionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetOptions(subscriptionId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAsync
   (
      contentId : Windows.String
   )
   return Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentContainer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.TargetedContent.TargetedContentContainer");
      m_Factory     : ITargetedContentContainerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.TargetedContent.IAsyncOperation_ITargetedContentContainer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITargetedContentContainerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAsync(contentId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
