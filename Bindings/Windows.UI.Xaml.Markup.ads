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
limited with Windows.UI.Xaml.Interop;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Markup is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type XamlBinaryWriterErrorInformation is record
      InputStreamIndex : Windows.UInt32;
      LineNumber : Windows.UInt32;
      LinePosition : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , XamlBinaryWriterErrorInformation);
   
   type XamlBinaryWriterErrorInformation_Ptr is access XamlBinaryWriterErrorInformation;
   
   type XmlnsDefinition is record
      XmlNamespace : Windows.String;
      Namespace : Windows.String;
   end record;
   pragma Convention (C_Pass_By_Copy , XmlnsDefinition);
   
   type XmlnsDefinition_Ptr is access XmlnsDefinition;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IComponentConnector_Interface;
   type IComponentConnector is access all IComponentConnector_Interface'Class;
   type IComponentConnector_Ptr is access all IComponentConnector;
   type IComponentConnector2_Interface;
   type IComponentConnector2 is access all IComponentConnector2_Interface'Class;
   type IComponentConnector2_Ptr is access all IComponentConnector2;
   type IDataTemplateComponent_Interface;
   type IDataTemplateComponent is access all IDataTemplateComponent_Interface'Class;
   type IDataTemplateComponent_Ptr is access all IDataTemplateComponent;
   type IXamlMember_Interface;
   type IXamlMember is access all IXamlMember_Interface'Class;
   type IXamlMember_Ptr is access all IXamlMember;
   type IXamlType_Interface;
   type IXamlType is access all IXamlType_Interface'Class;
   type IXamlType_Ptr is access all IXamlType;
   type IXamlMetadataProvider_Interface;
   type IXamlMetadataProvider is access all IXamlMetadataProvider_Interface'Class;
   type IXamlMetadataProvider_Ptr is access all IXamlMetadataProvider;
   type IMarkupExtension_Interface;
   type IMarkupExtension is access all IMarkupExtension_Interface'Class;
   type IMarkupExtension_Ptr is access all IMarkupExtension;
   type IMarkupExtensionOverrides_Interface;
   type IMarkupExtensionOverrides is access all IMarkupExtensionOverrides_Interface'Class;
   type IMarkupExtensionOverrides_Ptr is access all IMarkupExtensionOverrides;
   type IMarkupExtensionFactory_Interface;
   type IMarkupExtensionFactory is access all IMarkupExtensionFactory_Interface'Class;
   type IMarkupExtensionFactory_Ptr is access all IMarkupExtensionFactory;
   type IXamlBinaryWriter_Interface;
   type IXamlBinaryWriter is access all IXamlBinaryWriter_Interface'Class;
   type IXamlBinaryWriter_Ptr is access all IXamlBinaryWriter;
   type IXamlBinaryWriterStatics_Interface;
   type IXamlBinaryWriterStatics is access all IXamlBinaryWriterStatics_Interface'Class;
   type IXamlBinaryWriterStatics_Ptr is access all IXamlBinaryWriterStatics;
   type IXamlBindingHelper_Interface;
   type IXamlBindingHelper is access all IXamlBindingHelper_Interface'Class;
   type IXamlBindingHelper_Ptr is access all IXamlBindingHelper;
   type IXamlBindingHelperStatics_Interface;
   type IXamlBindingHelperStatics is access all IXamlBindingHelperStatics_Interface'Class;
   type IXamlBindingHelperStatics_Ptr is access all IXamlBindingHelperStatics;
   type IXamlMarkupHelper_Interface;
   type IXamlMarkupHelper is access all IXamlMarkupHelper_Interface'Class;
   type IXamlMarkupHelper_Ptr is access all IXamlMarkupHelper;
   type IXamlMarkupHelperStatics_Interface;
   type IXamlMarkupHelperStatics is access all IXamlMarkupHelperStatics_Interface'Class;
   type IXamlMarkupHelperStatics_Ptr is access all IXamlMarkupHelperStatics;
   type IXamlReader_Interface;
   type IXamlReader is access all IXamlReader_Interface'Class;
   type IXamlReader_Ptr is access all IXamlReader;
   type IXamlReaderStatics_Interface;
   type IXamlReaderStatics is access all IXamlReaderStatics_Interface'Class;
   type IXamlReaderStatics_Ptr is access all IXamlReaderStatics;
   
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
   
   IID_IComponentConnector : aliased constant Windows.IID := (4135127431, 59109, 18418, (146, 198, 236, 204, 228, 186, 21, 154 ));
   
   type IComponentConnector_Interface is interface and Windows.IInspectable_Interface;
   
   function Connect
   (
      This       : access IComponentConnector_Interface
      ; connectionId : Windows.Int32
      ; target : Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IComponentConnector2 : aliased constant Windows.IID := (3700373131, 60620, 18830, (177, 57, 145, 20, 34, 84, 215, 174 ));
   
   type IComponentConnector2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetBindingConnector
   (
      This       : access IComponentConnector2_Interface
      ; connectionId : Windows.Int32
      ; target : Windows.Object
      ; RetVal : access Windows.UI.Xaml.Markup.IComponentConnector
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IDataTemplateComponent : aliased constant Windows.IID := (138583496, 35504, 18247, (170, 154, 254, 173, 252, 141, 168, 225 ));
   
   type IDataTemplateComponent_Interface is interface and Windows.IInspectable_Interface;
   
   function Recycle
   (
      This       : access IDataTemplateComponent_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ProcessBindings
   (
      This       : access IDataTemplateComponent_Interface
      ; item : Windows.Object
      ; itemIndex : Windows.Int32
      ; phase : Windows.Int32
      ; nextPhase : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IXamlMember : aliased constant Windows.IID := (3309434252, 17321, 16918, (183, 24, 224, 177, 27, 20, 233, 62 ));
   
   type IXamlMember_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAttachable
   (
      This       : access IXamlMember_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDependencyProperty
   (
      This       : access IXamlMember_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReadOnly
   (
      This       : access IXamlMember_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IXamlMember_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetType
   (
      This       : access IXamlMember_Interface
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlType
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IXamlMember_Interface
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlType
   )
   return Windows.HRESULT is abstract;
   
   function GetValue
   (
      This       : access IXamlMember_Interface
      ; instance : Windows.Object
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function SetValue
   (
      This       : access IXamlMember_Interface
      ; instance : Windows.Object
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IXamlType : aliased constant Windows.IID := (2032200369, 41701, 18330, (189, 80, 108, 239, 60, 11, 73, 112 ));
   
   type IXamlType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BaseType
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlType
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentProperty
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlMember
   )
   return Windows.HRESULT is abstract;
   
   function get_FullName
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsArray
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCollection
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsConstructible
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDictionary
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMarkupExtension
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBindable
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemType
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlType
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyType
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlType
   )
   return Windows.HRESULT is abstract;
   
   function get_UnderlyingType
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   
   function ActivateInstance
   (
      This       : access IXamlType_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromString
   (
      This       : access IXamlType_Interface
      ; value : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetMember
   (
      This       : access IXamlType_Interface
      ; name : Windows.String
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlMember
   )
   return Windows.HRESULT is abstract;
   
   function AddToVector
   (
      This       : access IXamlType_Interface
      ; instance : Windows.Object
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function AddToMap
   (
      This       : access IXamlType_Interface
      ; instance : Windows.Object
      ; key : Windows.Object
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function RunInitializer
   (
      This       : access IXamlType_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IXamlMetadataProvider : aliased constant Windows.IID := (3010878825, 26789, 19250, (136, 97, 253, 185, 12, 31, 88, 54 ));
   
   type IXamlMetadataProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetXamlType
   (
      This       : access IXamlMetadataProvider_Interface
      ; type_x : Windows.UI.Xaml.Interop.TypeName
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlType
   )
   return Windows.HRESULT is abstract;
   
   function GetXamlTypeByFullName
   (
      This       : access IXamlMetadataProvider_Interface
      ; fullName : Windows.String
      ; RetVal : access Windows.UI.Xaml.Markup.IXamlType
   )
   return Windows.HRESULT is abstract;
   
   function GetXmlnsDefinitions
   (
      This       : access IXamlMetadataProvider_Interface
      ; RetVal : access Windows.UI.Xaml.Markup.XmlnsDefinition_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMarkupExtension : aliased constant Windows.IID := (518209901, 22059, 18542, (158, 229, 15, 12, 188, 200, 4, 140 ));
   
   type IMarkupExtension_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IMarkupExtensionOverrides : aliased constant Windows.IID := (959936959, 47552, 20475, (165, 127, 88, 231, 53, 110, 66, 95 ));
   
   type IMarkupExtensionOverrides_Interface is interface and Windows.IInspectable_Interface;
   
   function ProvideValue
   (
      This       : access IMarkupExtensionOverrides_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMarkupExtensionFactory : aliased constant Windows.IID := (1697815557, 64346, 17767, (157, 85, 92, 223, 186, 218, 39, 57 ));
   
   type IMarkupExtensionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IMarkupExtensionFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Markup.IMarkupExtension
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IXamlBinaryWriter : aliased constant Windows.IID := (2191338195, 25098, 18166, (132, 93, 67, 106, 5, 146, 113, 0 ));
   
   type IXamlBinaryWriter_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IXamlBinaryWriterStatics : aliased constant Windows.IID := (227463290, 39810, 19112, (182, 139, 2, 111, 45, 225, 204, 134 ));
   
   type IXamlBinaryWriterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Write
   (
      This       : access IXamlBinaryWriterStatics_Interface
      ; inputStreams : Windows.Storage.Streams.IVector_IRandomAccessStream
      ; outputStreams : Windows.Storage.Streams.IVector_IRandomAccessStream
      ; xamlMetadataProvider : Windows.UI.Xaml.Markup.IXamlMetadataProvider
      ; RetVal : access Windows.UI.Xaml.Markup.XamlBinaryWriterErrorInformation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IXamlBindingHelper : aliased constant Windows.IID := (4205247238, 35513, 20215, (138, 231, 251, 211, 11, 191, 208, 109 ));
   
   type IXamlBindingHelper_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IXamlBindingHelperStatics : aliased constant Windows.IID := (4133288817, 51212, 20474, (134, 238, 85, 135, 84, 238, 51, 109 ));
   
   type IXamlBindingHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataTemplateComponentProperty
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetDataTemplateComponent
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.Markup.IDataTemplateComponent
   )
   return Windows.HRESULT is abstract;
   
   function SetDataTemplateComponent
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Markup.IDataTemplateComponent
   )
   return Windows.HRESULT is abstract;
   
   function SuspendRendering
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; target : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function ResumeRendering
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; target : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function ConvertValue
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; type_x : Windows.UI.Xaml.Interop.TypeName
      ; value : Windows.Object
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromString
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromBoolean
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromChar16
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromDateTime
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromDouble
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromInt32
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromUInt32
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromInt64
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromUInt64
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromSingle
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromPoint
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromRect
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromSize
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromTimeSpan
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromByte
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromUri
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyFromObject
   (
      This       : access IXamlBindingHelperStatics_Interface
      ; dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IXamlMarkupHelper : aliased constant Windows.IID := (3504760636, 21314, 17647, (133, 167, 237, 50, 122, 115, 157, 154 ));
   
   type IXamlMarkupHelper_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IXamlMarkupHelperStatics : aliased constant Windows.IID := (3384555301, 62287, 17500, (129, 162, 107, 114, 165, 232, 240, 114 ));
   
   type IXamlMarkupHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function UnloadObject
   (
      This       : access IXamlMarkupHelperStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IXamlReader : aliased constant Windows.IID := (607603953, 52459, 18623, (165, 20, 65, 176, 24, 111, 132, 194 ));
   
   type IXamlReader_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   IID_IXamlReaderStatics : aliased constant Windows.IID := (2559690429, 21327, 18773, (184, 90, 138, 141, 192, 220, 166, 2 ));
   
   type IXamlReaderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Load
   (
      This       : access IXamlReaderStatics_Interface
      ; xaml : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function LoadWithInitialTemplateValidation
   (
      This       : access IXamlReaderStatics_Interface
      ; xaml : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MarkupExtension is Windows.UI.Xaml.Markup.IMarkupExtension;
   
   type IMarkupExtensionOverrides_Interface_Impl is new IMarkupExtensionOverrides_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IMarkupExtensionOverrides := null;
      m_IMarkupExtension : IMarkupExtension := null;
   end record;
   
   type IMarkupExtensionOverrides_Impl is access all IMarkupExtensionOverrides_Interface_Impl'Class;
   type IMarkupExtensionOverrides_Impl_Ptr is access all IMarkupExtensionOverrides_Impl;
   
   function QueryInterface
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   function ProvideValue
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT;
   
   type IMarkupExtension_Interface_Impl is new IMarkupExtension_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IMarkupExtension := null;
      m_IMarkupExtension : IMarkupExtension := null;
   end record;
   
   type IMarkupExtension_Impl is access all IMarkupExtension_Interface_Impl'Class;
   type IMarkupExtension_Impl_Ptr is access all IMarkupExtension_Impl;
   
   function QueryInterface
   (
      This       : access IMarkupExtension_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IMarkupExtension_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IMarkupExtension_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IMarkupExtension_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IMarkupExtension_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IMarkupExtension_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   
   subtype XamlBinaryWriter is Windows.UI.Xaml.Markup.IXamlBinaryWriter;
   subtype XamlBindingHelper is Windows.UI.Xaml.Markup.IXamlBindingHelper;
   subtype XamlMarkupHelper is Windows.UI.Xaml.Markup.IXamlMarkupHelper;
   subtype XamlReader is Windows.UI.Xaml.Markup.IXamlReader;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Markup.IMarkupExtension;
   
   function Write
   (
      inputStreams : Windows.Storage.Streams.IVector_IRandomAccessStream
      ; outputStreams : Windows.Storage.Streams.IVector_IRandomAccessStream
      ; xamlMetadataProvider : Windows.UI.Xaml.Markup.IXamlMetadataProvider
   )
   return Windows.UI.Xaml.Markup.XamlBinaryWriterErrorInformation;
   
   function get_DataTemplateComponentProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetDataTemplateComponent
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Markup.IDataTemplateComponent;
   
   procedure SetDataTemplateComponent
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Markup.IDataTemplateComponent
   )
   ;
   
   procedure SuspendRendering
   (
      target : Windows.UI.Xaml.IUIElement
   )
   ;
   
   procedure ResumeRendering
   (
      target : Windows.UI.Xaml.IUIElement
   )
   ;
   
   function ConvertValue
   (
      type_x : Windows.UI.Xaml.Interop.TypeName
      ; value : Windows.Object
   )
   return Windows.Object;
   
   procedure SetPropertyFromString
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.String
   )
   ;
   
   procedure SetPropertyFromBoolean
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Boolean
   )
   ;
   
   procedure SetPropertyFromChar16
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt8
   )
   ;
   
   procedure SetPropertyFromDateTime
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.DateTime
   )
   ;
   
   procedure SetPropertyFromDouble
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Double
   )
   ;
   
   procedure SetPropertyFromInt32
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Int32
   )
   ;
   
   procedure SetPropertyFromUInt32
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt32
   )
   ;
   
   procedure SetPropertyFromInt64
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Int64
   )
   ;
   
   procedure SetPropertyFromUInt64
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt64
   )
   ;
   
   procedure SetPropertyFromSingle
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Single
   )
   ;
   
   procedure SetPropertyFromPoint
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Point
   )
   ;
   
   procedure SetPropertyFromRect
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Rect
   )
   ;
   
   procedure SetPropertyFromSize
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Size
   )
   ;
   
   procedure SetPropertyFromTimeSpan
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.TimeSpan
   )
   ;
   
   procedure SetPropertyFromByte
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt8
   )
   ;
   
   procedure SetPropertyFromUri
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   ;
   
   procedure SetPropertyFromObject
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Object
   )
   ;
   
   procedure UnloadObject
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   ;
   
   function Load
   (
      xaml : Windows.String
   )
   return Windows.Object;
   
   function LoadWithInitialTemplateValidation
   (
      xaml : Windows.String
   )
   return Windows.Object;

end;
