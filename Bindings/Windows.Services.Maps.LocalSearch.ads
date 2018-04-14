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
limited with Windows.Devices.Geolocation;
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Globalization;
--------------------------------------------------------------------------------
package Windows.Services.Maps.LocalSearch is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type LocalLocationFinderStatus is (
      Success,
      UnknownError,
      InvalidCredentials,
      InvalidCategory,
      InvalidSearchTerm,
      InvalidSearchArea,
      NetworkFailure,
      NotSupported
   );
   for LocalLocationFinderStatus use (
      Success => 0,
      UnknownError => 1,
      InvalidCredentials => 2,
      InvalidCategory => 3,
      InvalidSearchTerm => 4,
      InvalidSearchArea => 5,
      NetworkFailure => 6,
      NotSupported => 7
   );
   for LocalLocationFinderStatus'Size use 32;
   
   type LocalLocationFinderStatus_Ptr is access LocalLocationFinderStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ILocalLocationFinderResult_Interface;
   type AsyncOperationCompletedHandler_ILocalLocationFinderResult is access all AsyncOperationCompletedHandler_ILocalLocationFinderResult_Interface'Class;
   type AsyncOperationCompletedHandler_ILocalLocationFinderResult_Ptr is access all AsyncOperationCompletedHandler_ILocalLocationFinderResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ILocalLocation_Interface;
   type ILocalLocation is access all ILocalLocation_Interface'Class;
   type ILocalLocation_Ptr is access all ILocalLocation;
   type ILocalLocationFinderResult_Interface;
   type ILocalLocationFinderResult is access all ILocalLocationFinderResult_Interface'Class;
   type ILocalLocationFinderResult_Ptr is access all ILocalLocationFinderResult;
   type ILocalLocationFinderStatics_Interface;
   type ILocalLocationFinderStatics is access all ILocalLocationFinderStatics_Interface'Class;
   type ILocalLocationFinderStatics_Ptr is access all ILocalLocationFinderStatics;
   type ILocalCategoriesStatics_Interface;
   type ILocalCategoriesStatics is access all ILocalCategoriesStatics_Interface'Class;
   type ILocalCategoriesStatics_Ptr is access all ILocalCategoriesStatics;
   type ILocalLocationHoursOfOperationItem_Interface;
   type ILocalLocationHoursOfOperationItem is access all ILocalLocationHoursOfOperationItem_Interface'Class;
   type ILocalLocationHoursOfOperationItem_Ptr is access all ILocalLocationHoursOfOperationItem;
   type ILocalLocationRatingInfo_Interface;
   type ILocalLocationRatingInfo is access all ILocalLocationRatingInfo_Interface'Class;
   type ILocalLocationRatingInfo_Ptr is access all ILocalLocationRatingInfo;
   type ILocalLocation2_Interface;
   type ILocalLocation2 is access all ILocalLocation2_Interface'Class;
   type ILocalLocation2_Ptr is access all ILocalLocation2;
   type IPlaceInfoHelperStatics_Interface;
   type IPlaceInfoHelperStatics is access all IPlaceInfoHelperStatics_Interface'Class;
   type IPlaceInfoHelperStatics_Ptr is access all IPlaceInfoHelperStatics;
   type IIterator_ILocalLocation_Interface;
   type IIterator_ILocalLocation is access all IIterator_ILocalLocation_Interface'Class;
   type IIterator_ILocalLocation_Ptr is access all IIterator_ILocalLocation;
   type IIterable_ILocalLocation_Interface;
   type IIterable_ILocalLocation is access all IIterable_ILocalLocation_Interface'Class;
   type IIterable_ILocalLocation_Ptr is access all IIterable_ILocalLocation;
   type IVectorView_ILocalLocation_Interface;
   type IVectorView_ILocalLocation is access all IVectorView_ILocalLocation_Interface'Class;
   type IVectorView_ILocalLocation_Ptr is access all IVectorView_ILocalLocation;
   type IAsyncOperation_ILocalLocationFinderResult_Interface;
   type IAsyncOperation_ILocalLocationFinderResult is access all IAsyncOperation_ILocalLocationFinderResult_Interface'Class;
   type IAsyncOperation_ILocalLocationFinderResult_Ptr is access all IAsyncOperation_ILocalLocationFinderResult;
   type IIterator_ILocalLocationHoursOfOperationItem_Interface;
   type IIterator_ILocalLocationHoursOfOperationItem is access all IIterator_ILocalLocationHoursOfOperationItem_Interface'Class;
   type IIterator_ILocalLocationHoursOfOperationItem_Ptr is access all IIterator_ILocalLocationHoursOfOperationItem;
   type IIterable_ILocalLocationHoursOfOperationItem_Interface;
   type IIterable_ILocalLocationHoursOfOperationItem is access all IIterable_ILocalLocationHoursOfOperationItem_Interface'Class;
   type IIterable_ILocalLocationHoursOfOperationItem_Ptr is access all IIterable_ILocalLocationHoursOfOperationItem;
   type IVectorView_ILocalLocationHoursOfOperationItem_Interface;
   type IVectorView_ILocalLocationHoursOfOperationItem is access all IVectorView_ILocalLocationHoursOfOperationItem_Interface'Class;
   type IVectorView_ILocalLocationHoursOfOperationItem_Ptr is access all IVectorView_ILocalLocationHoursOfOperationItem;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ILocalLocation : aliased constant Windows.IID := (3138382251, 17666, 20268, (148, 169, 13, 96, 222, 14, 33, 99 ));
   
   type ILocalLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Address
   (
      This       : access ILocalLocation_Interface
      ; RetVal : access Windows.Services.Maps.IMapAddress
   )
   return Windows.HRESULT is abstract;
   
   function get_Identifier
   (
      This       : access ILocalLocation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access ILocalLocation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access ILocalLocation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Point
   (
      This       : access ILocalLocation_Interface
      ; RetVal : access Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneNumber
   (
      This       : access ILocalLocation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DataAttribution
   (
      This       : access ILocalLocation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalLocationFinderResult : aliased constant Windows.IID := (3499846854, 62264, 16785, (159, 216, 84, 64, 185, 166, 143, 82 ));
   
   type ILocalLocationFinderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LocalLocations
   (
      This       : access ILocalLocationFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.IVectorView_ILocalLocation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access ILocalLocationFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.LocalLocationFinderStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalLocationFinderStatics : aliased constant Windows.IID := (3538907972, 41182, 18634, (129, 168, 7, 199, 220, 253, 55, 171 ));
   
   type ILocalLocationFinderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindLocalLocationsAsync
   (
      This       : access ILocalLocationFinderStatics_Interface
      ; searchTerm : Windows.String
      ; searchArea : Windows.Devices.Geolocation.IGeocircle
      ; localCategory : Windows.String
      ; maxResults : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.LocalSearch.IAsyncOperation_ILocalLocationFinderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalCategoriesStatics : aliased constant Windows.IID := (4103313909, 33377, 17185, (153, 116, 239, 146, 212, 154, 141, 202 ));
   
   type ILocalCategoriesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BankAndCreditUnions
   (
      This       : access ILocalCategoriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EatDrink
   (
      This       : access ILocalCategoriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Hospitals
   (
      This       : access ILocalCategoriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HotelsAndMotels
   (
      This       : access ILocalCategoriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_All
   (
      This       : access ILocalCategoriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Parking
   (
      This       : access ILocalCategoriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SeeDo
   (
      This       : access ILocalCategoriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Shop
   (
      This       : access ILocalCategoriesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalLocationHoursOfOperationItem : aliased constant Windows.IID := (592743538, 41415, 17393, (164, 240, 16, 145, 195, 158, 198, 64 ));
   
   type ILocalLocationHoursOfOperationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Day
   (
      This       : access ILocalLocationHoursOfOperationItem_Interface
      ; RetVal : access Windows.Globalization.DayOfWeek
   )
   return Windows.HRESULT is abstract;
   
   function get_Start
   (
      This       : access ILocalLocationHoursOfOperationItem_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Span
   (
      This       : access ILocalLocationHoursOfOperationItem_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalLocationRatingInfo : aliased constant Windows.IID := (3407719254, 13140, 17169, (139, 192, 162, 212, 213, 235, 128, 110 ));
   
   type ILocalLocationRatingInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AggregateRating
   (
      This       : access ILocalLocationRatingInfo_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RatingCount
   (
      This       : access ILocalLocationRatingInfo_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderIdentifier
   (
      This       : access ILocalLocationRatingInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILocalLocation2 : aliased constant Windows.IID := (1855860860, 60597, 20476, (187, 140, 186, 80, 186, 140, 45, 198 ));
   
   type ILocalLocation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Category
   (
      This       : access ILocalLocation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RatingInfo
   (
      This       : access ILocalLocation2_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.ILocalLocationRatingInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HoursOfOperation
   (
      This       : access ILocalLocation2_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.IVectorView_ILocalLocationHoursOfOperationItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlaceInfoHelperStatics : aliased constant Windows.IID := (3709643175, 43462, 18715, (188, 9, 232, 15, 206, 164, 142, 230 ));
   
   type IPlaceInfoHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromLocalLocation
   (
      This       : access IPlaceInfoHelperStatics_Interface
      ; location : Windows.Services.Maps.LocalSearch.ILocalLocation
      ; RetVal : access Windows.Services.Maps.IPlaceInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ILocalLocation : aliased constant Windows.IID := (2721853063, 43239, 22159, (150, 161, 105, 233, 143, 134, 185, 211 ));
   
   type IIterator_ILocalLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ILocalLocation_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.ILocalLocation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ILocalLocation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ILocalLocation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ILocalLocation_Interface
      ; items : Windows.Services.Maps.LocalSearch.ILocalLocation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ILocalLocation : aliased constant Windows.IID := (1416949499, 24820, 22700, (137, 226, 110, 131, 247, 159, 167, 108 ));
   
   type IIterable_ILocalLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ILocalLocation_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.IIterator_ILocalLocation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ILocalLocation : aliased constant Windows.IID := (1636930290, 20381, 22057, (171, 1, 177, 133, 18, 80, 61, 115 ));
   
   type IVectorView_ILocalLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ILocalLocation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.LocalSearch.ILocalLocation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ILocalLocation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ILocalLocation_Interface
      ; value : Windows.Services.Maps.LocalSearch.ILocalLocation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ILocalLocation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.LocalSearch.ILocalLocation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILocalLocationFinderResult : aliased constant Windows.IID := (149330738, 62496, 21120, (167, 33, 7, 91, 79, 208, 61, 148 ));
   
   type IAsyncOperation_ILocalLocationFinderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILocalLocationFinderResult_Interface
      ; handler : Windows.Services.Maps.LocalSearch.AsyncOperationCompletedHandler_ILocalLocationFinderResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILocalLocationFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.AsyncOperationCompletedHandler_ILocalLocationFinderResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILocalLocationFinderResult_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.ILocalLocationFinderResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ILocalLocationHoursOfOperationItem : aliased constant Windows.IID := (1067165120, 45788, 22391, (168, 30, 176, 162, 131, 155, 21, 43 ));
   
   type IIterator_ILocalLocationHoursOfOperationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ILocalLocationHoursOfOperationItem_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.ILocalLocationHoursOfOperationItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ILocalLocationHoursOfOperationItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ILocalLocationHoursOfOperationItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ILocalLocationHoursOfOperationItem_Interface
      ; items : Windows.Services.Maps.LocalSearch.ILocalLocationHoursOfOperationItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ILocalLocationHoursOfOperationItem : aliased constant Windows.IID := (4070110485, 47549, 21143, (184, 189, 28, 0, 64, 218, 172, 118 ));
   
   type IIterable_ILocalLocationHoursOfOperationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ILocalLocationHoursOfOperationItem_Interface
      ; RetVal : access Windows.Services.Maps.LocalSearch.IIterator_ILocalLocationHoursOfOperationItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ILocalLocationHoursOfOperationItem : aliased constant Windows.IID := (1699959154, 52625, 23372, (170, 96, 218, 177, 70, 48, 18, 132 ));
   
   type IVectorView_ILocalLocationHoursOfOperationItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ILocalLocationHoursOfOperationItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.LocalSearch.ILocalLocationHoursOfOperationItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ILocalLocationHoursOfOperationItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ILocalLocationHoursOfOperationItem_Interface
      ; value : Windows.Services.Maps.LocalSearch.ILocalLocationHoursOfOperationItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ILocalLocationHoursOfOperationItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.LocalSearch.ILocalLocationHoursOfOperationItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILocalLocationFinderResult : aliased constant Windows.IID := (2068454291, 10563, 24144, (160, 16, 238, 154, 236, 27, 191, 231 ));
   
   type AsyncOperationCompletedHandler_ILocalLocationFinderResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Maps.LocalSearch.IAsyncOperation_ILocalLocationFinderResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILocalLocationFinderResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILocalLocationFinderResult_Interface
      ; asyncInfo : Windows.Services.Maps.LocalSearch.IAsyncOperation_ILocalLocationFinderResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype LocalLocation is Windows.Services.Maps.LocalSearch.ILocalLocation;
   subtype LocalLocationFinderResult is Windows.Services.Maps.LocalSearch.ILocalLocationFinderResult;
   subtype LocalLocationRatingInfo is Windows.Services.Maps.LocalSearch.ILocalLocationRatingInfo;
   subtype LocalLocationHoursOfOperationItem is Windows.Services.Maps.LocalSearch.ILocalLocationHoursOfOperationItem;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FindLocalLocationsAsync
   (
      searchTerm : Windows.String
      ; searchArea : Windows.Devices.Geolocation.IGeocircle
      ; localCategory : Windows.String
      ; maxResults : Windows.UInt32
   )
   return Windows.Services.Maps.LocalSearch.IAsyncOperation_ILocalLocationFinderResult;
   
   function get_BankAndCreditUnions
   return Windows.String;
   
   function get_EatDrink
   return Windows.String;
   
   function get_Hospitals
   return Windows.String;
   
   function get_HotelsAndMotels
   return Windows.String;
   
   function get_All
   return Windows.String;
   
   function get_Parking
   return Windows.String;
   
   function get_SeeDo
   return Windows.String;
   
   function get_Shop
   return Windows.String;
   
   function CreateFromLocalLocation
   (
      location : Windows.Services.Maps.LocalSearch.ILocalLocation
   )
   return Windows.Services.Maps.IPlaceInfo;
   
end;
