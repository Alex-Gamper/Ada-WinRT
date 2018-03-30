--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Services.Maps;
with Windows.Devices.Geolocation;
with Windows.Globalization;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Services.Maps.LocalSearch is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ILocalLocationFinderResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ILocalLocationFinderResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ILocalLocationFinderResult_Interface
      ; asyncInfo : Windows.Services.Maps.LocalSearch.IAsyncOperation_ILocalLocationFinderResult
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
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function FindLocalLocationsAsync
   (
      searchTerm : Windows.String
      ; searchArea : Windows.Devices.Geolocation.IGeocircle
      ; localCategory : Windows.String
      ; maxResults : Windows.UInt32
   )
   return Windows.Services.Maps.LocalSearch.IAsyncOperation_ILocalLocationFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalLocationFinder");
      m_Factory     : ILocalLocationFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.LocalSearch.IAsyncOperation_ILocalLocationFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalLocationFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindLocalLocationsAsync(searchTerm, searchArea, localCategory, maxResults, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BankAndCreditUnions
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalCategories");
      m_Factory     : ILocalCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BankAndCreditUnions(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EatDrink
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalCategories");
      m_Factory     : ILocalCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EatDrink(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Hospitals
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalCategories");
      m_Factory     : ILocalCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Hospitals(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HotelsAndMotels
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalCategories");
      m_Factory     : ILocalCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HotelsAndMotels(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_All
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalCategories");
      m_Factory     : ILocalCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_All(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Parking
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalCategories");
      m_Factory     : ILocalCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Parking(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SeeDo
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalCategories");
      m_Factory     : ILocalCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SeeDo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Shop
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.LocalCategories");
      m_Factory     : ILocalCategoriesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILocalCategoriesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Shop(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLocalLocation
   (
      location : Windows.Services.Maps.LocalSearch.ILocalLocation
   )
   return Windows.Services.Maps.IPlaceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.LocalSearch.PlaceInfoHelper");
      m_Factory     : IPlaceInfoHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IPlaceInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaceInfoHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLocalLocation(location, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
