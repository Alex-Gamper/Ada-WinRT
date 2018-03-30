--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Graphics.Imaging;
with Windows.Globalization;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Ocr is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IOcrResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IOcrResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IOcrResult_Interface
      ; asyncInfo : Windows.Media.Ocr.IAsyncOperation_IOcrResult
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
   
   
   function get_MaxImageDimension
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Ocr.OcrEngine");
      m_Factory     : IOcrEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOcrEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxImageDimension(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AvailableRecognizerLanguages
   return Windows.Globalization.IVectorView_ILanguage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Ocr.OcrEngine");
      m_Factory     : IOcrEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.IVectorView_ILanguage;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOcrEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AvailableRecognizerLanguages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsLanguageSupported
   (
      language : Windows.Globalization.ILanguage
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Ocr.OcrEngine");
      m_Factory     : IOcrEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOcrEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsLanguageSupported(language, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryCreateFromLanguage
   (
      language : Windows.Globalization.ILanguage
   )
   return Windows.Media.Ocr.IOcrEngine is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Ocr.OcrEngine");
      m_Factory     : IOcrEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Ocr.IOcrEngine;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOcrEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreateFromLanguage(language, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryCreateFromUserProfileLanguages
   return Windows.Media.Ocr.IOcrEngine is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Ocr.OcrEngine");
      m_Factory     : IOcrEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Ocr.IOcrEngine;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOcrEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreateFromUserProfileLanguages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
