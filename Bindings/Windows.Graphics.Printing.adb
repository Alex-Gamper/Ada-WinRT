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
with Windows.ApplicationModel.DataTransfer;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Printing is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access PrintTaskSourceRequestedHandler_Interface
      ; args : Windows.Graphics.Printing.IPrintTaskSourceRequestedArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.IPrintTaskSourceRequestedArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTask_add_Previewing_Interface
      ; sender : Windows.Graphics.Printing.IPrintTask
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.IPrintTask(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTask_add_Submitting_Interface
      ; sender : Windows.Graphics.Printing.IPrintTask
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.IPrintTask(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTask_add_Progressing_Interface
      ; sender : Windows.Graphics.Printing.IPrintTask
      ; args : Windows.Graphics.Printing.IPrintTaskProgressingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.IPrintTask(sender), Windows.Graphics.Printing.IPrintTaskProgressingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTask_add_Completed_Interface
      ; sender : Windows.Graphics.Printing.IPrintTask
      ; args : Windows.Graphics.Printing.IPrintTaskCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.IPrintTask(sender), Windows.Graphics.Printing.IPrintTaskCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintManager_add_PrintTaskRequested_Interface
      ; sender : Windows.Graphics.Printing.IPrintManager
      ; args : Windows.Graphics.Printing.IPrintTaskRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.IPrintManager(sender), Windows.Graphics.Printing.IPrintTaskRequestedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      firstPage : Windows.Int32
      ; lastPage : Windows.Int32
   )
   return Windows.Graphics.Printing.IPrintPageRange is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.PrintPageRange");
      m_Factory     : Windows.Graphics.Printing.IPrintPageRangeFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing.IPrintPageRange := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintPageRangeFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(firstPage, lastPage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithSinglePage
   (
      page : Windows.Int32
   )
   return Windows.Graphics.Printing.IPrintPageRange is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.PrintPageRange");
      m_Factory     : Windows.Graphics.Printing.IPrintPageRangeFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing.IPrintPageRange := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintPageRangeFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithSinglePage(page, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Graphics.Printing.IPrintPageInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.PrintPageInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing.IPrintPageInfo) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing.IID_IPrintPageInfo'Access, RetVal'access);
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
   
   function get_MediaSize
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediaSize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediaType
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediaType(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Orientation
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Orientation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PrintQuality
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PrintQuality(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ColorMode
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ColorMode(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Duplex
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Duplex(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Collation
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Collation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Staple
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Staple(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HolePunch
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HolePunch(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Binding
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Binding(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Copies
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Copies(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NUp
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NUp(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InputBin
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InputBin(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bordering
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bordering(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CustomPageRanges
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.StandardPrintTaskOptions");
      m_Factory     : IStandardPrintTaskOptionsStatic3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardPrintTaskOptionsStatic3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CustomPageRanges(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.PrintManager");
      m_Factory     : IPrintManagerStatic2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintManagerStatic2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.Graphics.Printing.IPrintManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.PrintManager");
      m_Factory     : IPrintManagerStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing.IPrintManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintManagerStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowPrintUIAsync
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.PrintManager");
      m_Factory     : IPrintManagerStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintManagerStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowPrintUIAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
