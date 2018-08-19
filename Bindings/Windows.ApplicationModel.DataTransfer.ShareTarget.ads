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
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
limited with Windows.ApplicationModel.Contacts;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.DataTransfer.ShareTarget is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IQuickLink_Interface;
   type IQuickLink is access all IQuickLink_Interface'Class;
   type IQuickLink_Ptr is access all IQuickLink;
   type IShareOperation_Interface;
   type IShareOperation is access all IShareOperation_Interface'Class;
   type IShareOperation_Ptr is access all IShareOperation;
   type IShareOperation2_Interface;
   type IShareOperation2 is access all IShareOperation2_Interface'Class;
   type IShareOperation2_Ptr is access all IShareOperation2;
   type IShareOperation3_Interface;
   type IShareOperation3 is access all IShareOperation3_Interface'Class;
   type IShareOperation3_Ptr is access all IShareOperation3;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IQuickLink : aliased constant Windows.IID := (1614693128, 61630, 19164, (172, 201, 139, 39, 171, 156, 245, 86 ));
   
   type IQuickLink_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IQuickLink_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IQuickLink_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IQuickLink_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access IQuickLink_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IQuickLink_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IQuickLink_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedDataFormats
   (
      This       : access IQuickLink_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedFileTypes
   (
      This       : access IQuickLink_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareOperation : aliased constant Windows.IID := (575060664, 53496, 16833, (168, 42, 65, 55, 219, 101, 4, 251 ));
   
   type IShareOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IShareOperation_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackageView
   )
   return Windows.HRESULT is abstract;
   
   function get_QuickLinkId
   (
      This       : access IShareOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RemoveThisQuickLink
   (
      This       : access IShareOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportStarted
   (
      This       : access IShareOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportDataRetrieved
   (
      This       : access IShareOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportSubmittedBackgroundTask
   (
      This       : access IShareOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompletedWithQuickLink
   (
      This       : access IShareOperation_Interface
      ; quicklink : Windows.ApplicationModel.DataTransfer.ShareTarget.IQuickLink
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IShareOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportError
   (
      This       : access IShareOperation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareOperation2 : aliased constant Windows.IID := (268146625, 38776, 18953, (142, 91, 203, 94, 72, 45, 5, 85 ));
   
   type IShareOperation2_Interface is interface and Windows.IInspectable_Interface;
   
   function DismissUI
   (
      This       : access IShareOperation2_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareOperation3 : aliased constant Windows.IID := (1593226114, 47015, 17777, (162, 166, 153, 74, 3, 73, 136, 178 ));
   
   type IShareOperation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contacts
   (
      This       : access IShareOperation3_Interface
      ; RetVal : access Windows.ApplicationModel.Contacts.IVectorView_IContact -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype QuickLink is Windows.ApplicationModel.DataTransfer.ShareTarget.IQuickLink;
   function Create return Windows.ApplicationModel.DataTransfer.ShareTarget.IQuickLink;
   
   subtype ShareOperation is Windows.ApplicationModel.DataTransfer.ShareTarget.IShareOperation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
