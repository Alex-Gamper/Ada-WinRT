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
package Windows.Perception is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPerceptionTimestamp_Interface;
   type IPerceptionTimestamp is access all IPerceptionTimestamp_Interface'Class;
   type IPerceptionTimestamp_Ptr is access all IPerceptionTimestamp;
   type IPerceptionTimestampHelperStatics_Interface;
   type IPerceptionTimestampHelperStatics is access all IPerceptionTimestampHelperStatics_Interface'Class;
   type IPerceptionTimestampHelperStatics_Ptr is access all IPerceptionTimestampHelperStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionTimestamp : aliased constant Windows.IID := (2277656580, 41518, 19163, (186, 38, 215, 142, 246, 57, 188, 244 ));
   
   type IPerceptionTimestamp_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetTime
   (
      This       : access IPerceptionTimestamp_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_PredictionAmount
   (
      This       : access IPerceptionTimestamp_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionTimestampHelperStatics : aliased constant Windows.IID := (1202065876, 43487, 20188, (133, 93, 244, 211, 57, 217, 103, 172 ));
   
   type IPerceptionTimestampHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromHistoricalTargetTime
   (
      This       : access IPerceptionTimestampHelperStatics_Interface
      ; targetTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Perception.IPerceptionTimestamp
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PerceptionTimestamp is Windows.Perception.IPerceptionTimestamp;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FromHistoricalTargetTime
   (
      targetTime : Windows.Foundation.DateTime
   )
   return Windows.Perception.IPerceptionTimestamp;
   
end;
