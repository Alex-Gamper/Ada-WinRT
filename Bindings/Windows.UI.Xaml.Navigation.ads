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
limited with Windows.UI.Xaml.Interop;
with Windows.Foundation;
limited with Windows.UI.Xaml.Media.Animation;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Navigation is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type NavigationCacheMode is (
      Disabled,
      Required,
      Enabled
   );
   for NavigationCacheMode use (
      Disabled => 0,
      Required => 1,
      Enabled => 2
   );
   for NavigationCacheMode'Size use 32;
   
   type NavigationCacheMode_Ptr is access NavigationCacheMode;
   
   type NavigationMode is (
      New_x,
      Back,
      Forward,
      Refresh
   );
   for NavigationMode use (
      New_x => 0,
      Back => 1,
      Forward => 2,
      Refresh => 3
   );
   for NavigationMode'Size use 32;
   
   type NavigationMode_Ptr is access NavigationMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type LoadCompletedEventHandler_Interface;
   type LoadCompletedEventHandler is access all LoadCompletedEventHandler_Interface'Class;
   type LoadCompletedEventHandler_Ptr is access all LoadCompletedEventHandler;
   type NavigatedEventHandler_Interface;
   type NavigatedEventHandler is access all NavigatedEventHandler_Interface'Class;
   type NavigatedEventHandler_Ptr is access all NavigatedEventHandler;
   type NavigatingCancelEventHandler_Interface;
   type NavigatingCancelEventHandler is access all NavigatingCancelEventHandler_Interface'Class;
   type NavigatingCancelEventHandler_Ptr is access all NavigatingCancelEventHandler;
   type NavigationFailedEventHandler_Interface;
   type NavigationFailedEventHandler is access all NavigationFailedEventHandler_Interface'Class;
   type NavigationFailedEventHandler_Ptr is access all NavigationFailedEventHandler;
   type NavigationStoppedEventHandler_Interface;
   type NavigationStoppedEventHandler is access all NavigationStoppedEventHandler_Interface'Class;
   type NavigationStoppedEventHandler_Ptr is access all NavigationStoppedEventHandler;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type INavigatingCancelEventArgs_Interface;
   type INavigatingCancelEventArgs is access all INavigatingCancelEventArgs_Interface'Class;
   type INavigatingCancelEventArgs_Ptr is access all INavigatingCancelEventArgs;
   type INavigatingCancelEventArgs2_Interface;
   type INavigatingCancelEventArgs2 is access all INavigatingCancelEventArgs2_Interface'Class;
   type INavigatingCancelEventArgs2_Ptr is access all INavigatingCancelEventArgs2;
   type INavigationEventArgs_Interface;
   type INavigationEventArgs is access all INavigationEventArgs_Interface'Class;
   type INavigationEventArgs_Ptr is access all INavigationEventArgs;
   type INavigationEventArgs2_Interface;
   type INavigationEventArgs2 is access all INavigationEventArgs2_Interface'Class;
   type INavigationEventArgs2_Ptr is access all INavigationEventArgs2;
   type INavigationFailedEventArgs_Interface;
   type INavigationFailedEventArgs is access all INavigationFailedEventArgs_Interface'Class;
   type INavigationFailedEventArgs_Ptr is access all INavigationFailedEventArgs;
   type IPageStackEntry_Interface;
   type IPageStackEntry is access all IPageStackEntry_Interface'Class;
   type IPageStackEntry_Ptr is access all IPageStackEntry;
   type IPageStackEntryStatics_Interface;
   type IPageStackEntryStatics is access all IPageStackEntryStatics_Interface'Class;
   type IPageStackEntryStatics_Ptr is access all IPageStackEntryStatics;
   type IPageStackEntryFactory_Interface;
   type IPageStackEntryFactory is access all IPageStackEntryFactory_Interface'Class;
   type IPageStackEntryFactory_Ptr is access all IPageStackEntryFactory;
   type IIterator_IPageStackEntry_Interface;
   type IIterator_IPageStackEntry is access all IIterator_IPageStackEntry_Interface'Class;
   type IIterator_IPageStackEntry_Ptr is access all IIterator_IPageStackEntry;
   type IIterable_IPageStackEntry_Interface;
   type IIterable_IPageStackEntry is access all IIterable_IPageStackEntry_Interface'Class;
   type IIterable_IPageStackEntry_Ptr is access all IIterable_IPageStackEntry;
   type IVectorView_IPageStackEntry_Interface;
   type IVectorView_IPageStackEntry is access all IVectorView_IPageStackEntry_Interface'Class;
   type IVectorView_IPageStackEntry_Ptr is access all IVectorView_IPageStackEntry;
   type IVector_IPageStackEntry_Interface;
   type IVector_IPageStackEntry is access all IVector_IPageStackEntry_Interface'Class;
   type IVector_IPageStackEntry_Ptr is access all IVector_IPageStackEntry;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_INavigatingCancelEventArgs : aliased constant Windows.IID := (4246562734, 60155, 16505, (190, 128, 109, 201, 42, 3, 174, 223 ));
   
   type INavigatingCancelEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Cancel
   (
      This       : access INavigatingCancelEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Cancel
   (
      This       : access INavigatingCancelEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NavigationMode
   (
      This       : access INavigatingCancelEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Navigation.NavigationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_SourcePageType
   (
      This       : access INavigatingCancelEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INavigatingCancelEventArgs2 : aliased constant Windows.IID := (1409791748, 33095, 17219, (131, 143, 221, 30, 233, 8, 193, 55 ));
   
   type INavigatingCancelEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Parameter
   (
      This       : access INavigatingCancelEventArgs2_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_NavigationTransitionInfo
   (
      This       : access INavigatingCancelEventArgs2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INavigationEventArgs : aliased constant Windows.IID := (3064633396, 26257, 17617, (189, 247, 88, 130, 12, 39, 176, 208 ));
   
   type INavigationEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access INavigationEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Parameter
   (
      This       : access INavigationEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_SourcePageType
   (
      This       : access INavigationEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   
   function get_NavigationMode
   (
      This       : access INavigationEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Navigation.NavigationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access INavigationEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access INavigationEventArgs_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INavigationEventArgs2 : aliased constant Windows.IID := (3690951129, 38810, 19246, (164, 155, 59, 177, 127, 222, 245, 116 ));
   
   type INavigationEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NavigationTransitionInfo
   (
      This       : access INavigationEventArgs2_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INavigationFailedEventArgs : aliased constant Windows.IID := (297918455, 14018, 16642, (178, 239, 2, 23, 169, 114, 137, 179 ));
   
   type INavigationFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Exception
   (
      This       : access INavigationFailedEventArgs_Interface
      ; RetVal : access Windows.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access INavigationFailedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access INavigationFailedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SourcePageType
   (
      This       : access INavigationFailedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPageStackEntry : aliased constant Windows.IID := (4018672806, 37768, 19146, (133, 114, 64, 81, 148, 6, 144, 128 ));
   
   type IPageStackEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourcePageType
   (
      This       : access IPageStackEntry_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.HRESULT is abstract;
   
   function get_Parameter
   (
      This       : access IPageStackEntry_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_NavigationTransitionInfo
   (
      This       : access IPageStackEntry_Interface
      ; RetVal : access Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPageStackEntryStatics : aliased constant Windows.IID := (2901407971, 9324, 16435, (159, 1, 1, 203, 13, 165, 37, 78 ));
   
   type IPageStackEntryStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourcePageTypeProperty
   (
      This       : access IPageStackEntryStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPageStackEntryFactory : aliased constant Windows.IID := (1146356874, 43193, 20344, (155, 132, 31, 81, 245, 136, 81, 255 ));
   
   type IPageStackEntryFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IPageStackEntryFactory_Interface
      ; sourcePageType : Windows.UI.Xaml.Interop.TypeName
      ; parameter : Windows.Object
      ; navigationTransitionInfo : Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
      ; RetVal : access Windows.UI.Xaml.Navigation.IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPageStackEntry : aliased constant Windows.IID := (3097274732, 57041, 21437, (135, 68, 202, 168, 78, 135, 186, 135 ));
   
   type IIterator_IPageStackEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPageStackEntry_Interface
      ; RetVal : access Windows.UI.Xaml.Navigation.IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPageStackEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPageStackEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPageStackEntry_Interface
      ; items : Windows.UI.Xaml.Navigation.IPageStackEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPageStackEntry : aliased constant Windows.IID := (3710023845, 19476, 22887, (138, 65, 154, 71, 195, 197, 196, 167 ));
   
   type IIterable_IPageStackEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPageStackEntry_Interface
      ; RetVal : access Windows.UI.Xaml.Navigation.IIterator_IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPageStackEntry : aliased constant Windows.IID := (2943188652, 2159, 23647, (190, 75, 8, 88, 175, 117, 6, 247 ));
   
   type IVectorView_IPageStackEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPageStackEntry_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Navigation.IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPageStackEntry_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPageStackEntry_Interface
      ; value : Windows.UI.Xaml.Navigation.IPageStackEntry
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPageStackEntry_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Navigation.IPageStackEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IPageStackEntry : aliased constant Windows.IID := (3848380735, 35233, 24306, (163, 254, 235, 161, 180, 83, 155, 70 ));
   
   type IVector_IPageStackEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IPageStackEntry_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Navigation.IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IPageStackEntry_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IPageStackEntry_Interface
      ; RetVal : access Windows.UI.Xaml.Navigation.IVectorView_IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IPageStackEntry_Interface
      ; value : Windows.UI.Xaml.Navigation.IPageStackEntry
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IPageStackEntry_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Navigation.IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IPageStackEntry_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Navigation.IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IPageStackEntry_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IPageStackEntry_Interface
      ; value : Windows.UI.Xaml.Navigation.IPageStackEntry
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IPageStackEntry_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IPageStackEntry_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IPageStackEntry_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Navigation.IPageStackEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IPageStackEntry_Interface
      ; items : Windows.UI.Xaml.Navigation.IPageStackEntry_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_LoadCompletedEventHandler : aliased constant Windows.IID := (2931488645, 17404, 20012, (149, 195, 151, 174, 132, 234, 188, 142 ));
   
   type LoadCompletedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_LoadCompletedEventHandler'access) with null record;
   function Invoke
   (
      This       : access LoadCompletedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_NavigatedEventHandler : aliased constant Windows.IID := (2077347668, 9167, 19662, (178, 245, 76, 231, 141, 150, 137, 110 ));
   
   type NavigatedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_NavigatedEventHandler'access) with null record;
   function Invoke
   (
      This       : access NavigatedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_NavigatingCancelEventHandler : aliased constant Windows.IID := (1977001871, 41730, 17545, (152, 152, 36, 234, 73, 24, 41, 16 ));
   
   type NavigatingCancelEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Navigation.INavigatingCancelEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_NavigatingCancelEventHandler'access) with null record;
   function Invoke
   (
      This       : access NavigatingCancelEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigatingCancelEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_NavigationFailedEventHandler : aliased constant Windows.IID := (1303070321, 4786, 17351, (184, 146, 155, 226, 220, 211, 232, 141 ));
   
   type NavigationFailedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Navigation.INavigationFailedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_NavigationFailedEventHandler'access) with null record;
   function Invoke
   (
      This       : access NavigationFailedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigationFailedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_NavigationStoppedEventHandler : aliased constant Windows.IID := (4027678171, 4858, 19853, (139, 38, 179, 131, 208, 156, 43, 60 ));
   
   type NavigationStoppedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_NavigationStoppedEventHandler'access) with null record;
   function Invoke
   (
      This       : access NavigationStoppedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Navigation.INavigationEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype NavigationEventArgs is Windows.UI.Xaml.Navigation.INavigationEventArgs;
   subtype NavigatingCancelEventArgs is Windows.UI.Xaml.Navigation.INavigatingCancelEventArgs;
   subtype NavigationFailedEventArgs is Windows.UI.Xaml.Navigation.INavigationFailedEventArgs;
   subtype PageStackEntry is Windows.UI.Xaml.Navigation.IPageStackEntry;
   function CreateInstance
   (
      sourcePageType : Windows.UI.Xaml.Interop.TypeName
      ; parameter : Windows.Object
      ; navigationTransitionInfo : Windows.UI.Xaml.Media.Animation.INavigationTransitionInfo
   )
   return Windows.UI.Xaml.Navigation.IPageStackEntry;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_SourcePageTypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
end;
