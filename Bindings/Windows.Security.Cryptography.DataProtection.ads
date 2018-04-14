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
with Windows.Foundation;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Security.Cryptography.DataProtection is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDataProtectionProvider_Interface;
   type IDataProtectionProvider is access all IDataProtectionProvider_Interface'Class;
   type IDataProtectionProvider_Ptr is access all IDataProtectionProvider;
   type IDataProtectionProviderFactory_Interface;
   type IDataProtectionProviderFactory is access all IDataProtectionProviderFactory_Interface'Class;
   type IDataProtectionProviderFactory_Ptr is access all IDataProtectionProviderFactory;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDataProtectionProvider : aliased constant Windows.IID := (157522248, 60706, 17008, (189, 28, 109, 114, 192, 15, 135, 135 ));
   
   type IDataProtectionProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function ProtectAsync
   (
      This       : access IDataProtectionProvider_Interface
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnprotectAsync
   (
      This       : access IDataProtectionProvider_Interface
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ProtectStreamAsync
   (
      This       : access IDataProtectionProvider_Interface
      ; src : Windows.Storage.Streams.IInputStream
      ; dest : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UnprotectStreamAsync
   (
      This       : access IDataProtectionProvider_Interface
      ; src : Windows.Storage.Streams.IInputStream
      ; dest : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataProtectionProviderFactory : aliased constant Windows.IID := (2918399404, 18738, 19679, (172, 65, 114, 20, 51, 53, 20, 202 ));
   
   type IDataProtectionProviderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateOverloadExplicit
   (
      This       : access IDataProtectionProviderFactory_Interface
      ; protectionDescriptor : Windows.String
      ; RetVal : access Windows.Security.Cryptography.DataProtection.IDataProtectionProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DataProtectionProvider is Windows.Security.Cryptography.DataProtection.IDataProtectionProvider;
   function CreateDataProtectionProvider return Windows.Security.Cryptography.DataProtection.IDataProtectionProvider;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
