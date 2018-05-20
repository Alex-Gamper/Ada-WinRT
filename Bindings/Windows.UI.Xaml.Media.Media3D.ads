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
package Windows.UI.Xaml.Media.Media3D is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type Matrix3D is record
      M11 : Windows.Double;
      M12 : Windows.Double;
      M13 : Windows.Double;
      M14 : Windows.Double;
      M21 : Windows.Double;
      M22 : Windows.Double;
      M23 : Windows.Double;
      M24 : Windows.Double;
      M31 : Windows.Double;
      M32 : Windows.Double;
      M33 : Windows.Double;
      M34 : Windows.Double;
      OffsetX : Windows.Double;
      OffsetY : Windows.Double;
      OffsetZ : Windows.Double;
      M44 : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , Matrix3D);
   
   type Matrix3D_Ptr is access Matrix3D;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMatrix3DHelper_Interface;
   type IMatrix3DHelper is access all IMatrix3DHelper_Interface'Class;
   type IMatrix3DHelper_Ptr is access all IMatrix3DHelper;
   type IMatrix3DHelperStatics_Interface;
   type IMatrix3DHelperStatics is access all IMatrix3DHelperStatics_Interface'Class;
   type IMatrix3DHelperStatics_Ptr is access all IMatrix3DHelperStatics;
   type ITransform3D_Interface;
   type ITransform3D is access all ITransform3D_Interface'Class;
   type ITransform3D_Ptr is access all ITransform3D;
   type ITransform3DFactory_Interface;
   type ITransform3DFactory is access all ITransform3DFactory_Interface'Class;
   type ITransform3DFactory_Ptr is access all ITransform3DFactory;
   type ICompositeTransform3D_Interface;
   type ICompositeTransform3D is access all ICompositeTransform3D_Interface'Class;
   type ICompositeTransform3D_Ptr is access all ICompositeTransform3D;
   type ICompositeTransform3DStatics_Interface;
   type ICompositeTransform3DStatics is access all ICompositeTransform3DStatics_Interface'Class;
   type ICompositeTransform3DStatics_Ptr is access all ICompositeTransform3DStatics;
   type IPerspectiveTransform3D_Interface;
   type IPerspectiveTransform3D is access all IPerspectiveTransform3D_Interface'Class;
   type IPerspectiveTransform3D_Ptr is access all IPerspectiveTransform3D;
   type IPerspectiveTransform3DStatics_Interface;
   type IPerspectiveTransform3DStatics is access all IPerspectiveTransform3DStatics_Interface'Class;
   type IPerspectiveTransform3DStatics_Ptr is access all IPerspectiveTransform3DStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMatrix3DHelper : aliased constant Windows.IID := (3834384623, 39207, 19611, (130, 19, 7, 119, 85, 18, 186, 4 ));
   
   type IMatrix3DHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMatrix3DHelperStatics : aliased constant Windows.IID := (2456048734, 57688, 20084, (136, 153, 104, 145, 96, 189, 47, 140 ));
   
   type IMatrix3DHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Identity
   (
      This       : access IMatrix3DHelperStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.HRESULT is abstract;
   
   function Multiply
   (
      This       : access IMatrix3DHelperStatics_Interface
      ; matrix1 : Windows.UI.Xaml.Media.Media3D.Matrix3D
      ; matrix2 : Windows.UI.Xaml.Media.Media3D.Matrix3D
      ; RetVal : access Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.HRESULT is abstract;
   
   function FromElements
   (
      This       : access IMatrix3DHelperStatics_Interface
      ; m11 : Windows.Double
      ; m12 : Windows.Double
      ; m13 : Windows.Double
      ; m14 : Windows.Double
      ; m21 : Windows.Double
      ; m22 : Windows.Double
      ; m23 : Windows.Double
      ; m24 : Windows.Double
      ; m31 : Windows.Double
      ; m32 : Windows.Double
      ; m33 : Windows.Double
      ; m34 : Windows.Double
      ; offsetX : Windows.Double
      ; offsetY : Windows.Double
      ; offsetZ : Windows.Double
      ; m44 : Windows.Double
      ; RetVal : access Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.HRESULT is abstract;
   
   function GetHasInverse
   (
      This       : access IMatrix3DHelperStatics_Interface
      ; target : Windows.UI.Xaml.Media.Media3D.Matrix3D
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetIsIdentity
   (
      This       : access IMatrix3DHelperStatics_Interface
      ; target : Windows.UI.Xaml.Media.Media3D.Matrix3D
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Invert
   (
      This       : access IMatrix3DHelperStatics_Interface
      ; target : Windows.UI.Xaml.Media.Media3D.Matrix3D
      ; RetVal : access Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITransform3D : aliased constant Windows.IID := (2923353146, 43516, 19505, (134, 205, 86, 217, 202, 37, 26, 105 ));
   
   type ITransform3D_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITransform3DFactory : aliased constant Windows.IID := (86777722, 36211, 18637, (187, 184, 208, 4, 52, 202, 174, 93 ));
   
   type ITransform3DFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access ITransform3DFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Media.Media3D.ITransform3D
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositeTransform3D : aliased constant Windows.IID := (2306329345, 44941, 19189, (176, 132, 192, 142, 185, 112, 74, 190 ));
   
   type ICompositeTransform3D_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterX
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterX
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterY
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterY
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterZ
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterZ
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationX
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationX
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationY
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationY
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationZ
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationZ
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleX
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleX
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleY
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleY
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleZ
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleZ
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateX
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TranslateX
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateY
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TranslateY
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateZ
   (
      This       : access ICompositeTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TranslateZ
   (
      This       : access ICompositeTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositeTransform3DStatics : aliased constant Windows.IID := (3720301927, 10789, 18675, (152, 8, 197, 30, 195, 213, 91, 236 ));
   
   type ICompositeTransform3DStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CenterXProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterYProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterZProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationXProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationYProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationZProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleXProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleYProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleZProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateXProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateYProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TranslateZProperty
   (
      This       : access ICompositeTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerspectiveTransform3D : aliased constant Windows.IID := (2591773482, 12537, 16545, (150, 201, 197, 157, 135, 249, 90, 195 ));
   
   type IPerspectiveTransform3D_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Depth
   (
      This       : access IPerspectiveTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Depth
   (
      This       : access IPerspectiveTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetX
   (
      This       : access IPerspectiveTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_OffsetX
   (
      This       : access IPerspectiveTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetY
   (
      This       : access IPerspectiveTransform3D_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_OffsetY
   (
      This       : access IPerspectiveTransform3D_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerspectiveTransform3DStatics : aliased constant Windows.IID := (2389664768, 25100, 18631, (132, 77, 63, 9, 132, 218, 91, 23 ));
   
   type IPerspectiveTransform3DStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DepthProperty
   (
      This       : access IPerspectiveTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetXProperty
   (
      This       : access IPerspectiveTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OffsetYProperty
   (
      This       : access IPerspectiveTransform3DStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Matrix3DHelper is Windows.UI.Xaml.Media.Media3D.IMatrix3DHelper;
   subtype Transform3D is Windows.UI.Xaml.Media.Media3D.ITransform3D;
   
   type ITransform3D_Interface_Impl is new ITransform3D_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased ITransform3D := null;
      m_ITransform3D : ITransform3D := null;
   end record;
   type ITransform3D_Impl is access all ITransform3D_Interface_Impl'Class;
   type ITransform3D_Impl_Ptr is access all ITransform3D_Impl;
   
   function QueryInterface
   (
      This       : access ITransform3D_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access ITransform3D_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access ITransform3D_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access ITransform3D_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access ITransform3D_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access ITransform3D_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   subtype CompositeTransform3D is Windows.UI.Xaml.Media.Media3D.ICompositeTransform3D;
   function Create return Windows.UI.Xaml.Media.Media3D.ICompositeTransform3D;
   
   subtype PerspectiveTransform3D is Windows.UI.Xaml.Media.Media3D.IPerspectiveTransform3D;
   function Create return Windows.UI.Xaml.Media.Media3D.IPerspectiveTransform3D;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Identity
   return Windows.UI.Xaml.Media.Media3D.Matrix3D;
   
   function Multiply
   (
      matrix1 : Windows.UI.Xaml.Media.Media3D.Matrix3D
      ; matrix2 : Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.UI.Xaml.Media.Media3D.Matrix3D;
   
   function FromElements
   (
      m11 : Windows.Double
      ; m12 : Windows.Double
      ; m13 : Windows.Double
      ; m14 : Windows.Double
      ; m21 : Windows.Double
      ; m22 : Windows.Double
      ; m23 : Windows.Double
      ; m24 : Windows.Double
      ; m31 : Windows.Double
      ; m32 : Windows.Double
      ; m33 : Windows.Double
      ; m34 : Windows.Double
      ; offsetX : Windows.Double
      ; offsetY : Windows.Double
      ; offsetZ : Windows.Double
      ; m44 : Windows.Double
   )
   return Windows.UI.Xaml.Media.Media3D.Matrix3D;
   
   function GetHasInverse
   (
      target : Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.Boolean;
   
   function GetIsIdentity
   (
      target : Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.Boolean;
   
   function Invert
   (
      target : Windows.UI.Xaml.Media.Media3D.Matrix3D
   )
   return Windows.UI.Xaml.Media.Media3D.Matrix3D;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Media3D.ITransform3D;
   
   function get_CenterXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_CenterZProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotationXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotationYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RotationZProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScaleXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScaleYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ScaleZProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TranslateXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TranslateYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_TranslateZProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DepthProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OffsetXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_OffsetYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
end;
