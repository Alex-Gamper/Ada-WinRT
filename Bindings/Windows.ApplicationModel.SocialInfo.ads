--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
with Windows.Foundation;
limited with Windows.Graphics.Imaging;
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.SocialInfo is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SocialItemBadgeStyle is (
      Hidden,
      Visible,
      VisibleWithCount
   );
   for SocialItemBadgeStyle use (
      Hidden => 0,
      Visible => 1,
      VisibleWithCount => 2
   );
   for SocialItemBadgeStyle'Size use 32;
   
   type SocialItemBadgeStyle_Ptr is access SocialItemBadgeStyle;
   
   type SocialFeedKind is (
      HomeFeed,
      ContactFeed,
      Dashboard
   );
   for SocialFeedKind use (
      HomeFeed => 0,
      ContactFeed => 1,
      Dashboard => 2
   );
   for SocialFeedKind'Size use 32;
   
   type SocialFeedKind_Ptr is access SocialFeedKind;
   
   type SocialFeedItemStyle is (
      Default,
      Photo
   );
   for SocialFeedItemStyle use (
      Default => 0,
      Photo => 1
   );
   for SocialFeedItemStyle'Size use 32;
   
   type SocialFeedItemStyle_Ptr is access SocialFeedItemStyle;
   
   type SocialFeedUpdateMode is (
      Append,
      Replace
   );
   for SocialFeedUpdateMode use (
      Append => 0,
      Replace => 1
   );
   for SocialFeedUpdateMode'Size use 32;
   
   type SocialFeedUpdateMode_Ptr is access SocialFeedUpdateMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type SocialInfoContract is null record;
   pragma Convention (C_Pass_By_Copy , SocialInfoContract);
   
   type SocialInfoContract_Ptr is access SocialInfoContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISocialItemThumbnail_Interface;
   type ISocialItemThumbnail is access all ISocialItemThumbnail_Interface'Class;
   type ISocialItemThumbnail_Ptr is access all ISocialItemThumbnail;
   type ISocialFeedContent_Interface;
   type ISocialFeedContent is access all ISocialFeedContent_Interface'Class;
   type ISocialFeedContent_Ptr is access all ISocialFeedContent;
   type ISocialUserInfo_Interface;
   type ISocialUserInfo is access all ISocialUserInfo_Interface'Class;
   type ISocialUserInfo_Ptr is access all ISocialUserInfo;
   type ISocialFeedItem_Interface;
   type ISocialFeedItem is access all ISocialFeedItem_Interface'Class;
   type ISocialFeedItem_Ptr is access all ISocialFeedItem;
   type ISocialFeedChildItem_Interface;
   type ISocialFeedChildItem is access all ISocialFeedChildItem_Interface'Class;
   type ISocialFeedChildItem_Ptr is access all ISocialFeedChildItem;
   type ISocialFeedSharedItem_Interface;
   type ISocialFeedSharedItem is access all ISocialFeedSharedItem_Interface'Class;
   type ISocialFeedSharedItem_Ptr is access all ISocialFeedSharedItem;
   type IIterator_ISocialItemThumbnail_Interface;
   type IIterator_ISocialItemThumbnail is access all IIterator_ISocialItemThumbnail_Interface'Class;
   type IIterator_ISocialItemThumbnail_Ptr is access all IIterator_ISocialItemThumbnail;
   type IIterable_ISocialItemThumbnail_Interface;
   type IIterable_ISocialItemThumbnail is access all IIterable_ISocialItemThumbnail_Interface'Class;
   type IIterable_ISocialItemThumbnail_Ptr is access all IIterable_ISocialItemThumbnail;
   type IVectorView_ISocialItemThumbnail_Interface;
   type IVectorView_ISocialItemThumbnail is access all IVectorView_ISocialItemThumbnail_Interface'Class;
   type IVectorView_ISocialItemThumbnail_Ptr is access all IVectorView_ISocialItemThumbnail;
   type IVector_ISocialItemThumbnail_Interface;
   type IVector_ISocialItemThumbnail is access all IVector_ISocialItemThumbnail_Interface'Class;
   type IVector_ISocialItemThumbnail_Ptr is access all IVector_ISocialItemThumbnail;
   type IIterator_ISocialFeedItem_Interface;
   type IIterator_ISocialFeedItem is access all IIterator_ISocialFeedItem_Interface'Class;
   type IIterator_ISocialFeedItem_Ptr is access all IIterator_ISocialFeedItem;
   type IIterable_ISocialFeedItem_Interface;
   type IIterable_ISocialFeedItem is access all IIterable_ISocialFeedItem_Interface'Class;
   type IIterable_ISocialFeedItem_Ptr is access all IIterable_ISocialFeedItem;
   type IVectorView_ISocialFeedItem_Interface;
   type IVectorView_ISocialFeedItem is access all IVectorView_ISocialFeedItem_Interface'Class;
   type IVectorView_ISocialFeedItem_Ptr is access all IVectorView_ISocialFeedItem;
   type IVector_ISocialFeedItem_Interface;
   type IVector_ISocialFeedItem is access all IVector_ISocialFeedItem_Interface'Class;
   type IVector_ISocialFeedItem_Ptr is access all IVector_ISocialFeedItem;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISocialItemThumbnail : aliased constant Windows.IID := (1556054810, 16136, 18815, (145, 127, 87, 224, 157, 132, 177, 65 ));
   
   type ISocialItemThumbnail_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetUri
   (
      This       : access ISocialItemThumbnail_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetUri
   (
      This       : access ISocialItemThumbnail_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageUri
   (
      This       : access ISocialItemThumbnail_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ImageUri
   (
      This       : access ISocialItemThumbnail_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapSize
   (
      This       : access ISocialItemThumbnail_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   function put_BitmapSize
   (
      This       : access ISocialItemThumbnail_Interface
      ; value : Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   function SetImageAsync
   (
      This       : access ISocialItemThumbnail_Interface
      ; image : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISocialFeedContent : aliased constant Windows.IID := (2721375273, 15929, 18765, (163, 124, 244, 98, 162, 73, 69, 20 ));
   
   type ISocialFeedContent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access ISocialFeedContent_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access ISocialFeedContent_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access ISocialFeedContent_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Message
   (
      This       : access ISocialFeedContent_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetUri
   (
      This       : access ISocialFeedContent_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetUri
   (
      This       : access ISocialFeedContent_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISocialUserInfo : aliased constant Windows.IID := (2656967633, 37072, 19997, (149, 84, 132, 77, 70, 96, 127, 97 ));
   
   type ISocialUserInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access ISocialUserInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access ISocialUserInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserName
   (
      This       : access ISocialUserInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UserName
   (
      This       : access ISocialUserInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access ISocialUserInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access ISocialUserInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetUri
   (
      This       : access ISocialUserInfo_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetUri
   (
      This       : access ISocialUserInfo_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISocialFeedItem : aliased constant Windows.IID := (1326682795, 8050, 19763, (182, 149, 222, 62, 29, 182, 3, 23 ));
   
   type ISocialFeedItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Author
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialUserInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_PrimaryContent
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedContent
   )
   return Windows.HRESULT is abstract;
   
   function get_SecondaryContent
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedContent
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_Timestamp
   (
      This       : access ISocialFeedItem_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetUri
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetUri
   (
      This       : access ISocialFeedItem_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnails
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.IVector_ISocialItemThumbnail -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SharedItem
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedSharedItem
   )
   return Windows.HRESULT is abstract;
   
   function put_SharedItem
   (
      This       : access ISocialFeedItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialFeedSharedItem
   )
   return Windows.HRESULT is abstract;
   
   function get_BadgeStyle
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.SocialItemBadgeStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_BadgeStyle
   (
      This       : access ISocialFeedItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.SocialItemBadgeStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_BadgeCountValue
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_BadgeCountValue
   (
      This       : access ISocialFeedItem_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_RemoteId
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access ISocialFeedItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ChildItem
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedChildItem
   )
   return Windows.HRESULT is abstract;
   
   function put_ChildItem
   (
      This       : access ISocialFeedItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialFeedChildItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Style
   (
      This       : access ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.SocialFeedItemStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_Style
   (
      This       : access ISocialFeedItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.SocialFeedItemStyle
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISocialFeedChildItem : aliased constant Windows.IID := (191535194, 54685, 16574, (152, 12, 72, 138, 42, 179, 10, 131 ));
   
   type ISocialFeedChildItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Author
   (
      This       : access ISocialFeedChildItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialUserInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_PrimaryContent
   (
      This       : access ISocialFeedChildItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedContent
   )
   return Windows.HRESULT is abstract;
   
   function get_SecondaryContent
   (
      This       : access ISocialFeedChildItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedContent
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access ISocialFeedChildItem_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_Timestamp
   (
      This       : access ISocialFeedChildItem_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetUri
   (
      This       : access ISocialFeedChildItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetUri
   (
      This       : access ISocialFeedChildItem_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnails
   (
      This       : access ISocialFeedChildItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.IVector_ISocialItemThumbnail -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SharedItem
   (
      This       : access ISocialFeedChildItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedSharedItem
   )
   return Windows.HRESULT is abstract;
   
   function put_SharedItem
   (
      This       : access ISocialFeedChildItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialFeedSharedItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISocialFeedSharedItem : aliased constant Windows.IID := (2080087616, 42666, 17831, (159, 246, 84, 196, 33, 5, 221, 31 ));
   
   type ISocialFeedSharedItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OriginalSource
   (
      This       : access ISocialFeedSharedItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_OriginalSource
   (
      This       : access ISocialFeedSharedItem_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Content
   (
      This       : access ISocialFeedSharedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedContent
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access ISocialFeedSharedItem_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_Timestamp
   (
      This       : access ISocialFeedSharedItem_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetUri
   (
      This       : access ISocialFeedSharedItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetUri
   (
      This       : access ISocialFeedSharedItem_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access ISocialFeedSharedItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access ISocialFeedSharedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ISocialItemThumbnail : aliased constant Windows.IID := (4206687135, 64840, 21840, (143, 71, 160, 241, 87, 62, 31, 83 ));
   
   type IIterator_ISocialItemThumbnail_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISocialItemThumbnail_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISocialItemThumbnail_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISocialItemThumbnail_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISocialItemThumbnail_Interface
      ; items : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ISocialItemThumbnail : aliased constant Windows.IID := (1561341037, 37571, 23027, (177, 220, 89, 134, 197, 100, 69, 165 ));
   
   type IIterable_ISocialItemThumbnail_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISocialItemThumbnail_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.IIterator_ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ISocialItemThumbnail : aliased constant Windows.IID := (2587782470, 59520, 24043, (144, 6, 146, 254, 92, 67, 172, 225 ));
   
   type IVectorView_ISocialItemThumbnail_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISocialItemThumbnail_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISocialItemThumbnail_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISocialItemThumbnail_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISocialItemThumbnail_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ISocialItemThumbnail : aliased constant Windows.IID := (3255876567, 12118, 20598, (187, 14, 183, 73, 119, 38, 207, 149 ));
   
   type IVector_ISocialItemThumbnail_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.IVectorView_ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISocialItemThumbnail_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISocialItemThumbnail_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISocialItemThumbnail_Interface
      ; items : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ISocialFeedItem : aliased constant Windows.IID := (3888696607, 14599, 23976, (157, 114, 144, 66, 109, 195, 112, 114 ));
   
   type IIterator_ISocialFeedItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISocialFeedItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISocialFeedItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISocialFeedItem_Interface
      ; items : Windows.ApplicationModel.SocialInfo.ISocialFeedItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ISocialFeedItem : aliased constant Windows.IID := (2905856100, 38249, 24109, (189, 114, 24, 42, 143, 245, 12, 246 ));
   
   type IIterable_ISocialFeedItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.IIterator_ISocialFeedItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ISocialFeedItem : aliased constant Windows.IID := (3871222712, 64629, 22620, (131, 108, 52, 243, 255, 135, 104, 15 ));
   
   type IVectorView_ISocialFeedItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISocialFeedItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISocialFeedItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISocialFeedItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialFeedItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISocialFeedItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.SocialInfo.ISocialFeedItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ISocialFeedItem : aliased constant Windows.IID := (919425687, 14019, 22183, (150, 86, 236, 157, 91, 222, 122, 186 ));
   
   type IVector_ISocialFeedItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.IVectorView_ISocialFeedItem
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialFeedItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.SocialInfo.ISocialFeedItem
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.SocialInfo.ISocialFeedItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialFeedItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ISocialFeedItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ISocialFeedItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.SocialInfo.ISocialFeedItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ISocialFeedItem_Interface
      ; items : Windows.ApplicationModel.SocialInfo.ISocialFeedItem_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SocialUserInfo is Windows.ApplicationModel.SocialInfo.ISocialUserInfo;
   subtype SocialFeedContent is Windows.ApplicationModel.SocialInfo.ISocialFeedContent;
   subtype SocialItemThumbnail is Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail;
   function CreateSocialItemThumbnail return Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail;
   
   subtype SocialFeedSharedItem is Windows.ApplicationModel.SocialInfo.ISocialFeedSharedItem;
   function CreateSocialFeedSharedItem return Windows.ApplicationModel.SocialInfo.ISocialFeedSharedItem;
   
   subtype SocialFeedChildItem is Windows.ApplicationModel.SocialInfo.ISocialFeedChildItem;
   function CreateSocialFeedChildItem return Windows.ApplicationModel.SocialInfo.ISocialFeedChildItem;
   
   subtype SocialFeedItem is Windows.ApplicationModel.SocialInfo.ISocialFeedItem;
   function CreateSocialFeedItem return Windows.ApplicationModel.SocialInfo.ISocialFeedItem;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
