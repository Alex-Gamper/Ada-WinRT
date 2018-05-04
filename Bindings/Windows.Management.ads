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
with Windows.Foundation.Collections;
with Windows.Foundation;
package Windows.Management is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MdmAlertMark is (
      None,
      Fatal,
      Critical,
      Warning,
      Informational
   );
   for MdmAlertMark use (
      None => 0,
      Fatal => 1,
      Critical => 2,
      Warning => 3,
      Informational => 4
   );
   for MdmAlertMark'Size use 32;
   
   type MdmAlertMark_Ptr is access MdmAlertMark;
   
   type MdmAlertDataType is (
      String,
      Base64,
      Boolean,
      Integer
   );
   for MdmAlertDataType use (
      String => 0,
      Base64 => 1,
      Boolean => 2,
      Integer => 3
   );
   for MdmAlertDataType'Size use 32;
   
   type MdmAlertDataType_Ptr is access MdmAlertDataType;
   
   type MdmSessionState is (
      NotStarted,
      Starting,
      Connecting,
      Communicating,
      AlertStatusAvailable,
      Retrying,
      Completed
   );
   for MdmSessionState use (
      NotStarted => 0,
      Starting => 1,
      Connecting => 2,
      Communicating => 3,
      AlertStatusAvailable => 4,
      Retrying => 5,
      Completed => 6
   );
   for MdmSessionState'Size use 32;
   
   type MdmSessionState_Ptr is access MdmSessionState;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMdmAlert_Interface;
   type IMdmAlert is access all IMdmAlert_Interface'Class;
   type IMdmAlert_Ptr is access all IMdmAlert;
   type IMdmSession_Interface;
   type IMdmSession is access all IMdmSession_Interface'Class;
   type IMdmSession_Ptr is access all IMdmSession;
   type IMdmSessionManagerStatics_Interface;
   type IMdmSessionManagerStatics is access all IMdmSessionManagerStatics_Interface'Class;
   type IMdmSessionManagerStatics_Ptr is access all IMdmSessionManagerStatics;
   type IIterator_IMdmAlert_Interface;
   type IIterator_IMdmAlert is access all IIterator_IMdmAlert_Interface'Class;
   type IIterator_IMdmAlert_Ptr is access all IIterator_IMdmAlert;
   type IIterable_IMdmAlert_Interface;
   type IIterable_IMdmAlert is access all IIterable_IMdmAlert_Interface'Class;
   type IIterable_IMdmAlert_Ptr is access all IIterable_IMdmAlert;
   type IVectorView_IMdmAlert_Interface;
   type IVectorView_IMdmAlert is access all IVectorView_IMdmAlert_Interface'Class;
   type IVectorView_IMdmAlert_Ptr is access all IVectorView_IMdmAlert;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMdmAlert : aliased constant Windows.IID := (2969289511, 10433, 19282, (165, 72, 197, 128, 124, 175, 112, 182 ));
   
   type IMdmAlert_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IMdmAlert_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IMdmAlert_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Format
   (
      This       : access IMdmAlert_Interface
      ; RetVal : access Windows.Management.MdmAlertDataType
   )
   return Windows.HRESULT is abstract;
   
   function put_Format
   (
      This       : access IMdmAlert_Interface
      ; value : Windows.Management.MdmAlertDataType
   )
   return Windows.HRESULT is abstract;
   
   function get_Mark
   (
      This       : access IMdmAlert_Interface
      ; RetVal : access Windows.Management.MdmAlertMark
   )
   return Windows.HRESULT is abstract;
   
   function put_Mark
   (
      This       : access IMdmAlert_Interface
      ; value : Windows.Management.MdmAlertMark
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IMdmAlert_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access IMdmAlert_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IMdmAlert_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Target
   (
      This       : access IMdmAlert_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Target
   (
      This       : access IMdmAlert_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IMdmAlert_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access IMdmAlert_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMdmSession : aliased constant Windows.IID := (4270403916, 36708, 18327, (169, 215, 157, 136, 248, 106, 225, 102 ));
   
   type IMdmSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Alerts
   (
      This       : access IMdmSession_Interface
      ; RetVal : access Windows.Management.IVectorView_IMdmAlert -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IMdmSession_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IMdmSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IMdmSession_Interface
      ; RetVal : access Windows.Management.MdmSessionState
   )
   return Windows.HRESULT is abstract;
   
   function AttachAsync
   (
      This       : access IMdmSession_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function Delete
   (
      This       : access IMdmSession_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartAsync
   (
      This       : access IMdmSession_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartWithAlertsAsync
   (
      This       : access IMdmSession_Interface
      ; alerts : Windows.Management.IIterable_IMdmAlert
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMdmSessionManagerStatics : aliased constant Windows.IID := (3477789017, 63301, 19321, (155, 92, 222, 11, 248, 239, 228, 75 ));
   
   type IMdmSessionManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SessionIds
   (
      This       : access IMdmSessionManagerStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateSession
   (
      This       : access IMdmSessionManagerStatics_Interface
      ; RetVal : access Windows.Management.IMdmSession
   )
   return Windows.HRESULT is abstract;
   
   function DeleteSessionById
   (
      This       : access IMdmSessionManagerStatics_Interface
      ; sessionId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetSessionById
   (
      This       : access IMdmSessionManagerStatics_Interface
      ; sessionId : Windows.String
      ; RetVal : access Windows.Management.IMdmSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMdmAlert : aliased constant Windows.IID := (3030838250, 45471, 23973, (179, 209, 232, 89, 241, 244, 223, 23 ));
   
   type IIterator_IMdmAlert_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMdmAlert_Interface
      ; RetVal : access Windows.Management.IMdmAlert
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMdmAlert_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMdmAlert_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMdmAlert_Interface
      ; items : Windows.Management.IMdmAlert_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMdmAlert : aliased constant Windows.IID := (2695239644, 8460, 21151, (181, 233, 41, 174, 206, 235, 181, 168 ));
   
   type IIterable_IMdmAlert_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMdmAlert_Interface
      ; RetVal : access Windows.Management.IIterator_IMdmAlert
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMdmAlert : aliased constant Windows.IID := (731120524, 9386, 21089, (128, 216, 201, 15, 121, 112, 100, 74 ));
   
   type IVectorView_IMdmAlert_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMdmAlert_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Management.IMdmAlert
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMdmAlert_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMdmAlert_Interface
      ; value : Windows.Management.IMdmAlert
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMdmAlert_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Management.IMdmAlert_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MdmAlert is Windows.Management.IMdmAlert;
   function CreateMdmAlert return Windows.Management.IMdmAlert;
   
   subtype MdmSession is Windows.Management.IMdmSession;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_SessionIds
   return Windows.Foundation.Collections.IVectorView_String;
   
   function TryCreateSession
   return Windows.Management.IMdmSession;
   
   procedure DeleteSessionById
   (
      sessionId : Windows.String
   )
   ;
   
   function GetSessionById
   (
      sessionId : Windows.String
   )
   return Windows.Management.IMdmSession;
   
end;
