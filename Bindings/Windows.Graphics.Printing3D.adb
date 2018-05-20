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
with Windows.Storage.Streams;
with Windows.UI;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Printing3D is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access Print3DTaskSourceRequestedHandler_Interface
      ; args : Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DTask_add_Submitting_Interface
      ; sender : Windows.Graphics.Printing3D.IPrint3DTask
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing3D.IPrint3DTask(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DTask_add_Completed_Interface
      ; sender : Windows.Graphics.Printing3D.IPrint3DTask
      ; args : Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing3D.IPrint3DTask(sender), Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DTask_add_SourceChanged_Interface
      ; sender : Windows.Graphics.Printing3D.IPrint3DTask
      ; args : Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing3D.IPrint3DTask(sender), Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrint3DManager_add_TaskRequested_Interface
      ; sender : Windows.Graphics.Printing3D.IPrint3DManager
      ; args : Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing3D.IPrint3DManager(sender), Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult_Interface
      ; asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3DMeshVerificationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPrinting3D3MFPackage_Interface
      ; asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3D3MFPackage
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPrinting3DModel_Interface
      ; asyncInfo : Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3DModel
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DTextureResource is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DTextureResource");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DTextureResource) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DTextureResource'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DComponent is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DComponent");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DComponent) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DComponent'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DMesh is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DMesh");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DMesh) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DMesh'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DComponentWithMatrix");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DComponentWithMatrix'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DColorMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DColorMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DColorMaterial) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DColorMaterial'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DModelTexture is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DModelTexture");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DModelTexture) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DModelTexture'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DBaseMaterialGroup");
      m_Factory     : Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrinting3DBaseMaterialGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(MaterialGroupId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DBaseMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DBaseMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DBaseMaterial) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DBaseMaterial'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DColorMaterialGroup");
      m_Factory     : Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrinting3DColorMaterialGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(MaterialGroupId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DTexture2CoordMaterialGroup");
      m_Factory     : Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrinting3DTexture2CoordMaterialGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(MaterialGroupId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DTexture2CoordMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DTexture2CoordMaterial'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DCompositeMaterialGroup");
      m_Factory     : Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrinting3DCompositeMaterialGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(MaterialGroupId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DCompositeMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DCompositeMaterial'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      MaterialGroupId : Windows.UInt32
   )
   return Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DMultiplePropertyMaterialGroup");
      m_Factory     : Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroupFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrinting3DMultiplePropertyMaterialGroupFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(MaterialGroupId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DMultiplePropertyMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DMultiplePropertyMaterial'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DMaterial) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DMaterial'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DModel is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DModel");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DModel) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DModel'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3DFaceReductionOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DFaceReductionOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3DFaceReductionOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DFaceReductionOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create return Windows.Graphics.Printing3D.IPrinting3D3MFPackage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3D3MFPackage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Graphics.Printing3D.IPrinting3D3MFPackage) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3D3MFPackage'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.Graphics.Printing3D.IPrint3DManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Print3DManager");
      m_Factory     : IPrint3DManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrint3DManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrint3DManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowPrintUIAsync
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Print3DManager");
      m_Factory     : IPrint3DManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrint3DManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowPrintUIAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Abs
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DBaseMaterial");
      m_Factory     : IPrinting3DBaseMaterialStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrinting3DBaseMaterialStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Abs(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Pla
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DBaseMaterial");
      m_Factory     : IPrinting3DBaseMaterialStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrinting3DBaseMaterialStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Pla(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadAsync
   (
      value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3D3MFPackage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3D3MFPackage");
      m_Factory     : IPrinting3D3MFPackageStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IAsyncOperation_IPrinting3D3MFPackage;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrinting3D3MFPackageStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadAsync(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
