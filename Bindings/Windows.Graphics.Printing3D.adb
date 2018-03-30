--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.UI;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Printing3D is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access Print3DTaskSourceRequestedHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_Print3DTaskSourceRequestedHandler or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
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
   
   function QueryInterface(This : access TypedEventHandler_IPrint3DTask_add_Submitting_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IPrint3DTask_add_Submitting or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_IPrint3DTask_add_Completed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IPrint3DTask_add_Completed or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_IPrint3DTask_add_SourceChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IPrint3DTask_add_SourceChanged or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_IPrint3DManager_add_TaskRequested_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IPrint3DManager_add_TaskRequested or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IPrinting3DMeshVerificationResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IPrinting3D3MFPackage_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IPrinting3D3MFPackage or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IPrinting3DModel_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IPrinting3DModel or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   
   function CreatePrinting3DTextureResource return Windows.Graphics.Printing3D.IPrinting3DTextureResource is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DTextureResource");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DTextureResource := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DTextureResource'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3DComponent return Windows.Graphics.Printing3D.IPrinting3DComponent is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DComponent");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DComponent := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DComponent'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3DMesh return Windows.Graphics.Printing3D.IPrinting3DMesh is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DMesh");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DMesh := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DMesh'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3DComponentWithMatrix return Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DComponentWithMatrix");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DComponentWithMatrix'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3DColorMaterial return Windows.Graphics.Printing3D.IPrinting3DColorMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DColorMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DColorMaterial := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DColorMaterial'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3DModelTexture return Windows.Graphics.Printing3D.IPrinting3DModelTexture is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DModelTexture");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DModelTexture := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DModelTexture'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
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
   
   function CreatePrinting3DBaseMaterial return Windows.Graphics.Printing3D.IPrinting3DBaseMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DBaseMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DBaseMaterial := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DBaseMaterial'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
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
   
   function CreatePrinting3DTexture2CoordMaterial return Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DTexture2CoordMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DTexture2CoordMaterial'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
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
   
   function CreatePrinting3DCompositeMaterial return Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DCompositeMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DCompositeMaterial'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
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
   
   function CreatePrinting3DMultiplePropertyMaterial return Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DMultiplePropertyMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DMultiplePropertyMaterial'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3DMaterial return Windows.Graphics.Printing3D.IPrinting3DMaterial is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DMaterial");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DMaterial := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DMaterial'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3DModel return Windows.Graphics.Printing3D.IPrinting3DModel is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DModel");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DModel := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DModel'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3DFaceReductionOptions return Windows.Graphics.Printing3D.IPrinting3DFaceReductionOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3DFaceReductionOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3DFaceReductionOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3DFaceReductionOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePrinting3D3MFPackage return Windows.Graphics.Printing3D.IPrinting3D3MFPackage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing3D.Printing3D3MFPackage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing3D.IPrinting3D3MFPackage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Graphics.Printing3D.IID_IPrinting3D3MFPackage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
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
