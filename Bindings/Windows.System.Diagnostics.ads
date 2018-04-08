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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Data.Json;
--------------------------------------------------------------------------------
package Windows.System.Diagnostics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DiagnosticActionState is (
      Initializing,
      Downloading,
      VerifyingTrust,
      Detecting,
      Resolving,
      VerifyingResolution
   );
   for DiagnosticActionState use (
      Initializing => 0,
      Downloading => 1,
      VerifyingTrust => 2,
      Detecting => 3,
      Resolving => 4,
      VerifyingResolution => 5
   );
   for DiagnosticActionState'Size use 32;
   
   type DiagnosticActionState_Ptr is access DiagnosticActionState;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IProcessDiagnosticInfo_Interface;
   type IProcessDiagnosticInfo is access all IProcessDiagnosticInfo_Interface'Class;
   type IProcessDiagnosticInfo_Ptr is access all IProcessDiagnosticInfo;
   type IProcessDiagnosticInfo2_Interface;
   type IProcessDiagnosticInfo2 is access all IProcessDiagnosticInfo2_Interface'Class;
   type IProcessDiagnosticInfo2_Ptr is access all IProcessDiagnosticInfo2;
   type IProcessDiagnosticInfoStatics_Interface;
   type IProcessDiagnosticInfoStatics is access all IProcessDiagnosticInfoStatics_Interface'Class;
   type IProcessDiagnosticInfoStatics_Ptr is access all IProcessDiagnosticInfoStatics;
   type IProcessDiagnosticInfoStatics2_Interface;
   type IProcessDiagnosticInfoStatics2 is access all IProcessDiagnosticInfoStatics2_Interface'Class;
   type IProcessDiagnosticInfoStatics2_Ptr is access all IProcessDiagnosticInfoStatics2;
   type IProcessMemoryUsage_Interface;
   type IProcessMemoryUsage is access all IProcessMemoryUsage_Interface'Class;
   type IProcessMemoryUsage_Ptr is access all IProcessMemoryUsage;
   type IProcessMemoryUsageReport_Interface;
   type IProcessMemoryUsageReport is access all IProcessMemoryUsageReport_Interface'Class;
   type IProcessMemoryUsageReport_Ptr is access all IProcessMemoryUsageReport;
   type IProcessDiskUsage_Interface;
   type IProcessDiskUsage is access all IProcessDiskUsage_Interface'Class;
   type IProcessDiskUsage_Ptr is access all IProcessDiskUsage;
   type IProcessDiskUsageReport_Interface;
   type IProcessDiskUsageReport is access all IProcessDiskUsageReport_Interface'Class;
   type IProcessDiskUsageReport_Ptr is access all IProcessDiskUsageReport;
   type IProcessCpuUsage_Interface;
   type IProcessCpuUsage is access all IProcessCpuUsage_Interface'Class;
   type IProcessCpuUsage_Ptr is access all IProcessCpuUsage;
   type IProcessCpuUsageReport_Interface;
   type IProcessCpuUsageReport is access all IProcessCpuUsageReport_Interface'Class;
   type IProcessCpuUsageReport_Ptr is access all IProcessCpuUsageReport;
   type ISystemDiagnosticInfo_Interface;
   type ISystemDiagnosticInfo is access all ISystemDiagnosticInfo_Interface'Class;
   type ISystemDiagnosticInfo_Ptr is access all ISystemDiagnosticInfo;
   type ISystemDiagnosticInfoStatics_Interface;
   type ISystemDiagnosticInfoStatics is access all ISystemDiagnosticInfoStatics_Interface'Class;
   type ISystemDiagnosticInfoStatics_Ptr is access all ISystemDiagnosticInfoStatics;
   type ISystemMemoryUsage_Interface;
   type ISystemMemoryUsage is access all ISystemMemoryUsage_Interface'Class;
   type ISystemMemoryUsage_Ptr is access all ISystemMemoryUsage;
   type ISystemMemoryUsageReport_Interface;
   type ISystemMemoryUsageReport is access all ISystemMemoryUsageReport_Interface'Class;
   type ISystemMemoryUsageReport_Ptr is access all ISystemMemoryUsageReport;
   type ISystemCpuUsage_Interface;
   type ISystemCpuUsage is access all ISystemCpuUsage_Interface'Class;
   type ISystemCpuUsage_Ptr is access all ISystemCpuUsage;
   type ISystemCpuUsageReport_Interface;
   type ISystemCpuUsageReport is access all ISystemCpuUsageReport_Interface'Class;
   type ISystemCpuUsageReport_Ptr is access all ISystemCpuUsageReport;
   type IDiagnosticActionResult_Interface;
   type IDiagnosticActionResult is access all IDiagnosticActionResult_Interface'Class;
   type IDiagnosticActionResult_Ptr is access all IDiagnosticActionResult;
   type IDiagnosticInvokerStatics_Interface;
   type IDiagnosticInvokerStatics is access all IDiagnosticInvokerStatics_Interface'Class;
   type IDiagnosticInvokerStatics_Ptr is access all IDiagnosticInvokerStatics;
   type IDiagnosticInvoker_Interface;
   type IDiagnosticInvoker is access all IDiagnosticInvoker_Interface'Class;
   type IDiagnosticInvoker_Ptr is access all IDiagnosticInvoker;
   type IIterator_IProcessDiagnosticInfo_Interface;
   type IIterator_IProcessDiagnosticInfo is access all IIterator_IProcessDiagnosticInfo_Interface'Class;
   type IIterator_IProcessDiagnosticInfo_Ptr is access all IIterator_IProcessDiagnosticInfo;
   type IIterable_IProcessDiagnosticInfo_Interface;
   type IIterable_IProcessDiagnosticInfo is access all IIterable_IProcessDiagnosticInfo_Interface'Class;
   type IIterable_IProcessDiagnosticInfo_Ptr is access all IIterable_IProcessDiagnosticInfo;
   type IVectorView_IProcessDiagnosticInfo_Interface;
   type IVectorView_IProcessDiagnosticInfo is access all IVectorView_IProcessDiagnosticInfo_Interface'Class;
   type IVectorView_IProcessDiagnosticInfo_Ptr is access all IVectorView_IProcessDiagnosticInfo;
   type IVector_IProcessDiagnosticInfo_Interface;
   type IVector_IProcessDiagnosticInfo is access all IVector_IProcessDiagnosticInfo_Interface'Class;
   type IVector_IProcessDiagnosticInfo_Ptr is access all IVector_IProcessDiagnosticInfo;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IProcessDiagnosticInfo : aliased constant Windows.IID := (3895504971, 12302, 20198, (160, 171, 91, 95, 82, 49, 180, 52 ));
   
   type IProcessDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProcessId
   (
      This       : access IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExecutableFileName
   (
      This       : access IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Parent
   (
      This       : access IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_ProcessStartTime
   (
      This       : access IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_DiskUsage
   (
      This       : access IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessDiskUsage
   )
   return Windows.HRESULT is abstract;
   
   function get_MemoryUsage
   (
      This       : access IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessMemoryUsage
   )
   return Windows.HRESULT is abstract;
   
   function get_CpuUsage
   (
      This       : access IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessCpuUsage
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessDiagnosticInfo2 : aliased constant Windows.IID := (2505624346, 15627, 18924, (171, 112, 79, 122, 17, 40, 5, 222 ));
   
   type IProcessDiagnosticInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAppDiagnosticInfos
   (
      This       : access IProcessDiagnosticInfo2_Interface
      ; RetVal : access Windows.System.IVector_IAppDiagnosticInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPackaged
   (
      This       : access IProcessDiagnosticInfo2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessDiagnosticInfoStatics : aliased constant Windows.IID := (792834656, 46239, 17036, (170, 14, 132, 116, 79, 73, 202, 149 ));
   
   type IProcessDiagnosticInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForProcesses
   (
      This       : access IProcessDiagnosticInfoStatics_Interface
      ; RetVal : access Windows.System.Diagnostics.IVectorView_IProcessDiagnosticInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetForCurrentProcess
   (
      This       : access IProcessDiagnosticInfoStatics_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessDiagnosticInfoStatics2 : aliased constant Windows.IID := (1250334871, 39065, 19012, (162, 155, 9, 22, 99, 190, 9, 182 ));
   
   type IProcessDiagnosticInfoStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetForProcessId
   (
      This       : access IProcessDiagnosticInfoStatics2_Interface
      ; processId : Windows.UInt32
      ; RetVal : access Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessMemoryUsage : aliased constant Windows.IID := (4111147675, 33404, 17079, (176, 124, 14, 50, 98, 126, 107, 62 ));
   
   type IProcessMemoryUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetReport
   (
      This       : access IProcessMemoryUsage_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessMemoryUsageReport
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessMemoryUsageReport : aliased constant Windows.IID := (3267853498, 6481, 18053, (133, 50, 126, 116, 158, 207, 142, 235 ));
   
   type IProcessMemoryUsageReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NonPagedPoolSizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PageFaultCount
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PageFileSizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PagedPoolSizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PeakNonPagedPoolSizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PeakPageFileSizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PeakPagedPoolSizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PeakVirtualMemorySizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PeakWorkingSetSizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PrivatePageCount
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_VirtualMemorySizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_WorkingSetSizeInBytes
   (
      This       : access IProcessMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessDiskUsage : aliased constant Windows.IID := (1524075517, 32337, 20051, (191, 170, 90, 110, 225, 170, 187, 248 ));
   
   type IProcessDiskUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetReport
   (
      This       : access IProcessDiskUsage_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessDiskUsageReport
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessDiskUsageReport : aliased constant Windows.IID := (1075193853, 21341, 19487, (129, 184, 218, 84, 225, 190, 99, 94 ));
   
   type IProcessDiskUsageReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReadOperationCount
   (
      This       : access IProcessDiskUsageReport_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteOperationCount
   (
      This       : access IProcessDiskUsageReport_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherOperationCount
   (
      This       : access IProcessDiskUsageReport_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_BytesReadCount
   (
      This       : access IProcessDiskUsageReport_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_BytesWrittenCount
   (
      This       : access IProcessDiskUsageReport_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherBytesCount
   (
      This       : access IProcessDiskUsageReport_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessCpuUsage : aliased constant Windows.IID := (196813938, 51391, 16954, (168, 16, 181, 89, 174, 67, 84, 226 ));
   
   type IProcessCpuUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetReport
   (
      This       : access IProcessCpuUsage_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessCpuUsageReport
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IProcessCpuUsageReport : aliased constant Windows.IID := (2322439340, 14727, 20015, (161, 25, 107, 95, 162, 20, 241, 180 ));
   
   type IProcessCpuUsageReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KernelTime
   (
      This       : access IProcessCpuUsageReport_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_UserTime
   (
      This       : access IProcessCpuUsageReport_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISystemDiagnosticInfo : aliased constant Windows.IID := (2727411205, 57331, 16511, (154, 27, 11, 43, 49, 124, 168, 0 ));
   
   type ISystemDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MemoryUsage
   (
      This       : access ISystemDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.ISystemMemoryUsage
   )
   return Windows.HRESULT is abstract;
   
   function get_CpuUsage
   (
      This       : access ISystemDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.ISystemCpuUsage
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISystemDiagnosticInfoStatics : aliased constant Windows.IID := (3557076001, 64637, 17904, (154, 63, 57, 32, 58, 237, 159, 126 ));
   
   type ISystemDiagnosticInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentSystem
   (
      This       : access ISystemDiagnosticInfoStatics_Interface
      ; RetVal : access Windows.System.Diagnostics.ISystemDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISystemMemoryUsage : aliased constant Windows.IID := (402638229, 5890, 18895, (170, 39, 47, 10, 50, 89, 20, 4 ));
   
   type ISystemMemoryUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetReport
   (
      This       : access ISystemMemoryUsage_Interface
      ; RetVal : access Windows.System.Diagnostics.ISystemMemoryUsageReport
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISystemMemoryUsageReport : aliased constant Windows.IID := (946224263, 10911, 16442, (189, 25, 44, 243, 232, 22, 149, 0 ));
   
   type ISystemMemoryUsageReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TotalPhysicalSizeInBytes
   (
      This       : access ISystemMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableSizeInBytes
   (
      This       : access ISystemMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_CommittedSizeInBytes
   (
      This       : access ISystemMemoryUsageReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISystemCpuUsage : aliased constant Windows.IID := (1614263212, 726, 16948, (131, 98, 127, 227, 173, 200, 31, 95 ));
   
   type ISystemCpuUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetReport
   (
      This       : access ISystemCpuUsage_Interface
      ; RetVal : access Windows.System.Diagnostics.ISystemCpuUsageReport
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISystemCpuUsageReport : aliased constant Windows.IID := (740741298, 38019, 20322, (171, 87, 130, 178, 157, 151, 25, 184 ));
   
   type ISystemCpuUsageReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KernelTime
   (
      This       : access ISystemCpuUsageReport_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_UserTime
   (
      This       : access ISystemCpuUsageReport_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IdleTime
   (
      This       : access ISystemCpuUsageReport_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDiagnosticActionResult : aliased constant Windows.IID := (3261440662, 59195, 16535, (178, 143, 52, 66, 240, 61, 216, 49 ));
   
   type IDiagnosticActionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IDiagnosticActionResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Results
   (
      This       : access IDiagnosticActionResult_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDiagnosticInvokerStatics : aliased constant Windows.IID := (1559943390, 61788, 17748, (168, 19, 193, 19, 195, 136, 27, 9 ));
   
   type IDiagnosticInvokerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IDiagnosticInvokerStatics_Interface
      ; RetVal : access Windows.System.Diagnostics.IDiagnosticInvoker
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IDiagnosticInvokerStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.System.Diagnostics.IDiagnosticInvoker
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSupported
   (
      This       : access IDiagnosticInvokerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDiagnosticInvoker : aliased constant Windows.IID := (410724106, 739, 20358, (132, 252, 253, 216, 146, 181, 148, 15 ));
   
   type IDiagnosticInvoker_Interface is interface and Windows.IInspectable_Interface;
   
   function RunDiagnosticActionAsync
   (
      This       : access IDiagnosticInvoker_Interface
      ; context : Windows.Data.Json.IJsonObject
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IProcessDiagnosticInfo : aliased constant Windows.IID := (2828747800, 19515, 24393, (185, 87, 120, 86, 151, 201, 154, 191 ));
   
   type IIterator_IProcessDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IProcessDiagnosticInfo_Interface
      ; items : Windows.System.Diagnostics.IProcessDiagnosticInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IProcessDiagnosticInfo : aliased constant Windows.IID := (2545366567, 45718, 20598, (184, 205, 107, 216, 162, 64, 233, 102 ));
   
   type IIterable_IProcessDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.IIterator_IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IProcessDiagnosticInfo : aliased constant Windows.IID := (1957373043, 38436, 23046, (144, 37, 109, 145, 230, 34, 191, 142 ));
   
   type IVectorView_IProcessDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IProcessDiagnosticInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IProcessDiagnosticInfo_Interface
      ; value : Windows.System.Diagnostics.IProcessDiagnosticInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IProcessDiagnosticInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.Diagnostics.IProcessDiagnosticInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVector_IProcessDiagnosticInfo : aliased constant Windows.IID := (4130221313, 49629, 23392, (181, 218, 22, 81, 140, 186, 11, 176 ));
   
   type IVector_IProcessDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.IVectorView_IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; value : Windows.System.Diagnostics.IProcessDiagnosticInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; value : Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.Diagnostics.IProcessDiagnosticInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IProcessDiagnosticInfo_Interface
      ; items : Windows.System.Diagnostics.IProcessDiagnosticInfo_Ptr
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ProcessDiagnosticInfo is Windows.System.Diagnostics.IProcessDiagnosticInfo;
   subtype ProcessDiskUsage is Windows.System.Diagnostics.IProcessDiskUsage;
   subtype ProcessMemoryUsage is Windows.System.Diagnostics.IProcessMemoryUsage;
   subtype ProcessCpuUsage is Windows.System.Diagnostics.IProcessCpuUsage;
   subtype ProcessMemoryUsageReport is Windows.System.Diagnostics.IProcessMemoryUsageReport;
   subtype ProcessDiskUsageReport is Windows.System.Diagnostics.IProcessDiskUsageReport;
   subtype ProcessCpuUsageReport is Windows.System.Diagnostics.IProcessCpuUsageReport;
   subtype SystemMemoryUsage is Windows.System.Diagnostics.ISystemMemoryUsage;
   subtype SystemCpuUsage is Windows.System.Diagnostics.ISystemCpuUsage;
   subtype SystemDiagnosticInfo is Windows.System.Diagnostics.ISystemDiagnosticInfo;
   subtype SystemMemoryUsageReport is Windows.System.Diagnostics.ISystemMemoryUsageReport;
   subtype SystemCpuUsageReport is Windows.System.Diagnostics.ISystemCpuUsageReport;
   subtype DiagnosticInvoker is Windows.System.Diagnostics.IDiagnosticInvoker;
   subtype DiagnosticActionResult is Windows.System.Diagnostics.IDiagnosticActionResult;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForProcesses
   return Windows.System.Diagnostics.IVectorView_IProcessDiagnosticInfo;
   
   function GetForCurrentProcess
   return Windows.System.Diagnostics.IProcessDiagnosticInfo;
   
   function TryGetForProcessId
   (
      processId : Windows.UInt32
   )
   return Windows.System.Diagnostics.IProcessDiagnosticInfo;
   
   function GetForCurrentSystem
   return Windows.System.Diagnostics.ISystemDiagnosticInfo;
   
   function GetDefault
   return Windows.System.Diagnostics.IDiagnosticInvoker;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.System.Diagnostics.IDiagnosticInvoker;
   
   function get_IsSupported
   return Windows.Boolean;

end;
