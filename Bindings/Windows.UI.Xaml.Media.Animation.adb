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
with Windows.UI.Xaml;
with Windows.UI;
with Windows.UI.Xaml.Controls.Primitives;
with Windows.UI.Composition;
with Windows.UI.Xaml.Controls;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Media.Animation is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IConnectedAnimation_add_Completed_Interface; riid : in Windows.GUID_Ptr ; pvObject : not null access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(Accessibility_Check);
   begin
      if riid.all = IID_TypedEventHandler_IConnectedAnimation_add_Completed or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IConnectedAnimation_add_Completed_Interface
      ; sender : Windows.UI.Xaml.Media.Animation.IConnectedAnimation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Media.Animation.IConnectedAnimation(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateTransitionCollection return Windows.UI.Xaml.Media.Animation.IVector_Transition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.TransitionCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IVector_Transition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IVector_Transition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDoubleKeyFrameCollection return Windows.UI.Xaml.Media.Animation.IVector_DoubleKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleKeyFrameCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IVector_DoubleKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IVector_DoubleKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateObjectKeyFrameCollection return Windows.UI.Xaml.Media.Animation.IVector_ObjectKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ObjectKeyFrameCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IVector_ObjectKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IVector_ObjectKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateTimelineCollection return Windows.UI.Xaml.Media.Animation.IVector_Timeline is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.TimelineCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IVector_Timeline := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IVector_Timeline'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateKeySpline return Windows.UI.Xaml.Media.Animation.IKeySpline is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.KeySpline");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IKeySpline := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IKeySpline'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAddDeleteThemeTransition return Windows.UI.Xaml.Media.Animation.IAddDeleteThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.AddDeleteThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IAddDeleteThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IAddDeleteThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBackEase return Windows.UI.Xaml.Media.Animation.IBackEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.BackEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IBackEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IBackEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBeginStoryboard return Windows.UI.Xaml.Media.Animation.IBeginStoryboard is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.BeginStoryboard");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IBeginStoryboard := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IBeginStoryboard'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBounceEase return Windows.UI.Xaml.Media.Animation.IBounceEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.BounceEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IBounceEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IBounceEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCircleEase return Windows.UI.Xaml.Media.Animation.ICircleEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.CircleEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ICircleEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ICircleEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateColorAnimation return Windows.UI.Xaml.Media.Animation.IColorAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IColorAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IColorAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateContentThemeTransition return Windows.UI.Xaml.Media.Animation.IContentThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContentThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IContentThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IContentThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCubicEase return Windows.UI.Xaml.Media.Animation.ICubicEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.CubicEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ICubicEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ICubicEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDiscreteDoubleKeyFrame return Windows.UI.Xaml.Media.Animation.IDiscreteDoubleKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DiscreteDoubleKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDiscreteDoubleKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDiscreteDoubleKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDiscreteObjectKeyFrame return Windows.UI.Xaml.Media.Animation.IDiscreteObjectKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DiscreteObjectKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDiscreteObjectKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDiscreteObjectKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDoubleAnimation return Windows.UI.Xaml.Media.Animation.IDoubleAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDoubleAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDoubleAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDoubleAnimationUsingKeyFrames return Windows.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFrames is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleAnimationUsingKeyFrames");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDoubleAnimationUsingKeyFrames := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDoubleAnimationUsingKeyFrames'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEasingDoubleKeyFrame return Windows.UI.Xaml.Media.Animation.IEasingDoubleKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EasingDoubleKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IEasingDoubleKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IEasingDoubleKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEdgeUIThemeTransition return Windows.UI.Xaml.Media.Animation.IEdgeUIThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EdgeUIThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IEdgeUIThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IEdgeUIThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateElasticEase return Windows.UI.Xaml.Media.Animation.IElasticEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ElasticEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IElasticEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IElasticEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEntranceThemeTransition return Windows.UI.Xaml.Media.Animation.IEntranceThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EntranceThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IEntranceThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IEntranceThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateExponentialEase return Windows.UI.Xaml.Media.Animation.IExponentialEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ExponentialEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IExponentialEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IExponentialEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLinearDoubleKeyFrame return Windows.UI.Xaml.Media.Animation.ILinearDoubleKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.LinearDoubleKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ILinearDoubleKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ILinearDoubleKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateObjectAnimationUsingKeyFrames return Windows.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFrames is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ObjectAnimationUsingKeyFrames");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IObjectAnimationUsingKeyFrames := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IObjectAnimationUsingKeyFrames'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePaneThemeTransition return Windows.UI.Xaml.Media.Animation.IPaneThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PaneThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPaneThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPaneThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePointAnimation return Windows.UI.Xaml.Media.Animation.IPointAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPointAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPointAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePopupThemeTransition return Windows.UI.Xaml.Media.Animation.IPopupThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopupThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPopupThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPopupThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePowerEase return Windows.UI.Xaml.Media.Animation.IPowerEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PowerEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPowerEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPowerEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateQuadraticEase return Windows.UI.Xaml.Media.Animation.IQuadraticEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.QuadraticEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IQuadraticEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IQuadraticEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateQuarticEase return Windows.UI.Xaml.Media.Animation.IQuarticEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.QuarticEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IQuarticEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IQuarticEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateQuinticEase return Windows.UI.Xaml.Media.Animation.IQuinticEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.QuinticEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IQuinticEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IQuinticEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateReorderThemeTransition return Windows.UI.Xaml.Media.Animation.IReorderThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ReorderThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IReorderThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IReorderThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRepositionThemeTransition return Windows.UI.Xaml.Media.Animation.IRepositionThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepositionThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IRepositionThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IRepositionThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSineEase return Windows.UI.Xaml.Media.Animation.ISineEase is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SineEase");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISineEase := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISineEase'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSplineDoubleKeyFrame return Windows.UI.Xaml.Media.Animation.ISplineDoubleKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplineDoubleKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISplineDoubleKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISplineDoubleKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStoryboard return Windows.UI.Xaml.Media.Animation.IStoryboard is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Storyboard");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IStoryboard := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IStoryboard'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateColorKeyFrameCollection return Windows.UI.Xaml.Media.Animation.IVector_ColorKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorKeyFrameCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IVector_ColorKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IVector_ColorKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePointKeyFrameCollection return Windows.UI.Xaml.Media.Animation.IVector_PointKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointKeyFrameCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IVector_PointKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IVector_PointKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateColorAnimationUsingKeyFrames return Windows.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFrames is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorAnimationUsingKeyFrames");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IColorAnimationUsingKeyFrames := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IColorAnimationUsingKeyFrames'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDiscreteColorKeyFrame return Windows.UI.Xaml.Media.Animation.IDiscreteColorKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DiscreteColorKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDiscreteColorKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDiscreteColorKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDiscretePointKeyFrame return Windows.UI.Xaml.Media.Animation.IDiscretePointKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DiscretePointKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDiscretePointKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDiscretePointKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDragItemThemeAnimation return Windows.UI.Xaml.Media.Animation.IDragItemThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DragItemThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDragItemThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDragItemThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDragOverThemeAnimation return Windows.UI.Xaml.Media.Animation.IDragOverThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DragOverThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDragOverThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDragOverThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDrillInThemeAnimation return Windows.UI.Xaml.Media.Animation.IDrillInThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDrillInThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDrillInThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDrillOutThemeAnimation return Windows.UI.Xaml.Media.Animation.IDrillOutThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDrillOutThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDrillOutThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDropTargetItemThemeAnimation return Windows.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DropTargetItemThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDropTargetItemThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDropTargetItemThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEasingColorKeyFrame return Windows.UI.Xaml.Media.Animation.IEasingColorKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EasingColorKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IEasingColorKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IEasingColorKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEasingPointKeyFrame return Windows.UI.Xaml.Media.Animation.IEasingPointKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EasingPointKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IEasingPointKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IEasingPointKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFadeInThemeAnimation return Windows.UI.Xaml.Media.Animation.IFadeInThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.FadeInThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IFadeInThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IFadeInThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFadeOutThemeAnimation return Windows.UI.Xaml.Media.Animation.IFadeOutThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.FadeOutThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IFadeOutThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IFadeOutThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLinearColorKeyFrame return Windows.UI.Xaml.Media.Animation.ILinearColorKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.LinearColorKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ILinearColorKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ILinearColorKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateLinearPointKeyFrame return Windows.UI.Xaml.Media.Animation.ILinearPointKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.LinearPointKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ILinearPointKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ILinearPointKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePointAnimationUsingKeyFrames return Windows.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFrames is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointAnimationUsingKeyFrames");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPointAnimationUsingKeyFrames := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPointAnimationUsingKeyFrames'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePointerDownThemeAnimation return Windows.UI.Xaml.Media.Animation.IPointerDownThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointerDownThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPointerDownThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPointerDownThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePointerUpThemeAnimation return Windows.UI.Xaml.Media.Animation.IPointerUpThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointerUpThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPointerUpThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPointerUpThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePopInThemeAnimation return Windows.UI.Xaml.Media.Animation.IPopInThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopInThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPopInThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPopInThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePopOutThemeAnimation return Windows.UI.Xaml.Media.Animation.IPopOutThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopOutThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPopOutThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IPopOutThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRepositionThemeAnimation return Windows.UI.Xaml.Media.Animation.IRepositionThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepositionThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IRepositionThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IRepositionThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSplineColorKeyFrame return Windows.UI.Xaml.Media.Animation.ISplineColorKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplineColorKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISplineColorKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISplineColorKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSplinePointKeyFrame return Windows.UI.Xaml.Media.Animation.ISplinePointKeyFrame is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplinePointKeyFrame");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISplinePointKeyFrame := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISplinePointKeyFrame'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSplitCloseThemeAnimation return Windows.UI.Xaml.Media.Animation.ISplitCloseThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISplitCloseThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISplitCloseThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSplitOpenThemeAnimation return Windows.UI.Xaml.Media.Animation.ISplitOpenThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISplitOpenThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISplitOpenThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSwipeBackThemeAnimation return Windows.UI.Xaml.Media.Animation.ISwipeBackThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SwipeBackThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISwipeBackThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISwipeBackThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSwipeHintThemeAnimation return Windows.UI.Xaml.Media.Animation.ISwipeHintThemeAnimation is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SwipeHintThemeAnimation");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISwipeHintThemeAnimation := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISwipeHintThemeAnimation'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCommonNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ICommonNavigationTransitionInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ICommonNavigationTransitionInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateContinuumNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IContinuumNavigationTransitionInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IContinuumNavigationTransitionInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDrillInNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.IDrillInNavigationTransitionInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillInNavigationTransitionInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDrillInNavigationTransitionInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IDrillInNavigationTransitionInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEntranceNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IEntranceNavigationTransitionInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_IEntranceNavigationTransitionInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNavigationThemeTransition return Windows.UI.Xaml.Media.Animation.INavigationThemeTransition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.NavigationThemeTransition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.INavigationThemeTransition := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_INavigationThemeTransition'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSlideNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SlideNavigationTransitionInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISlideNavigationTransitionInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISlideNavigationTransitionInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSuppressNavigationTransitionInfo return Windows.UI.Xaml.Media.Animation.ISuppressNavigationTransitionInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SuppressNavigationTransitionInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ISuppressNavigationTransitionInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.Media.Animation.IID_ISuppressNavigationTransitionInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IDoubleKeyFrame_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IDoubleKeyFrame , Windows.Address); 
   
   begin
      if riid.all = IID_IDoubleKeyFrame or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IDoubleKeyFrame_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IDoubleKeyFrame_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IDoubleKeyFrame_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IDoubleKeyFrame_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IDoubleKeyFrame_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Value
   (
      This       : access IDoubleKeyFrame_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Value
   (
      This       : access IDoubleKeyFrame_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_KeyTime
   (
      This       : access IDoubleKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_KeyTime
   (
      This       : access IDoubleKeyFrame_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(INavigationTransitionInfoOverrides , Windows.Address); 
      function Convert is new Ada.Unchecked_Conversion(INavigationTransitionInfo , Windows.Address); 
   
   begin
      if riid.all = IID_INavigationTransitionInfoOverrides or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            if riid.all = IID_INavigationTransitionInfo then
               ppvObject.all := Convert(This.m_INavigationTransitionInfo);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.INavigationTransitionInfoOverrides");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function GetNavigationStateCore
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetNavigationStateCore
   (
      This       : access INavigationTransitionInfoOverrides_Interface_Impl
      ; navigationState : Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access INavigationTransitionInfo_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(INavigationTransitionInfo , Windows.Address); 
   
   begin
      if riid.all = IID_INavigationTransitionInfo or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access INavigationTransitionInfo_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access INavigationTransitionInfo_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access INavigationTransitionInfo_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access INavigationTransitionInfo_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access INavigationTransitionInfo_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IObjectKeyFrame_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IObjectKeyFrame , Windows.Address); 
   
   begin
      if riid.all = IID_IObjectKeyFrame or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IObjectKeyFrame_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IObjectKeyFrame_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IObjectKeyFrame_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IObjectKeyFrame_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.IObjectKeyFrame");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IObjectKeyFrame_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Value
   (
      This       : access IObjectKeyFrame_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Value
   (
      This       : access IObjectKeyFrame_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_KeyTime
   (
      This       : access IObjectKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_KeyTime
   (
      This       : access IObjectKeyFrame_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access ITimeline_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(ITimeline , Windows.Address); 
   
   begin
      if riid.all = IID_ITimeline or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access ITimeline_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access ITimeline_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access ITimeline_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access ITimeline_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ITimeline");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access ITimeline_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_AutoReverse
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_AutoReverse
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_BeginTime
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_BeginTime
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Duration
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Duration
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_SpeedRatio
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_SpeedRatio
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_FillBehavior
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.FillBehavior
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_FillBehavior
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.FillBehavior
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_RepeatBehavior
   (
      This       : access ITimeline_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_RepeatBehavior
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Completed
   (
      This       : access ITimeline_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Completed
   (
      This       : access ITimeline_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IColorKeyFrame_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IColorKeyFrame , Windows.Address); 
   
   begin
      if riid.all = IID_IColorKeyFrame or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IColorKeyFrame_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IColorKeyFrame_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IColorKeyFrame_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IColorKeyFrame_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.IColorKeyFrame");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IColorKeyFrame_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Value
   (
      This       : access IColorKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Value
   (
      This       : access IColorKeyFrame_Interface_Impl
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_KeyTime
   (
      This       : access IColorKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_KeyTime
   (
      This       : access IColorKeyFrame_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IPointKeyFrame_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      ppvObject : Address_Ptr := Convert(pvObject);
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
   
      function Convert is new Ada.Unchecked_Conversion(IPointKeyFrame , Windows.Address); 
   
   begin
      if riid.all = IID_IPointKeyFrame or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         ppvObject.all := Convert(This);
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Address);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IPointKeyFrame_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      return Hr;
   end;
   
   function Release
   (
      This       : access IPointKeyFrame_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      return Hr;
   end;
   
   function GetIids
   (
      This       : access IPointKeyFrame_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IPointKeyFrame_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.IPointKeyFrame");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IPointKeyFrame_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Value
   (
      This       : access IPointKeyFrame_Interface_Impl
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Value
   (
      This       : access IPointKeyFrame_Interface_Impl
      ; value : Windows.Foundation.Point
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_KeyTime
   (
      This       : access IPointKeyFrame_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_KeyTime
   (
      This       : access IPointKeyFrame_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.KeyTime
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromTimeSpan
   (
      timeSpan : Windows.Foundation.TimeSpan
   )
   return Windows.UI.Xaml.Media.Animation.KeyTime is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.KeyTimeHelper");
      m_Factory     : IKeyTimeHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.KeyTime;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyTimeHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromTimeSpan(timeSpan, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Forever
   return Windows.UI.Xaml.Media.Animation.RepeatBehavior is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper");
      m_Factory     : IRepeatBehaviorHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.RepeatBehavior;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepeatBehaviorHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Forever(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromCount
   (
      count : Windows.Double
   )
   return Windows.UI.Xaml.Media.Animation.RepeatBehavior is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper");
      m_Factory     : IRepeatBehaviorHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.RepeatBehavior;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepeatBehaviorHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromCount(count, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromDuration
   (
      duration : Windows.Foundation.TimeSpan
   )
   return Windows.UI.Xaml.Media.Animation.RepeatBehavior is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper");
      m_Factory     : IRepeatBehaviorHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.RepeatBehavior;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepeatBehaviorHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromDuration(duration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetHasCount
   (
      target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper");
      m_Factory     : IRepeatBehaviorHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepeatBehaviorHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetHasCount(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetHasDuration
   (
      target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper");
      m_Factory     : IRepeatBehaviorHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepeatBehaviorHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetHasDuration(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Equals
   (
      target : Windows.UI.Xaml.Media.Animation.RepeatBehavior
      ; value : Windows.UI.Xaml.Media.Animation.RepeatBehavior
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper");
      m_Factory     : IRepeatBehaviorHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepeatBehaviorHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Equals(target, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleKeyFrame");
      m_Factory     : IDoubleKeyFrameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IDoubleKeyFrame;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleKeyFrameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ValueProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleKeyFrame");
      m_Factory     : IDoubleKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ValueProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyTimeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleKeyFrame");
      m_Factory     : IDoubleKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyTimeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EasingModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EasingFunctionBase");
      m_Factory     : IEasingFunctionBaseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEasingFunctionBaseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EasingModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.NavigationTransitionInfo");
      m_Factory     : INavigationTransitionInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INavigationTransitionInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ValueProperty_IObjectKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ObjectKeyFrame");
      m_Factory     : IObjectKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IObjectKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ValueProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyTimeProperty_IObjectKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ObjectKeyFrame");
      m_Factory     : IObjectKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IObjectKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyTimeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.IObjectKeyFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ObjectKeyFrame");
      m_Factory     : IObjectKeyFrameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IObjectKeyFrame;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IObjectKeyFrameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllowDependentAnimations
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowDependentAnimations(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AllowDependentAnimations
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AllowDependentAnimations(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AutoReverseProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutoReverseProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BeginTimeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BeginTimeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DurationProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DurationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SpeedRatioProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SpeedRatioProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FillBehaviorProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FillBehaviorProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RepeatBehaviorProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RepeatBehaviorProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.ITimeline is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Timeline");
      m_Factory     : ITimelineFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.ITimeline;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITimelineFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AmplitudeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.BackEase");
      m_Factory     : IBackEaseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackEaseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AmplitudeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StoryboardProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.BeginStoryboard");
      m_Factory     : IBeginStoryboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBeginStoryboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StoryboardProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BouncesProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.BounceEase");
      m_Factory     : IBounceEaseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBounceEaseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BouncesProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BouncinessProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.BounceEase");
      m_Factory     : IBounceEaseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBounceEaseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BouncinessProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorAnimation");
      m_Factory     : IColorAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ToProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorAnimation");
      m_Factory     : IColorAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ToProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ByProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorAnimation");
      m_Factory     : IColorAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ByProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EasingFunctionProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorAnimation");
      m_Factory     : IColorAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EasingFunctionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EnableDependentAnimationProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorAnimation");
      m_Factory     : IColorAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EnableDependentAnimationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContentThemeTransition");
      m_Factory     : IContentThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContentThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HorizontalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContentThemeTransition");
      m_Factory     : IContentThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContentThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VerticalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleAnimation");
      m_Factory     : IDoubleAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ToProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleAnimation");
      m_Factory     : IDoubleAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ToProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ByProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleAnimation");
      m_Factory     : IDoubleAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ByProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EasingFunctionProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleAnimation");
      m_Factory     : IDoubleAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EasingFunctionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EnableDependentAnimationProperty_IDoubleAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleAnimation");
      m_Factory     : IDoubleAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EnableDependentAnimationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EnableDependentAnimationProperty_IDoubleAnimationUsingKeyFrames
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DoubleAnimationUsingKeyFrames");
      m_Factory     : IDoubleAnimationUsingKeyFramesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDoubleAnimationUsingKeyFramesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EnableDependentAnimationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EasingFunctionProperty_IEasingDoubleKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EasingDoubleKeyFrame");
      m_Factory     : IEasingDoubleKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEasingDoubleKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EasingFunctionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EdgeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EdgeUIThemeTransition");
      m_Factory     : IEdgeUIThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEdgeUIThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EdgeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OscillationsProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ElasticEase");
      m_Factory     : IElasticEaseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElasticEaseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OscillationsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SpringinessProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ElasticEase");
      m_Factory     : IElasticEaseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElasticEaseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SpringinessProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromHorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EntranceThemeTransition");
      m_Factory     : IEntranceThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEntranceThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromHorizontalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromVerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EntranceThemeTransition");
      m_Factory     : IEntranceThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEntranceThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromVerticalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsStaggeringEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EntranceThemeTransition");
      m_Factory     : IEntranceThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEntranceThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsStaggeringEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExponentProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ExponentialEase");
      m_Factory     : IExponentialEaseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IExponentialEaseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExponentProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EnableDependentAnimationProperty_IObjectAnimationUsingKeyFrames
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ObjectAnimationUsingKeyFrames");
      m_Factory     : IObjectAnimationUsingKeyFramesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IObjectAnimationUsingKeyFramesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EnableDependentAnimationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EdgeProperty_IPaneThemeTransition
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PaneThemeTransition");
      m_Factory     : IPaneThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaneThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EdgeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointAnimation");
      m_Factory     : IPointAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ToProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointAnimation");
      m_Factory     : IPointAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ToProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ByProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointAnimation");
      m_Factory     : IPointAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ByProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EasingFunctionProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointAnimation");
      m_Factory     : IPointAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EasingFunctionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EnableDependentAnimationProperty_IPointAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointAnimation");
      m_Factory     : IPointAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EnableDependentAnimationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromHorizontalOffsetProperty_IPopupThemeTransition
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopupThemeTransition");
      m_Factory     : IPopupThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPopupThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromHorizontalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromVerticalOffsetProperty_IPopupThemeTransition
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopupThemeTransition");
      m_Factory     : IPopupThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPopupThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromVerticalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PowerProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PowerEase");
      m_Factory     : IPowerEaseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPowerEaseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PowerProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsStaggeringEnabledProperty_IRepositionThemeTransition
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepositionThemeTransition");
      m_Factory     : IRepositionThemeTransitionStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepositionThemeTransitionStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsStaggeringEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeySplineProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplineDoubleKeyFrame");
      m_Factory     : ISplineDoubleKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplineDoubleKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeySplineProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetPropertyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Storyboard");
      m_Factory     : IStoryboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoryboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetPropertyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTargetProperty
   (
      element : Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Storyboard");
      m_Factory     : IStoryboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoryboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTargetProperty(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetTargetProperty
   (
      element : Windows.UI.Xaml.Media.Animation.ITimeline
      ; path : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Storyboard");
      m_Factory     : IStoryboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoryboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetTargetProperty(element, path);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_TargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Storyboard");
      m_Factory     : IStoryboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoryboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTargetName
   (
      element : Windows.UI.Xaml.Media.Animation.ITimeline
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Storyboard");
      m_Factory     : IStoryboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoryboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTargetName(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetTargetName
   (
      element : Windows.UI.Xaml.Media.Animation.ITimeline
      ; name : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Storyboard");
      m_Factory     : IStoryboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoryboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetTargetName(element, name);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetTarget
   (
      timeline : Windows.UI.Xaml.Media.Animation.ITimeline
      ; target : Windows.UI.Xaml.IDependencyObject
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.Storyboard");
      m_Factory     : IStoryboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStoryboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetTarget(timeline, target);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetForCurrentView
   return Windows.UI.Xaml.Media.Animation.IConnectedAnimationService is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ConnectedAnimationService");
      m_Factory     : IConnectedAnimationServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IConnectedAnimationService;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IConnectedAnimationServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ValueProperty_IColorKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorKeyFrame");
      m_Factory     : IColorKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ValueProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyTimeProperty_IColorKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorKeyFrame");
      m_Factory     : IColorKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyTimeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.IColorKeyFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorKeyFrame");
      m_Factory     : IColorKeyFrameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IColorKeyFrame;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorKeyFrameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Media.Animation.IPointKeyFrame is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointKeyFrame");
      m_Factory     : IPointKeyFrameFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Media.Animation.IPointKeyFrame;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointKeyFrameFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ValueProperty_IPointKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointKeyFrame");
      m_Factory     : IPointKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ValueProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyTimeProperty_IPointKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointKeyFrame");
      m_Factory     : IPointKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyTimeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EnableDependentAnimationProperty_IColorAnimationUsingKeyFrames
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ColorAnimationUsingKeyFrames");
      m_Factory     : IColorAnimationUsingKeyFramesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorAnimationUsingKeyFramesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EnableDependentAnimationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IDragItemThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DragItemThemeAnimation");
      m_Factory     : IDragItemThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDragItemThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IDragOverThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DragOverThemeAnimation");
      m_Factory     : IDragOverThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDragOverThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ToOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DragOverThemeAnimation");
      m_Factory     : IDragOverThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDragOverThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ToOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DirectionProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DragOverThemeAnimation");
      m_Factory     : IDragOverThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDragOverThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DirectionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EntranceTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation");
      m_Factory     : IDrillInThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDrillInThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EntranceTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EntranceTargetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation");
      m_Factory     : IDrillInThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDrillInThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EntranceTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExitTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation");
      m_Factory     : IDrillInThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDrillInThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExitTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExitTargetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation");
      m_Factory     : IDrillInThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDrillInThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExitTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EntranceTargetNameProperty_IDrillOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation");
      m_Factory     : IDrillOutThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDrillOutThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EntranceTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EntranceTargetProperty_IDrillOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation");
      m_Factory     : IDrillOutThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDrillOutThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EntranceTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExitTargetNameProperty_IDrillOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation");
      m_Factory     : IDrillOutThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDrillOutThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExitTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExitTargetProperty_IDrillOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation");
      m_Factory     : IDrillOutThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDrillOutThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExitTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IDropTargetItemThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.DropTargetItemThemeAnimation");
      m_Factory     : IDropTargetItemThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDropTargetItemThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EasingFunctionProperty_IEasingColorKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EasingColorKeyFrame");
      m_Factory     : IEasingColorKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEasingColorKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EasingFunctionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EasingFunctionProperty_IEasingPointKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EasingPointKeyFrame");
      m_Factory     : IEasingPointKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEasingPointKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EasingFunctionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IFadeInThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.FadeInThemeAnimation");
      m_Factory     : IFadeInThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFadeInThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IFadeOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.FadeOutThemeAnimation");
      m_Factory     : IFadeOutThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFadeOutThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EnableDependentAnimationProperty_IPointAnimationUsingKeyFrames
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointAnimationUsingKeyFrames");
      m_Factory     : IPointAnimationUsingKeyFramesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointAnimationUsingKeyFramesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EnableDependentAnimationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IPointerDownThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointerDownThemeAnimation");
      m_Factory     : IPointerDownThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerDownThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IPointerUpThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PointerUpThemeAnimation");
      m_Factory     : IPointerUpThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerUpThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IPopInThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopInThemeAnimation");
      m_Factory     : IPopInThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPopInThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromHorizontalOffsetProperty_IPopInThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopInThemeAnimation");
      m_Factory     : IPopInThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPopInThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromHorizontalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromVerticalOffsetProperty_IPopInThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopInThemeAnimation");
      m_Factory     : IPopInThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPopInThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromVerticalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IPopOutThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.PopOutThemeAnimation");
      m_Factory     : IPopOutThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPopOutThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_IRepositionThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepositionThemeAnimation");
      m_Factory     : IRepositionThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepositionThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromHorizontalOffsetProperty_IRepositionThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepositionThemeAnimation");
      m_Factory     : IRepositionThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepositionThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromHorizontalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromVerticalOffsetProperty_IRepositionThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.RepositionThemeAnimation");
      m_Factory     : IRepositionThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRepositionThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromVerticalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeySplineProperty_ISplineColorKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplineColorKeyFrame");
      m_Factory     : ISplineColorKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplineColorKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeySplineProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeySplineProperty_ISplinePointKeyFrame
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplinePointKeyFrame");
      m_Factory     : ISplinePointKeyFrameStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplinePointKeyFrameStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeySplineProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OpenedTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OpenedTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OpenedTargetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OpenedTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClosedTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClosedTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClosedTargetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClosedTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentTargetNameProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentTargetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OpenedLengthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OpenedLengthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClosedLengthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClosedLengthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OffsetFromCenterProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OffsetFromCenterProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentTranslationDirectionProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentTranslationDirectionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentTranslationOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitCloseThemeAnimation");
      m_Factory     : ISplitCloseThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitCloseThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentTranslationOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OpenedTargetNameProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OpenedTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OpenedTargetProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OpenedTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClosedTargetNameProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClosedTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClosedTargetProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClosedTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentTargetNameProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentTargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentTargetProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OpenedLengthProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OpenedLengthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClosedLengthProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClosedLengthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OffsetFromCenterProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OffsetFromCenterProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentTranslationDirectionProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentTranslationDirectionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentTranslationOffsetProperty_ISplitOpenThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SplitOpenThemeAnimation");
      m_Factory     : ISplitOpenThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISplitOpenThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentTranslationOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_ISwipeBackThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SwipeBackThemeAnimation");
      m_Factory     : ISwipeBackThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISwipeBackThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromHorizontalOffsetProperty_ISwipeBackThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SwipeBackThemeAnimation");
      m_Factory     : ISwipeBackThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISwipeBackThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromHorizontalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FromVerticalOffsetProperty_ISwipeBackThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SwipeBackThemeAnimation");
      m_Factory     : ISwipeBackThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISwipeBackThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FromVerticalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetNameProperty_ISwipeHintThemeAnimation
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SwipeHintThemeAnimation");
      m_Factory     : ISwipeHintThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISwipeHintThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ToHorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SwipeHintThemeAnimation");
      m_Factory     : ISwipeHintThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISwipeHintThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ToHorizontalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ToVerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.SwipeHintThemeAnimation");
      m_Factory     : ISwipeHintThemeAnimationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISwipeHintThemeAnimationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ToVerticalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsStaggeringEnabledProperty_ICommonNavigationTransitionInfo
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo");
      m_Factory     : ICommonNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICommonNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsStaggeringEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsStaggerElementProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo");
      m_Factory     : ICommonNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICommonNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsStaggerElementProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsStaggerElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo");
      m_Factory     : ICommonNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICommonNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsStaggerElement(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetIsStaggerElement
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo");
      m_Factory     : ICommonNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICommonNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsStaggerElement(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ExitElementProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExitElementProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsEntranceElementProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsEntranceElementProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsEntranceElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsEntranceElement(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetIsEntranceElement
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsEntranceElement(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsExitElementProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsExitElementProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsExitElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsExitElement(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetIsExitElement
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsExitElement(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ExitElementContainerProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExitElementContainerProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetExitElementContainer
   (
      element : Windows.UI.Xaml.Controls.IListViewBase
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetExitElementContainer(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetExitElementContainer
   (
      element : Windows.UI.Xaml.Controls.IListViewBase
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo");
      m_Factory     : IContinuumNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContinuumNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetExitElementContainer(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsTargetElementProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo");
      m_Factory     : IEntranceNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEntranceNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsTargetElementProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsTargetElement
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo");
      m_Factory     : IEntranceNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEntranceNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsTargetElement(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetIsTargetElement
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo");
      m_Factory     : IEntranceNavigationTransitionInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEntranceNavigationTransitionInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsTargetElement(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_DefaultNavigationTransitionInfoProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Media.Animation.NavigationThemeTransition");
      m_Factory     : INavigationThemeTransitionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INavigationThemeTransitionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DefaultNavigationTransitionInfoProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
