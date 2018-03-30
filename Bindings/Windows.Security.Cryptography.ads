--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Security.Cryptography is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type BinaryStringEncoding is (
      Utf8,
      Utf16LE,
      Utf16BE
   );
   for BinaryStringEncoding use (
      Utf8 => 0,
      Utf16LE => 1,
      Utf16BE => 2
   );
   for BinaryStringEncoding'Size use 32;
   
   type BinaryStringEncoding_Ptr is access BinaryStringEncoding;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICryptographicBufferStatics_Interface;
   type ICryptographicBufferStatics is access all ICryptographicBufferStatics_Interface'Class;
   type ICryptographicBufferStatics_Ptr is access all ICryptographicBufferStatics;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type ICryptographicBufferStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Compare
   (
      This       : access ICryptographicBufferStatics_Interface
      ; object1 : Windows.Storage.Streams.IBuffer
      ; object2 : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GenerateRandom
   (
      This       : access ICryptographicBufferStatics_Interface
      ; length : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GenerateRandomNumber
   (
      This       : access ICryptographicBufferStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromByteArray
   (
      This       : access ICryptographicBufferStatics_Interface
      ; value : Windows.UInt8_Ptr
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CopyToByteArray
   (
      This       : access ICryptographicBufferStatics_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; value : access Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function DecodeFromHexString
   (
      This       : access ICryptographicBufferStatics_Interface
      ; value : Windows.String
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function EncodeToHexString
   (
      This       : access ICryptographicBufferStatics_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function DecodeFromBase64String
   (
      This       : access ICryptographicBufferStatics_Interface
      ; value : Windows.String
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function EncodeToBase64String
   (
      This       : access ICryptographicBufferStatics_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ConvertStringToBinary
   (
      This       : access ICryptographicBufferStatics_Interface
      ; value : Windows.String
      ; encoding : Windows.Security.Cryptography.BinaryStringEncoding
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function ConvertBinaryToString
   (
      This       : access ICryptographicBufferStatics_Interface
      ; encoding : Windows.Security.Cryptography.BinaryStringEncoding
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_ICryptographicBufferStatics : aliased constant Windows.IID := (839613986, 15536, 19679, (134, 99, 29, 40, 145, 0, 101, 235 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function Compare
   (
      object1 : Windows.Storage.Streams.IBuffer
      ; object2 : Windows.Storage.Streams.IBuffer
   )
   return Windows.Boolean;
   
   function GenerateRandom
   (
      length : Windows.UInt32
   )
   return Windows.Storage.Streams.IBuffer;
   
   function GenerateRandomNumber
   return Windows.UInt32;
   
   function CreateFromByteArray
   (
      value : Windows.UInt8_Ptr
   )
   return Windows.Storage.Streams.IBuffer;
   
   procedure CopyToByteArray
   (
      buffer : Windows.Storage.Streams.IBuffer
      ; value : access Windows.UInt8_Ptr
   )
   ;
   
   function DecodeFromHexString
   (
      value : Windows.String
   )
   return Windows.Storage.Streams.IBuffer;
   
   function EncodeToHexString
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.String;
   
   function DecodeFromBase64String
   (
      value : Windows.String
   )
   return Windows.Storage.Streams.IBuffer;
   
   function EncodeToBase64String
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.String;
   
   function ConvertStringToBinary
   (
      value : Windows.String
      ; encoding : Windows.Security.Cryptography.BinaryStringEncoding
   )
   return Windows.Storage.Streams.IBuffer;
   
   function ConvertBinaryToString
   (
      encoding : Windows.Security.Cryptography.BinaryStringEncoding
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.String;

end;
