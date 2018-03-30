--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Perception is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
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
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
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
   
   IID_IPerceptionTimestamp : aliased constant Windows.IID := (2277656580, 41518, 19163, (186, 38, 215, 142, 246, 57, 188, 244 ));
   
   ------------------------------------------------------------------------
   type IPerceptionTimestampHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromHistoricalTargetTime
   (
      This       : access IPerceptionTimestampHelperStatics_Interface
      ; targetTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Perception.IPerceptionTimestamp
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionTimestampHelperStatics : aliased constant Windows.IID := (1202065876, 43487, 20188, (133, 93, 244, 211, 57, 217, 103, 172 ));
   
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
