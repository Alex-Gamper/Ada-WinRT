--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.Pickers is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateFileOpenPicker return Windows.Storage.Pickers.IFileOpenPicker is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Pickers.FileOpenPicker");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Pickers.IFileOpenPicker := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Pickers.IID_IFileOpenPicker'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFileSavePicker return Windows.Storage.Pickers.IFileSavePicker is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Pickers.FileSavePicker");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Pickers.IFileSavePicker := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Pickers.IID_IFileSavePicker'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFolderPicker return Windows.Storage.Pickers.IFolderPicker is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Pickers.FolderPicker");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Pickers.IFolderPicker := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Pickers.IID_IFolderPicker'Access, RetVal'Address);
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
   
   
   function ResumePickSingleFileAsync
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Pickers.FileOpenPicker");
      m_Factory     : IFileOpenPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileOpenPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ResumePickSingleFileAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
