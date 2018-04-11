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
limited with Windows.Networking.Connectivity;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Networking is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HostNameSortOptions is (
      None,
      OptimizeForLongConnections
   );
   for HostNameSortOptions use (
      None => 0,
      OptimizeForLongConnections => 2
   );
   for HostNameSortOptions'Size use 32;
   
   type HostNameSortOptions_Ptr is access HostNameSortOptions;
   
   type HostNameType is (
      DomainName,
      Ipv4,
      Ipv6,
      Bluetooth
   );
   for HostNameType use (
      DomainName => 0,
      Ipv4 => 1,
      Ipv6 => 2,
      Bluetooth => 3
   );
   for HostNameType'Size use 32;
   
   type HostNameType_Ptr is access HostNameType;
   
   type DomainNameType is (
      Suffix,
      FullyQualified
   );
   for DomainNameType use (
      Suffix => 0,
      FullyQualified => 1
   );
   for DomainNameType'Size use 32;
   
   type DomainNameType_Ptr is access DomainNameType;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHostNameStatics_Interface;
   type IHostNameStatics is access all IHostNameStatics_Interface'Class;
   type IHostNameStatics_Ptr is access all IHostNameStatics;
   type IHostName_Interface;
   type IHostName is access all IHostName_Interface'Class;
   type IHostName_Ptr is access all IHostName;
   type IHostNameFactory_Interface;
   type IHostNameFactory is access all IHostNameFactory_Interface'Class;
   type IHostNameFactory_Ptr is access all IHostNameFactory;
   type IEndpointPair_Interface;
   type IEndpointPair is access all IEndpointPair_Interface'Class;
   type IEndpointPair_Ptr is access all IEndpointPair;
   type IEndpointPairFactory_Interface;
   type IEndpointPairFactory is access all IEndpointPairFactory_Interface'Class;
   type IEndpointPairFactory_Ptr is access all IEndpointPairFactory;
   type IIterator_IHostName_Interface;
   type IIterator_IHostName is access all IIterator_IHostName_Interface'Class;
   type IIterator_IHostName_Ptr is access all IIterator_IHostName;
   type IIterable_IHostName_Interface;
   type IIterable_IHostName is access all IIterable_IHostName_Interface'Class;
   type IIterable_IHostName_Ptr is access all IIterable_IHostName;
   type IVectorView_IHostName_Interface;
   type IVectorView_IHostName is access all IVectorView_IHostName_Interface'Class;
   type IVectorView_IHostName_Ptr is access all IVectorView_IHostName;
   type IIterator_IEndpointPair_Interface;
   type IIterator_IEndpointPair is access all IIterator_IEndpointPair_Interface'Class;
   type IIterator_IEndpointPair_Ptr is access all IIterator_IEndpointPair;
   type IIterable_IEndpointPair_Interface;
   type IIterable_IEndpointPair is access all IIterable_IEndpointPair_Interface'Class;
   type IIterable_IEndpointPair_Ptr is access all IIterable_IEndpointPair;
   type IVectorView_IEndpointPair_Interface;
   type IVectorView_IEndpointPair is access all IVectorView_IEndpointPair_Interface'Class;
   type IVectorView_IEndpointPair_Ptr is access all IVectorView_IEndpointPair;
   type IVector_IHostName_Interface;
   type IVector_IHostName is access all IVector_IHostName_Interface'Class;
   type IVector_IHostName_Ptr is access all IVector_IHostName;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IHostNameStatics : aliased constant Windows.IID := (4136424639, 41864, 20107, (145, 234, 84, 221, 109, 217, 1, 192 ));
   
   type IHostNameStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Compare
   (
      This       : access IHostNameStatics_Interface
      ; value1 : Windows.String
      ; value2 : Windows.String
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHostName : aliased constant Windows.IID := (3213806253, 60822, 18855, (144, 132, 212, 22, 202, 232, 141, 203 ));
   
   type IHostName_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IPInformation
   (
      This       : access IHostName_Interface
      ; RetVal : access Windows.Networking.Connectivity.IIPInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_RawName
   (
      This       : access IHostName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IHostName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CanonicalName
   (
      This       : access IHostName_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IHostName_Interface
      ; RetVal : access Windows.Networking.HostNameType
   )
   return Windows.HRESULT is abstract;
   
   function IsEqual
   (
      This       : access IHostName_Interface
      ; hostName : Windows.Networking.IHostName
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHostNameFactory : aliased constant Windows.IID := (1166812141, 28975, 17782, (173, 241, 194, 11, 44, 100, 53, 88 ));
   
   type IHostNameFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateHostName
   (
      This       : access IHostNameFactory_Interface
      ; hostName : Windows.String
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEndpointPair : aliased constant Windows.IID := (866167350, 63738, 19248, (184, 86, 118, 81, 124, 59, 208, 109 ));
   
   type IEndpointPair_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalHostName
   (
      This       : access IEndpointPair_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function put_LocalHostName
   (
      This       : access IEndpointPair_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalServiceName
   (
      This       : access IEndpointPair_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_LocalServiceName
   (
      This       : access IEndpointPair_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteHostName
   (
      This       : access IEndpointPair_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteHostName
   (
      This       : access IEndpointPair_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteServiceName
   (
      This       : access IEndpointPair_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteServiceName
   (
      This       : access IEndpointPair_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEndpointPairFactory : aliased constant Windows.IID := (3054098801, 25824, 17451, (170, 111, 204, 140, 143, 24, 31, 120 ));
   
   type IEndpointPairFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateEndpointPair
   (
      This       : access IEndpointPairFactory_Interface
      ; localHostName : Windows.Networking.IHostName
      ; localServiceName : Windows.String
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
      ; RetVal : access Windows.Networking.IEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IHostName : aliased constant Windows.IID := (1434187836, 42024, 23997, (160, 254, 5, 246, 238, 84, 61, 69 ));
   
   type IIterator_IHostName_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHostName_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHostName_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHostName_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHostName_Interface
      ; items : Windows.Networking.IHostName_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IHostName : aliased constant Windows.IID := (2657042128, 53020, 23864, (131, 44, 172, 234, 97, 100, 191, 92 ));
   
   type IIterable_IHostName_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHostName_Interface
      ; RetVal : access Windows.Networking.IIterator_IHostName
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IHostName : aliased constant Windows.IID := (4101008049, 21923, 21104, (175, 178, 115, 41, 136, 254, 130, 39 ));
   
   type IVectorView_IHostName_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHostName_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHostName_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHostName_Interface
      ; value : Windows.Networking.IHostName
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHostName_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.IHostName_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IEndpointPair : aliased constant Windows.IID := (3365535647, 59125, 22131, (129, 12, 4, 226, 255, 152, 112, 79 ));
   
   type IIterator_IEndpointPair_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IEndpointPair_Interface
      ; RetVal : access Windows.Networking.IEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IEndpointPair_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IEndpointPair_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IEndpointPair_Interface
      ; items : Windows.Networking.IEndpointPair_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IEndpointPair : aliased constant Windows.IID := (3622601668, 41339, 20927, (137, 151, 170, 51, 185, 16, 45, 201 ));
   
   type IIterable_IEndpointPair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IEndpointPair_Interface
      ; RetVal : access Windows.Networking.IIterator_IEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IEndpointPair : aliased constant Windows.IID := (2273355857, 27976, 20486, (146, 136, 129, 243, 215, 4, 90, 150 ));
   
   type IVectorView_IEndpointPair_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IEndpointPair_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.IEndpointPair
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IEndpointPair_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IEndpointPair_Interface
      ; value : Windows.Networking.IEndpointPair
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IEndpointPair_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.IEndpointPair_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IHostName : aliased constant Windows.IID := (2428967977, 43445, 21095, (165, 173, 139, 117, 103, 54, 49, 124 ));
   
   type IVector_IHostName_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IHostName_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IHostName_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IHostName_Interface
      ; RetVal : access Windows.Networking.IVectorView_IHostName
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IHostName_Interface
      ; value : Windows.Networking.IHostName
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IHostName_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IHostName_Interface
      ; index : Windows.UInt32
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IHostName_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IHostName_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IHostName_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IHostName_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IHostName_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.IHostName_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IHostName_Interface
      ; items : Windows.Networking.IHostName_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HostName is Windows.Networking.IHostName;
   function CreateHostName
   (
      hostName : Windows.String
   )
   return Windows.Networking.IHostName;
   
   subtype EndpointPair is Windows.Networking.IEndpointPair;
   function CreateEndpointPair
   (
      localHostName : Windows.Networking.IHostName
      ; localServiceName : Windows.String
      ; remoteHostName : Windows.Networking.IHostName
      ; remoteServiceName : Windows.String
   )
   return Windows.Networking.IEndpointPair;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function Compare
   (
      value1 : Windows.String
      ; value2 : Windows.String
   )
   return Windows.Int32;
   
end;
