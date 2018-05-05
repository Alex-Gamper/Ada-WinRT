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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
package Windows.Globalization.Collation is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICharacterGrouping_Interface;
   type ICharacterGrouping is access all ICharacterGrouping_Interface'Class;
   type ICharacterGrouping_Ptr is access all ICharacterGrouping;
   type ICharacterGroupingsFactory_Interface;
   type ICharacterGroupingsFactory is access all ICharacterGroupingsFactory_Interface'Class;
   type ICharacterGroupingsFactory_Ptr is access all ICharacterGroupingsFactory;
   type IVectorView_CharacterGrouping_Interface;
   type IVectorView_CharacterGrouping is access all IVectorView_CharacterGrouping_Interface'Class;
   type IVectorView_CharacterGrouping_Ptr is access all IVectorView_CharacterGrouping;
   type IIterable_CharacterGrouping_Interface;
   type IIterable_CharacterGrouping is access all IIterable_CharacterGrouping_Interface'Class;
   type IIterable_CharacterGrouping_Ptr is access all IIterable_CharacterGrouping;
   type ICharacterGroupings_Interface;
   type ICharacterGroupings is access all ICharacterGroupings_Interface'Class;
   type ICharacterGroupings_Ptr is access all ICharacterGroupings;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICharacterGrouping : aliased constant Windows.IID := (4209467835, 32861, 19376, (149, 187, 193, 247, 195, 232, 235, 142 ));
   
   type ICharacterGrouping_Interface is interface and Windows.IInspectable_Interface;
   
   function get_First
   (
      This       : access ICharacterGrouping_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Label
   (
      This       : access ICharacterGrouping_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICharacterGroupingsFactory : aliased constant Windows.IID := (2582290393, 34925, 17409, (159, 152, 105, 200, 45, 76, 47, 120 ));
   
   type ICharacterGroupingsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ICharacterGroupingsFactory_Interface
      ; language : Windows.String
      ; RetVal : access Windows.Globalization.Collation.ICharacterGroupings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_CharacterGrouping : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVectorView_CharacterGrouping_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_CharacterGrouping_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Globalization.Collation.ICharacterGrouping
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_CharacterGrouping_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_CharacterGrouping_Interface
      ; value : Windows.Globalization.Collation.ICharacterGrouping
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_CharacterGrouping_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Globalization.Collation.ICharacterGrouping_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_CharacterGrouping : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_CharacterGrouping_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_CharacterGrouping_Interface
      ; RetVal : access Windows.Globalization.Collation.ICharacterGrouping
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICharacterGroupings : aliased constant Windows.IID := (3100772981, 54479, 16469, (128, 229, 206, 22, 156, 34, 100, 150 ));
   
   type ICharacterGroupings_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access ICharacterGroupings_Interface
      ; text : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CharacterGrouping is Windows.Globalization.Collation.ICharacterGrouping;
   subtype CharacterGroupings is Windows.Globalization.Collation.ICharacterGroupings;
   function CreateCharacterGroupings return Windows.Globalization.Collation.ICharacterGroupings;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
