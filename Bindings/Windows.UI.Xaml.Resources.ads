--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Resources is

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
   
   type ICustomXamlResourceLoader_Interface;
   type ICustomXamlResourceLoader is access all ICustomXamlResourceLoader_Interface'Class;
   type ICustomXamlResourceLoader_Ptr is access all ICustomXamlResourceLoader;
   type ICustomXamlResourceLoaderOverrides_Interface;
   type ICustomXamlResourceLoaderOverrides is access all ICustomXamlResourceLoaderOverrides_Interface'Class;
   type ICustomXamlResourceLoaderOverrides_Ptr is access all ICustomXamlResourceLoaderOverrides;
   type ICustomXamlResourceLoaderStatics_Interface;
   type ICustomXamlResourceLoaderStatics is access all ICustomXamlResourceLoaderStatics_Interface'Class;
   type ICustomXamlResourceLoaderStatics_Ptr is access all ICustomXamlResourceLoaderStatics;
   type ICustomXamlResourceLoaderFactory_Interface;
   type ICustomXamlResourceLoaderFactory is access all ICustomXamlResourceLoaderFactory_Interface'Class;
   type ICustomXamlResourceLoaderFactory_Ptr is access all ICustomXamlResourceLoaderFactory;
   
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
   type ICustomXamlResourceLoader_Interface is interface and Windows.IInspectable_Interface;
   
   IID_ICustomXamlResourceLoader : aliased constant Windows.IID := (1360692395, 19080, 16799, (133, 46, 84, 8, 59, 144, 176, 120 ));
   
   ------------------------------------------------------------------------
   type ICustomXamlResourceLoaderOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function GetResource
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface
      ; resourceId : Windows.String
      ; objectType : Windows.String
      ; propertyName : Windows.String
      ; propertyType : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   IID_ICustomXamlResourceLoaderOverrides : aliased constant Windows.IID := (4166117777, 44802, 18152, (154, 248, 66, 123, 126, 191, 233, 248 ));
   
   ------------------------------------------------------------------------
   type ICustomXamlResourceLoaderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access ICustomXamlResourceLoaderStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Resources.ICustomXamlResourceLoader
   )
   return Windows.HRESULT is abstract;
   
   function put_Current
   (
      This       : access ICustomXamlResourceLoaderStatics_Interface
      ; value : Windows.UI.Xaml.Resources.ICustomXamlResourceLoader
   )
   return Windows.HRESULT is abstract;
   
   IID_ICustomXamlResourceLoaderStatics : aliased constant Windows.IID := (575665687, 58588, 19495, (173, 50, 219, 147, 213, 208, 229, 218 ));
   
   ------------------------------------------------------------------------
   type ICustomXamlResourceLoaderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ICustomXamlResourceLoaderFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Resources.ICustomXamlResourceLoader
   )
   return Windows.HRESULT is abstract;
   
   IID_ICustomXamlResourceLoaderFactory : aliased constant Windows.IID := (1543339593, 30854, 17651, (142, 211, 111, 236, 4, 99, 237, 105 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CustomXamlResourceLoader is Windows.UI.Xaml.Resources.ICustomXamlResourceLoader;
   
   type ICustomXamlResourceLoaderOverrides_Interface_Impl is new ICustomXamlResourceLoaderOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ICustomXamlResourceLoaderOverrides := null;
      m_ICustomXamlResourceLoader : ICustomXamlResourceLoader := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ICustomXamlResourceLoaderOverrides_Impl is access all ICustomXamlResourceLoaderOverrides_Interface_Impl'Class;
   type ICustomXamlResourceLoaderOverrides_Impl_Ptr is access all ICustomXamlResourceLoaderOverrides_Impl;
   
   function QueryInterface
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function GetResource
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl
      ; resourceId : Windows.String
      ; objectType : Windows.String
      ; propertyName : Windows.String
      ; propertyType : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   type ICustomXamlResourceLoader_Interface_Impl is new ICustomXamlResourceLoader_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_Inner    : aliased ICustomXamlResourceLoader := null;
      m_ICustomXamlResourceLoader : ICustomXamlResourceLoader := null;
      m_FTM      : aliased IUnknown := null;
   end record;
   
   type ICustomXamlResourceLoader_Impl is access all ICustomXamlResourceLoader_Interface_Impl'Class;
   type ICustomXamlResourceLoader_Impl_Ptr is access all ICustomXamlResourceLoader_Impl;
   
   function QueryInterface
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Resources.ICustomXamlResourceLoader;
   
   function get_Current
   return Windows.UI.Xaml.Resources.ICustomXamlResourceLoader;
   
   procedure put_Current
   (
      value : Windows.UI.Xaml.Resources.ICustomXamlResourceLoader
   )
   ;

end;
