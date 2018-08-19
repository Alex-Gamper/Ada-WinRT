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
with Windows.Graphics.Printing;
with Windows.UI.Xaml;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Printing is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AddPagesEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Printing.IAddPagesEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Printing.IAddPagesEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access GetPreviewPageEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Printing.IGetPreviewPageEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Printing.IGetPreviewPageEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access PaginateEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Printing.IPaginateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.Printing.IPaginateEventArgs(e));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.UI.Xaml.Printing.IAddPagesEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Printing.AddPagesEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.Printing.IAddPagesEventArgs) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Printing.IID_IAddPagesEventArgs'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.UI.Xaml.Printing.IGetPreviewPageEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Printing.GetPreviewPageEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.Printing.IGetPreviewPageEventArgs) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Printing.IID_IGetPreviewPageEventArgs'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.UI.Xaml.Printing.IPaginateEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Printing.PaginateEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.Printing.IPaginateEventArgs) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Printing.IID_IPaginateEventArgs'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IPrintDocument_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IPrintDocument or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IPrintDocument_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IPrintDocument_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IPrintDocument_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IPrintDocument_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Printing.IPrintDocument");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IPrintDocument_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_DocumentSource
   (
      This       : access IPrintDocument_Interface_Impl
      ; RetVal : access Windows.Graphics.Printing.IPrintDocumentSource
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Paginate
   (
      This       : access IPrintDocument_Interface_Impl
      ; value : Windows.UI.Xaml.Printing.PaginateEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Paginate
   (
      This       : access IPrintDocument_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_GetPreviewPage
   (
      This       : access IPrintDocument_Interface_Impl
      ; value : Windows.UI.Xaml.Printing.GetPreviewPageEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_GetPreviewPage
   (
      This       : access IPrintDocument_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_AddPages
   (
      This       : access IPrintDocument_Interface_Impl
      ; value : Windows.UI.Xaml.Printing.AddPagesEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_AddPages
   (
      This       : access IPrintDocument_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function AddPage
   (
      This       : access IPrintDocument_Interface_Impl
      ; pageVisual : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function AddPagesComplete
   (
      This       : access IPrintDocument_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetPreviewPageCount
   (
      This       : access IPrintDocument_Interface_Impl
      ; count : Windows.Int32
      ; type_x : Windows.UI.Xaml.Printing.PreviewPageCountType
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetPreviewPage
   (
      This       : access IPrintDocument_Interface_Impl
      ; pageNumber : Windows.Int32
      ; pageVisual : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function InvalidatePreview
   (
      This       : access IPrintDocument_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Printing.IPrintDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Printing.PrintDocument");
      m_Factory     : IPrintDocumentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Printing.IPrintDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintDocumentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DocumentSourceProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Printing.PrintDocument");
      m_Factory     : IPrintDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DocumentSourceProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
