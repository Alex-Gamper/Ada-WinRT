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
limited with Windows.UI.Xaml.Media;
limited with Windows.UI.Composition;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Shapes is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IShape_Interface;
   type IShape is access all IShape_Interface'Class;
   type IShape_Ptr is access all IShape;
   type IShapeStatics_Interface;
   type IShapeStatics is access all IShapeStatics_Interface'Class;
   type IShapeStatics_Ptr is access all IShapeStatics;
   type IShapeFactory_Interface;
   type IShapeFactory is access all IShapeFactory_Interface'Class;
   type IShapeFactory_Ptr is access all IShapeFactory;
   type IShape2_Interface;
   type IShape2 is access all IShape2_Interface'Class;
   type IShape2_Ptr is access all IShape2;
   type IEllipse_Interface;
   type IEllipse is access all IEllipse_Interface'Class;
   type IEllipse_Ptr is access all IEllipse;
   type ILine_Interface;
   type ILine is access all ILine_Interface'Class;
   type ILine_Ptr is access all ILine;
   type ILineStatics_Interface;
   type ILineStatics is access all ILineStatics_Interface'Class;
   type ILineStatics_Ptr is access all ILineStatics;
   type IPath_Interface;
   type IPath is access all IPath_Interface'Class;
   type IPath_Ptr is access all IPath;
   type IPathStatics_Interface;
   type IPathStatics is access all IPathStatics_Interface'Class;
   type IPathStatics_Ptr is access all IPathStatics;
   type IPathFactory_Interface;
   type IPathFactory is access all IPathFactory_Interface'Class;
   type IPathFactory_Ptr is access all IPathFactory;
   type IPolygon_Interface;
   type IPolygon is access all IPolygon_Interface'Class;
   type IPolygon_Ptr is access all IPolygon;
   type IPolygonStatics_Interface;
   type IPolygonStatics is access all IPolygonStatics_Interface'Class;
   type IPolygonStatics_Ptr is access all IPolygonStatics;
   type IPolyline_Interface;
   type IPolyline is access all IPolyline_Interface'Class;
   type IPolyline_Ptr is access all IPolyline;
   type IPolylineStatics_Interface;
   type IPolylineStatics is access all IPolylineStatics_Interface'Class;
   type IPolylineStatics_Ptr is access all IPolylineStatics;
   type IRectangle_Interface;
   type IRectangle is access all IRectangle_Interface'Class;
   type IRectangle_Ptr is access all IRectangle;
   type IRectangleStatics_Interface;
   type IRectangleStatics is access all IRectangleStatics_Interface'Class;
   type IRectangleStatics_Ptr is access all IRectangleStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IShape : aliased constant Windows.IID := (2020551541, 39584, 17741, (174, 6, 162, 70, 110, 55, 200, 50 ));
   
   type IShape_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Fill
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Fill
   (
      This       : access IShape_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Stroke
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Stroke
   (
      This       : access IShape_Interface
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeMiterLimit
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeMiterLimit
   (
      This       : access IShape_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeThickness
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeThickness
   (
      This       : access IShape_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeStartLineCap
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeStartLineCap
   (
      This       : access IShape_Interface
      ; value : Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeEndLineCap
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeEndLineCap
   (
      This       : access IShape_Interface
      ; value : Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeLineJoin
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.PenLineJoin
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeLineJoin
   (
      This       : access IShape_Interface
      ; value : Windows.UI.Xaml.Media.PenLineJoin
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashOffset
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeDashOffset
   (
      This       : access IShape_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashCap
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeDashCap
   (
      This       : access IShape_Interface
      ; value : Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashArray
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Double
   )
   return Windows.HRESULT is abstract;
   
   function put_StrokeDashArray
   (
      This       : access IShape_Interface
      ; value : Windows.UI.Xaml.Media.IVector_Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Stretch
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Stretch
   )
   return Windows.HRESULT is abstract;
   
   function put_Stretch
   (
      This       : access IShape_Interface
      ; value : Windows.UI.Xaml.Media.Stretch
   )
   return Windows.HRESULT is abstract;
   
   function get_GeometryTransform
   (
      This       : access IShape_Interface
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShapeStatics : aliased constant Windows.IID := (494619733, 40435, 18652, (145, 148, 157, 48, 111, 170, 96, 137 ));
   
   type IShapeStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeMiterLimitProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeThicknessProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeStartLineCapProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeEndLineCapProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeLineJoinProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashOffsetProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashCapProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StrokeDashArrayProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StretchProperty
   (
      This       : access IShapeStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShapeFactory : aliased constant Windows.IID := (1265726995, 63146, 18645, (149, 136, 225, 209, 136, 234, 203, 201 ));
   
   type IShapeFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IShapeFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Shapes.IShape
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShape2 : aliased constant Windows.IID := (2535755194, 18930, 18852, (165, 221, 22, 77, 248, 36, 219, 20 ));
   
   type IShape2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAlphaMask
   (
      This       : access IShape2_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEllipse : aliased constant Windows.IID := (1893751492, 54157, 19371, (131, 31, 74, 34, 239, 82, 172, 134 ));
   
   type IEllipse_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ILine : aliased constant Windows.IID := (1185235773, 20475, 18655, (135, 50, 78, 21, 200, 52, 129, 107 ));
   
   type ILine_Interface is interface and Windows.IInspectable_Interface;
   
   function get_X1
   (
      This       : access ILine_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_X1
   (
      This       : access ILine_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Y1
   (
      This       : access ILine_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Y1
   (
      This       : access ILine_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_X2
   (
      This       : access ILine_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_X2
   (
      This       : access ILine_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Y2
   (
      This       : access ILine_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Y2
   (
      This       : access ILine_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILineStatics : aliased constant Windows.IID := (645665341, 28324, 19536, (139, 29, 80, 32, 122, 255, 30, 138 ));
   
   type ILineStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_X1Property
   (
      This       : access ILineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Y1Property
   (
      This       : access ILineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_X2Property
   (
      This       : access ILineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_Y2Property
   (
      This       : access ILineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPath : aliased constant Windows.IID := (2022192649, 15703, 20284, (184, 165, 108, 171, 202, 201, 113, 31 ));
   
   type IPath_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IPath_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IPath_Interface
      ; value : Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPathStatics : aliased constant Windows.IID := (4129809821, 34780, 16706, (129, 241, 151, 252, 127, 248, 100, 28 ));
   
   type IPathStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataProperty
   (
      This       : access IPathStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPathFactory : aliased constant Windows.IID := (591439075, 23174, 20422, (154, 80, 203, 185, 59, 130, 135, 102 ));
   
   type IPathFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPathFactory_Interface
      ; outer : Windows.Object
      ; inner : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Shapes.IPath
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPolygon : aliased constant Windows.IID := (3816119321, 11853, 19404, (141, 52, 134, 135, 25, 87, 250, 1 ));
   
   type IPolygon_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillRule
   (
      This       : access IPolygon_Interface
      ; RetVal : access Windows.UI.Xaml.Media.FillRule
   )
   return Windows.HRESULT is abstract;
   
   function put_FillRule
   (
      This       : access IPolygon_Interface
      ; value : Windows.UI.Xaml.Media.FillRule
   )
   return Windows.HRESULT is abstract;
   
   function get_Points
   (
      This       : access IPolygon_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Points
   (
      This       : access IPolygon_Interface
      ; value : Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPolygonStatics : aliased constant Windows.IID := (908757675, 54371, 17254, (158, 26, 190, 186, 114, 129, 15, 183 ));
   
   type IPolygonStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillRuleProperty
   (
      This       : access IPolygonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PointsProperty
   (
      This       : access IPolygonStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPolyline : aliased constant Windows.IID := (2447139576, 17075, 18419, (132, 118, 197, 81, 36, 167, 196, 198 ));
   
   type IPolyline_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillRule
   (
      This       : access IPolyline_Interface
      ; RetVal : access Windows.UI.Xaml.Media.FillRule
   )
   return Windows.HRESULT is abstract;
   
   function put_FillRule
   (
      This       : access IPolyline_Interface
      ; value : Windows.UI.Xaml.Media.FillRule
   )
   return Windows.HRESULT is abstract;
   
   function get_Points
   (
      This       : access IPolyline_Interface
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   function put_Points
   (
      This       : access IPolyline_Interface
      ; value : Windows.UI.Xaml.Media.IVector_Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPolylineStatics : aliased constant Windows.IID := (3349818577, 41580, 17328, (170, 165, 130, 47, 166, 74, 17, 185 ));
   
   type IPolylineStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FillRuleProperty
   (
      This       : access IPolylineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_PointsProperty
   (
      This       : access IPolylineStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRectangle : aliased constant Windows.IID := (2237383216, 35345, 19992, (161, 54, 75, 194, 28, 120, 39, 176 ));
   
   type IRectangle_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RadiusX
   (
      This       : access IRectangle_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RadiusX
   (
      This       : access IRectangle_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RadiusY
   (
      This       : access IRectangle_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RadiusY
   (
      This       : access IRectangle_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRectangleStatics : aliased constant Windows.IID := (2670045779, 47930, 19516, (137, 219, 111, 188, 13, 31, 160, 204 ));
   
   type IRectangleStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RadiusXProperty
   (
      This       : access IRectangleStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RadiusYProperty
   (
      This       : access IRectangleStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Shape is Windows.UI.Xaml.Shapes.IShape;
   
   type IShape_Interface_Impl is new IShape_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IShape := null;
      m_IShape : IShape := null;
   end record;
   type IShape_Impl is access all IShape_Interface_Impl'Class;
   type IShape_Impl_Ptr is access all IShape_Impl;
   
   function QueryInterface
   (
      This       : access IShape_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IShape_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IShape_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IShape_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IShape_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IShape_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_Fill
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_Fill
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_Stroke
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function put_Stroke
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IBrush
   )
   return Windows.HRESULT;
   
   function get_StrokeMiterLimit
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_StrokeMiterLimit
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_StrokeThickness
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_StrokeThickness
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_StrokeStartLineCap
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT;
   
   function put_StrokeStartLineCap
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT;
   
   function get_StrokeEndLineCap
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT;
   
   function put_StrokeEndLineCap
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT;
   
   function get_StrokeLineJoin
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.PenLineJoin
   )
   return Windows.HRESULT;
   
   function put_StrokeLineJoin
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.UI.Xaml.Media.PenLineJoin
   )
   return Windows.HRESULT;
   
   function get_StrokeDashOffset
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT;
   
   function put_StrokeDashOffset
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT;
   
   function get_StrokeDashCap
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT;
   
   function put_StrokeDashCap
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.UI.Xaml.Media.PenLineCap
   )
   return Windows.HRESULT;
   
   function get_StrokeDashArray
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IVector_Double
   )
   return Windows.HRESULT;
   
   function put_StrokeDashArray
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IVector_Double
   )
   return Windows.HRESULT;
   
   function get_Stretch
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Stretch
   )
   return Windows.HRESULT;
   
   function put_Stretch
   (
      This       : access IShape_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Stretch
   )
   return Windows.HRESULT;
   
   function get_GeometryTransform
   (
      This       : access IShape_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.ITransform
   )
   return Windows.HRESULT;
   
   subtype Ellipse is Windows.UI.Xaml.Shapes.IEllipse;
   function Create return Windows.UI.Xaml.Shapes.IEllipse;
   
   subtype Line is Windows.UI.Xaml.Shapes.ILine;
   function Create return Windows.UI.Xaml.Shapes.ILine;
   
   subtype Path is Windows.UI.Xaml.Shapes.IPath;
   
   type IPath_Interface_Impl is new IPath_Interface with record
      m_RefCount : aliased Windows.UInt32 := 0;
      m_FTM      : aliased IUnknown := null;
      m_Inner    : aliased IPath := null;
      m_IPath : IPath := null;
   end record;
   type IPath_Impl is access all IPath_Interface_Impl'Class;
   type IPath_Impl_Ptr is access all IPath_Impl;
   
   function QueryInterface
   (
      This       : access IPath_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT;
   
   function AddRef
   (
      This       : access IPath_Interface_Impl
   )
   return Windows.UInt32;
   
   function Release
   (
      This       : access IPath_Interface_Impl
   )
   return Windows.UInt32;
   
   function GetIids
   (
      This       : access IPath_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT;
   
   function GetRuntimeClassName
   (
      This       : access IPath_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT;
   
   function GetTrustLevel
   (
      This       : access IPath_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT;
   
   function get_Data
   (
      This       : access IPath_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT;
   
   function put_Data
   (
      This       : access IPath_Interface_Impl
      ; value : Windows.UI.Xaml.Media.IGeometry
   )
   return Windows.HRESULT;
   
   subtype Polygon is Windows.UI.Xaml.Shapes.IPolygon;
   function Create return Windows.UI.Xaml.Shapes.IPolygon;
   
   subtype Polyline is Windows.UI.Xaml.Shapes.IPolyline;
   function Create return Windows.UI.Xaml.Shapes.IPolyline;
   
   subtype Rectangle is Windows.UI.Xaml.Shapes.IRectangle;
   function Create return Windows.UI.Xaml.Shapes.IRectangle;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Shapes.IShape;
   
   function get_FillProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeMiterLimitProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeStartLineCapProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeEndLineCapProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeLineJoinProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeDashOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeDashCapProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StrokeDashArrayProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_StretchProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_X1Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Y1Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_X2Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_Y2Property
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_DataProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Shapes.IPath;
   
   function get_FillRuleProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_FillRuleProperty_IPolyline
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_PointsProperty_IPolyline
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RadiusXProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_RadiusYProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
end;
