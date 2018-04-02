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
with Windows.Data.Xml.Dom;
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.Syndication is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncActionProgressHandler_TransferProgress_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncActionProgressHandler_TransferProgress or riid.all = IID_IUnknown then
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
      This       : access AsyncActionProgressHandler_TransferProgress_Interface
      ; asyncInfo : Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress
      ; progressInfo : Windows.Web.Syndication.TransferProgress
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, progressInfo);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncActionWithProgressCompletedHandler_TransferProgress_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncActionWithProgressCompletedHandler_TransferProgress or riid.all = IID_IUnknown then
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
      This       : access AsyncActionWithProgressCompletedHandler_TransferProgress_Interface
      ; asyncInfo : Windows.Web.Syndication.IAsyncActionWithProgress_TransferProgress
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
   
   
   function CreateSyndicationAttribute return Windows.Web.Syndication.ISyndicationAttribute is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationAttribute");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationAttribute := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.Syndication.IID_ISyndicationAttribute'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationNode
   (
      nodeName : Windows.String
      ; nodeNamespace : Windows.String
      ; nodeValue : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationNode is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationNode");
      m_Factory     : Windows.Web.Syndication.ISyndicationNodeFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationNode := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationNodeFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationNode(nodeName, nodeNamespace, nodeValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationGenerator
   (
      text : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationGenerator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationGenerator");
      m_Factory     : Windows.Web.Syndication.ISyndicationGeneratorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationGenerator := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationGeneratorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationGenerator(text, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationText return Windows.Web.Syndication.ISyndicationText is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationText");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationText := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.Syndication.IID_ISyndicationText'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationContent
   (
      text : Windows.String
      ; type_x : Windows.Web.Syndication.SyndicationTextType
   )
   return Windows.Web.Syndication.ISyndicationContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationContent");
      m_Factory     : Windows.Web.Syndication.ISyndicationContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationContent(text, type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationContentWithSourceUri
   (
      sourceUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Web.Syndication.ISyndicationContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationContent");
      m_Factory     : Windows.Web.Syndication.ISyndicationContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationContentWithSourceUri(sourceUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationLink return Windows.Web.Syndication.ISyndicationLink is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationLink");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationLink := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.Syndication.IID_ISyndicationLink'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationPerson
   (
      name : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationPerson is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationPerson");
      m_Factory     : Windows.Web.Syndication.ISyndicationPersonFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationPerson := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationPersonFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationPerson(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationPersonEx
   (
      name : Windows.String
      ; email : Windows.String
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Web.Syndication.ISyndicationPerson is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationPerson");
      m_Factory     : Windows.Web.Syndication.ISyndicationPersonFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationPerson := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationPersonFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationPersonEx(name, email, uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationCategory
   (
      term : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationCategory is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationCategory");
      m_Factory     : Windows.Web.Syndication.ISyndicationCategoryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationCategory := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationCategoryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationCategory(term, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationCategoryEx
   (
      term : Windows.String
      ; scheme : Windows.String
      ; label : Windows.String
   )
   return Windows.Web.Syndication.ISyndicationCategory is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationCategory");
      m_Factory     : Windows.Web.Syndication.ISyndicationCategoryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationCategory := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationCategoryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationCategoryEx(term, scheme, label, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationFeed return Windows.Web.Syndication.ISyndicationFeed is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationFeed");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationFeed := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.Syndication.IID_ISyndicationFeed'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationItem
   (
      title : Windows.String
      ; content : Windows.Web.Syndication.ISyndicationContent
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Web.Syndication.ISyndicationItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationItem");
      m_Factory     : Windows.Web.Syndication.ISyndicationItemFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationItem := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationItemFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSyndicationItem(title, content, uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSyndicationClient return Windows.Web.Syndication.ISyndicationClient is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationClient");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.ISyndicationClient := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.Syndication.IID_ISyndicationClient'Access, RetVal'Address);
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
   
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Web.Syndication.SyndicationErrorStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Syndication.SyndicationError");
      m_Factory     : ISyndicationErrorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Syndication.SyndicationErrorStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISyndicationErrorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStatus(hresult, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
