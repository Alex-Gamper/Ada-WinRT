--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Security.Cryptography.DataProtection is

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
   
   type IDataProtectionProvider_Interface;
   type IDataProtectionProvider is access all IDataProtectionProvider_Interface'Class;
   type IDataProtectionProvider_Ptr is access all IDataProtectionProvider;
   type IDataProtectionProviderFactory_Interface;
   type IDataProtectionProviderFactory is access all IDataProtectionProviderFactory_Interface'Class;
   type IDataProtectionProviderFactory_Ptr is access all IDataProtectionProviderFactory;
   
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
   
   IID_IDataProtectionProvider : aliased constant Windows.IID := (157522248, 60706, 17008, (189, 28, 109, 114, 192, 15, 135, 135 ));
   
   ------------------------------------------------------------------------
   type IDataProtectionProviderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateOverloadExplicit
   (
      This       : access IDataProtectionProviderFactory_Interface
      ; protectionDescriptor : Windows.String
      ; RetVal : access Windows.Security.Cryptography.DataProtection.IDataProtectionProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_IDataProtectionProviderFactory : aliased constant Windows.IID := (2918399404, 18738, 19679, (172, 65, 114, 20, 51, 53, 20, 202 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DataProtectionProvider is Windows.Security.Cryptography.DataProtection.IDataProtectionProvider;
   
   function CreateDataProtectionProvider return Windows.Security.Cryptography.DataProtection.IDataProtectionProvider;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
