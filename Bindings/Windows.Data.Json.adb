--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Data.Json is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateJsonArray return Windows.Data.Json.IJsonArray is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonArray");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonArray := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Data.Json.IID_IJsonArray'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateJsonObject return Windows.Data.Json.IJsonObject is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonObject");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonObject := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Data.Json.IID_IJsonObject'Access, RetVal'Address);
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
   
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Data.Json.IJsonArray is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonArray");
      m_Factory     : IJsonArrayStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonArray;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonArrayStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; result : access Windows.Data.Json.IJsonArray
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonArray");
      m_Factory     : IJsonArrayStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonArrayStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, result, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Data.Json.IJsonObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonObject");
      m_Factory     : IJsonObjectStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonObjectStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; result : access Windows.Data.Json.IJsonObject
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonObject");
      m_Factory     : IJsonObjectStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonObjectStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, result, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Data.Json.IJsonValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonValue");
      m_Factory     : IJsonValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      input : Windows.String
      ; result : access Windows.Data.Json.IJsonValue
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonValue");
      m_Factory     : IJsonValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(input, result, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBooleanValue
   (
      input : Windows.Boolean
   )
   return Windows.Data.Json.IJsonValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonValue");
      m_Factory     : IJsonValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateBooleanValue(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNumberValue
   (
      input : Windows.Double
   )
   return Windows.Data.Json.IJsonValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonValue");
      m_Factory     : IJsonValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNumberValue(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStringValue
   (
      input : Windows.String
   )
   return Windows.Data.Json.IJsonValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonValue");
      m_Factory     : IJsonValueStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonValueStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateStringValue(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNullValue
   return Windows.Data.Json.IJsonValue is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonValue");
      m_Factory     : IJsonValueStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.IJsonValue;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonValueStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNullValue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetJsonStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Data.Json.JsonErrorStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Json.JsonError");
      m_Factory     : IJsonErrorStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Json.JsonErrorStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IJsonErrorStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetJsonStatus(hresult, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
