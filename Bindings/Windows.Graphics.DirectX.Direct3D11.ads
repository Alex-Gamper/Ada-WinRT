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
package Windows.Graphics.DirectX.Direct3D11 is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type Direct3DUsage is (
      Default,
      Immutable,
      Dynamic,
      Staging
   );
   for Direct3DUsage use (
      Default => 0,
      Immutable => 1,
      Dynamic => 2,
      Staging => 3
   );
   for Direct3DUsage'Size use 32;
   
   type Direct3DUsage_Ptr is access Direct3DUsage;
   
   type Direct3DBindings is (
      VertexBuffer,
      IndexBuffer,
      ConstantBuffer,
      ShaderResource,
      StreamOutput,
      RenderTarget,
      DepthStencil,
      UnorderedAccess,
      Decoder,
      VideoEncoder
   );
   for Direct3DBindings use (
      VertexBuffer => 1,
      IndexBuffer => 2,
      ConstantBuffer => 4,
      ShaderResource => 8,
      StreamOutput => 16,
      RenderTarget => 32,
      DepthStencil => 64,
      UnorderedAccess => 128,
      Decoder => 512,
      VideoEncoder => 1024
   );
   for Direct3DBindings'Size use 32;
   
   type Direct3DBindings_Ptr is access Direct3DBindings;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type Direct3DMultisampleDescription is record
      Count : Windows.Int32;
      Quality : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , Direct3DMultisampleDescription);
   
   type Direct3DMultisampleDescription_Ptr is access Direct3DMultisampleDescription;
   
   type Direct3DSurfaceDescription is record
      Width : Windows.Int32;
      Height : Windows.Int32;
      Format : Windows.Graphics.DirectX.DirectXPixelFormat;
      MultisampleDescription : Windows.Graphics.DirectX.Direct3D11.Direct3DMultisampleDescription;
   end record;
   pragma Convention (C_Pass_By_Copy , Direct3DSurfaceDescription);
   
   type Direct3DSurfaceDescription_Ptr is access Direct3DSurfaceDescription;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDirect3DDevice_Interface;
   type IDirect3DDevice is access all IDirect3DDevice_Interface'Class;
   type IDirect3DDevice_Ptr is access all IDirect3DDevice;
   type IDirect3DSurface_Interface;
   type IDirect3DSurface is access all IDirect3DSurface_Interface'Class;
   type IDirect3DSurface_Ptr is access all IDirect3DSurface;
   type IIterator_IDirect3DSurface_Interface;
   type IIterator_IDirect3DSurface is access all IIterator_IDirect3DSurface_Interface'Class;
   type IIterator_IDirect3DSurface_Ptr is access all IIterator_IDirect3DSurface;
   type IIterable_IDirect3DSurface_Interface;
   type IIterable_IDirect3DSurface is access all IIterable_IDirect3DSurface_Interface'Class;
   type IIterable_IDirect3DSurface_Ptr is access all IIterable_IDirect3DSurface;
   type IVectorView_IDirect3DSurface_Interface;
   type IVectorView_IDirect3DSurface is access all IVectorView_IDirect3DSurface_Interface'Class;
   type IVectorView_IDirect3DSurface_Ptr is access all IVectorView_IDirect3DSurface;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDirect3DDevice : aliased constant Windows.IID := (2742428843, 36191, 18000, (157, 62, 158, 174, 61, 155, 198, 112 ));
   
   type IDirect3DDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function Trim
   (
      This       : access IDirect3DDevice_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDirect3DSurface : aliased constant Windows.IID := (200581446, 5057, 18068, (190, 227, 122, 191, 21, 234, 245, 134 ));
   
   type IDirect3DSurface_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Description
   (
      This       : access IDirect3DSurface_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.Direct3DSurfaceDescription
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IDirect3DSurface : aliased constant Windows.IID := (3187371275, 59269, 23898, (171, 210, 254, 27, 24, 196, 50, 87 ));
   
   type IIterator_IDirect3DSurface_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IDirect3DSurface_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IDirect3DSurface_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IDirect3DSurface_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IDirect3DSurface_Interface
      ; items : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IDirect3DSurface : aliased constant Windows.IID := (3429089180, 57706, 23157, (165, 170, 43, 83, 249, 117, 176, 176 ));
   
   type IIterable_IDirect3DSurface_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IDirect3DSurface_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IIterator_IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IDirect3DSurface : aliased constant Windows.IID := (444722238, 23291, 24080, (146, 187, 200, 67, 254, 199, 8, 135 ));
   
   type IVectorView_IDirect3DSurface_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IDirect3DSurface_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IDirect3DSurface_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IDirect3DSurface_Interface
      ; value : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IDirect3DSurface_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
