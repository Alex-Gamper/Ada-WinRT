--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.Compression is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateCompressor
   (
      underlyingStream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Storage.Compression.ICompressor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Compression.Compressor");
      m_Factory     : Windows.Storage.Compression.ICompressorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Compression.ICompressor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompressorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCompressor(underlyingStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCompressorEx
   (
      underlyingStream : Windows.Storage.Streams.IOutputStream
      ; algorithm : Windows.Storage.Compression.CompressAlgorithm
      ; blockSize : Windows.UInt32
   )
   return Windows.Storage.Compression.ICompressor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Compression.Compressor");
      m_Factory     : Windows.Storage.Compression.ICompressorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Compression.ICompressor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICompressorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCompressorEx(underlyingStream, algorithm, blockSize, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDecompressor
   (
      underlyingStream : Windows.Storage.Streams.IInputStream
   )
   return Windows.Storage.Compression.IDecompressor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Compression.Decompressor");
      m_Factory     : Windows.Storage.Compression.IDecompressorFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Compression.IDecompressor := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDecompressorFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDecompressor(underlyingStream, RetVal'Access);
         RefCount := m_Factory.Release;
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
   

end;
