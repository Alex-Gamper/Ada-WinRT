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
with Windows.Foundation;
with Windows; use Windows;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.Storage.Streams is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ByteOrder is (
      LittleEndian,
      BigEndian
   );
   for ByteOrder use (
      LittleEndian => 0,
      BigEndian => 1
   );
   for ByteOrder'Size use 32;
   
   type ByteOrder_Ptr is access ByteOrder;
   
   type UnicodeEncoding is (
      Utf8,
      Utf16LE,
      Utf16BE
   );
   for UnicodeEncoding use (
      Utf8 => 0,
      Utf16LE => 1,
      Utf16BE => 2
   );
   for UnicodeEncoding'Size use 32;
   
   type UnicodeEncoding_Ptr is access UnicodeEncoding;
   
   type InputStreamOptions is (
      None,
      Partial,
      ReadAhead
   );
   for InputStreamOptions use (
      None => 0,
      Partial => 1,
      ReadAhead => 2
   );
   for InputStreamOptions'Size use 32;
   
   type InputStreamOptions_Ptr is access InputStreamOptions;
   
   type FileOpenDisposition is (
      OpenExisting,
      OpenAlways,
      CreateNew,
      CreateAlways,
      TruncateExisting
   );
   for FileOpenDisposition use (
      OpenExisting => 0,
      OpenAlways => 1,
      CreateNew => 2,
      CreateAlways => 3,
      TruncateExisting => 4
   );
   for FileOpenDisposition'Size use 32;
   
   type FileOpenDisposition_Ptr is access FileOpenDisposition;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType_Interface;
   type AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType is access all AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType_Interface'Class;
   type AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType_Ptr is access all AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType;
   type AsyncOperationCompletedHandler_IBuffer_Interface;
   type AsyncOperationCompletedHandler_IBuffer is access all AsyncOperationCompletedHandler_IBuffer_Interface'Class;
   type AsyncOperationCompletedHandler_IBuffer_Ptr is access all AsyncOperationCompletedHandler_IBuffer;
   type AsyncOperationCompletedHandler_IRandomAccessStreamReference_Interface;
   type AsyncOperationCompletedHandler_IRandomAccessStreamReference is access all AsyncOperationCompletedHandler_IRandomAccessStreamReference_Interface'Class;
   type AsyncOperationCompletedHandler_IRandomAccessStreamReference_Ptr is access all AsyncOperationCompletedHandler_IRandomAccessStreamReference;
   type AsyncOperationCompletedHandler_IRandomAccessStream_Interface;
   type AsyncOperationCompletedHandler_IRandomAccessStream is access all AsyncOperationCompletedHandler_IRandomAccessStream_Interface'Class;
   type AsyncOperationCompletedHandler_IRandomAccessStream_Ptr is access all AsyncOperationCompletedHandler_IRandomAccessStream;
   type AsyncOperationCompletedHandler_IInputStream_Interface;
   type AsyncOperationCompletedHandler_IInputStream is access all AsyncOperationCompletedHandler_IInputStream_Interface'Class;
   type AsyncOperationCompletedHandler_IInputStream_Ptr is access all AsyncOperationCompletedHandler_IInputStream;
   type AsyncOperationCompletedHandler_IOutputStream_Interface;
   type AsyncOperationCompletedHandler_IOutputStream is access all AsyncOperationCompletedHandler_IOutputStream_Interface'Class;
   type AsyncOperationCompletedHandler_IOutputStream_Ptr is access all AsyncOperationCompletedHandler_IOutputStream;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAsyncOperation_UInt32_Interface;
   type IAsyncOperation_UInt32 is access all IAsyncOperation_UInt32_Interface'Class;
   type IAsyncOperation_UInt32_Ptr is access all IAsyncOperation_UInt32;
   type IDataReader_Interface;
   type IDataReader is access all IDataReader_Interface'Class;
   type IDataReader_Ptr is access all IDataReader;
   type IDataReaderFactory_Interface;
   type IDataReaderFactory is access all IDataReaderFactory_Interface'Class;
   type IDataReaderFactory_Ptr is access all IDataReaderFactory;
   type IDataReaderStatics_Interface;
   type IDataReaderStatics is access all IDataReaderStatics_Interface'Class;
   type IDataReaderStatics_Ptr is access all IDataReaderStatics;
   type IDataWriter_Interface;
   type IDataWriter is access all IDataWriter_Interface'Class;
   type IDataWriter_Ptr is access all IDataWriter;
   type IDataWriterFactory_Interface;
   type IDataWriterFactory is access all IDataWriterFactory_Interface'Class;
   type IDataWriterFactory_Ptr is access all IDataWriterFactory;
   type IBufferFactory_Interface;
   type IBufferFactory is access all IBufferFactory_Interface'Class;
   type IBufferFactory_Ptr is access all IBufferFactory;
   type IBuffer_Interface;
   type IBuffer is access all IBuffer_Interface'Class;
   type IBuffer_Ptr is access all IBuffer;
   type IBufferStatics_Interface;
   type IBufferStatics is access all IBufferStatics_Interface'Class;
   type IBufferStatics_Ptr is access all IBufferStatics;
   type IContentTypeProvider_Interface;
   type IContentTypeProvider is access all IContentTypeProvider_Interface'Class;
   type IContentTypeProvider_Ptr is access all IContentTypeProvider;
   type IInputStream_Interface;
   type IInputStream is access all IInputStream_Interface'Class;
   type IInputStream_Ptr is access all IInputStream;
   type IOutputStream_Interface;
   type IOutputStream is access all IOutputStream_Interface'Class;
   type IOutputStream_Ptr is access all IOutputStream;
   type IRandomAccessStream_Interface;
   type IRandomAccessStream is access all IRandomAccessStream_Interface'Class;
   type IRandomAccessStream_Ptr is access all IRandomAccessStream;
   type IRandomAccessStreamWithContentType_Interface;
   type IRandomAccessStreamWithContentType is access all IRandomAccessStreamWithContentType_Interface'Class;
   type IRandomAccessStreamWithContentType_Ptr is access all IRandomAccessStreamWithContentType;
   type IRandomAccessStreamReference_Interface;
   type IRandomAccessStreamReference is access all IRandomAccessStreamReference_Interface'Class;
   type IRandomAccessStreamReference_Ptr is access all IRandomAccessStreamReference;
   type IRandomAccessStreamStatics_Interface;
   type IRandomAccessStreamStatics is access all IRandomAccessStreamStatics_Interface'Class;
   type IRandomAccessStreamStatics_Ptr is access all IRandomAccessStreamStatics;
   type IInputStreamReference_Interface;
   type IInputStreamReference is access all IInputStreamReference_Interface'Class;
   type IInputStreamReference_Ptr is access all IInputStreamReference;
   type IRandomAccessStreamReferenceStatics_Interface;
   type IRandomAccessStreamReferenceStatics is access all IRandomAccessStreamReferenceStatics_Interface'Class;
   type IRandomAccessStreamReferenceStatics_Ptr is access all IRandomAccessStreamReferenceStatics;
   type IFileRandomAccessStreamStatics_Interface;
   type IFileRandomAccessStreamStatics is access all IFileRandomAccessStreamStatics_Interface'Class;
   type IFileRandomAccessStreamStatics_Ptr is access all IFileRandomAccessStreamStatics;
   type IAsyncOperation_IRandomAccessStreamWithContentType_Interface;
   type IAsyncOperation_IRandomAccessStreamWithContentType is access all IAsyncOperation_IRandomAccessStreamWithContentType_Interface'Class;
   type IAsyncOperation_IRandomAccessStreamWithContentType_Ptr is access all IAsyncOperation_IRandomAccessStreamWithContentType;
   type IIterator_IBuffer_Interface;
   type IIterator_IBuffer is access all IIterator_IBuffer_Interface'Class;
   type IIterator_IBuffer_Ptr is access all IIterator_IBuffer;
   type IIterable_IBuffer_Interface;
   type IIterable_IBuffer is access all IIterable_IBuffer_Interface'Class;
   type IIterable_IBuffer_Ptr is access all IIterable_IBuffer;
   type IVectorView_IBuffer_Interface;
   type IVectorView_IBuffer is access all IVectorView_IBuffer_Interface'Class;
   type IVectorView_IBuffer_Ptr is access all IVectorView_IBuffer;
   type IVector_IBuffer_Interface;
   type IVector_IBuffer is access all IVector_IBuffer_Interface'Class;
   type IVector_IBuffer_Ptr is access all IVector_IBuffer;
   type IAsyncOperation_IBuffer_Interface;
   type IAsyncOperation_IBuffer is access all IAsyncOperation_IBuffer_Interface'Class;
   type IAsyncOperation_IBuffer_Ptr is access all IAsyncOperation_IBuffer;
   type IAsyncOperation_IRandomAccessStreamReference_Interface;
   type IAsyncOperation_IRandomAccessStreamReference is access all IAsyncOperation_IRandomAccessStreamReference_Interface'Class;
   type IAsyncOperation_IRandomAccessStreamReference_Ptr is access all IAsyncOperation_IRandomAccessStreamReference;
   type IAsyncOperation_IRandomAccessStream_Interface;
   type IAsyncOperation_IRandomAccessStream is access all IAsyncOperation_IRandomAccessStream_Interface'Class;
   type IAsyncOperation_IRandomAccessStream_Ptr is access all IAsyncOperation_IRandomAccessStream;
   type IAsyncOperation_IInputStream_Interface;
   type IAsyncOperation_IInputStream is access all IAsyncOperation_IInputStream_Interface'Class;
   type IAsyncOperation_IInputStream_Ptr is access all IAsyncOperation_IInputStream;
   type IAsyncOperation_IOutputStream_Interface;
   type IAsyncOperation_IOutputStream is access all IAsyncOperation_IOutputStream_Interface'Class;
   type IAsyncOperation_IOutputStream_Ptr is access all IAsyncOperation_IOutputStream;
   type IIterator_IRandomAccessStream_Interface;
   type IIterator_IRandomAccessStream is access all IIterator_IRandomAccessStream_Interface'Class;
   type IIterator_IRandomAccessStream_Ptr is access all IIterator_IRandomAccessStream;
   type IIterable_IRandomAccessStream_Interface;
   type IIterable_IRandomAccessStream is access all IIterable_IRandomAccessStream_Interface'Class;
   type IIterable_IRandomAccessStream_Ptr is access all IIterable_IRandomAccessStream;
   type IVectorView_IRandomAccessStream_Interface;
   type IVectorView_IRandomAccessStream is access all IVectorView_IRandomAccessStream_Interface'Class;
   type IVectorView_IRandomAccessStream_Ptr is access all IVectorView_IRandomAccessStream;
   type IVector_IRandomAccessStream_Interface;
   type IVector_IRandomAccessStream is access all IVector_IRandomAccessStream_Interface'Class;
   type IVector_IRandomAccessStream_Ptr is access all IVector_IRandomAccessStream;
   type IIterator_IRandomAccessStreamReference_Interface;
   type IIterator_IRandomAccessStreamReference is access all IIterator_IRandomAccessStreamReference_Interface'Class;
   type IIterator_IRandomAccessStreamReference_Ptr is access all IIterator_IRandomAccessStreamReference;
   type IIterable_IRandomAccessStreamReference_Interface;
   type IIterable_IRandomAccessStreamReference is access all IIterable_IRandomAccessStreamReference_Interface'Class;
   type IIterable_IRandomAccessStreamReference_Ptr is access all IIterable_IRandomAccessStreamReference;
   type IVectorView_IRandomAccessStreamReference_Interface;
   type IVectorView_IRandomAccessStreamReference is access all IVectorView_IRandomAccessStreamReference_Interface'Class;
   type IVectorView_IRandomAccessStreamReference_Ptr is access all IVectorView_IRandomAccessStreamReference;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_UInt32 : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IAsyncOperation_UInt32_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UInt32_Interface
      ; handler : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UInt32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UInt32_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataReader : aliased constant Windows.IID := (3803512873, 46273, 17172, (164, 184, 251, 129, 58, 47, 39, 94 ));
   
   type IDataReader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnconsumedBufferLength
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UnicodeEncoding
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.HRESULT is abstract;
   
   function put_UnicodeEncoding
   (
      This       : access IDataReader_Interface
      ; value : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.HRESULT is abstract;
   
   function get_ByteOrder
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Storage.Streams.ByteOrder
   )
   return Windows.HRESULT is abstract;
   
   function put_ByteOrder
   (
      This       : access IDataReader_Interface
      ; value : Windows.Storage.Streams.ByteOrder
   )
   return Windows.HRESULT is abstract;
   
   function get_InputStreamOptions
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Storage.Streams.InputStreamOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_InputStreamOptions
   (
      This       : access IDataReader_Interface
      ; value : Windows.Storage.Streams.InputStreamOptions
   )
   return Windows.HRESULT is abstract;
   
   function ReadByte
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function ReadBytes
   (
      This       : access IDataReader_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function ReadBuffer
   (
      This       : access IDataReader_Interface
      ; length : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function ReadBoolean
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ReadGuid
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function ReadInt16
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function ReadInt32
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ReadInt64
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function ReadUInt16
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function ReadUInt32
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReadUInt64
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function ReadSingle
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function ReadDouble
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function ReadString
   (
      This       : access IDataReader_Interface
      ; codeUnitCount : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ReadDateTime
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function ReadTimeSpan
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function LoadAsync
   (
      This       : access IDataReader_Interface
      ; count : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function DetachBuffer
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function DetachStream
   (
      This       : access IDataReader_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataReaderFactory : aliased constant Windows.IID := (3612506183, 22490, 19989, (145, 76, 6, 128, 102, 153, 160, 152 ));
   
   type IDataReaderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDataReader
   (
      This       : access IDataReaderFactory_Interface
      ; inputStream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Storage.Streams.IDataReader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataReaderStatics : aliased constant Windows.IID := (301776840, 63802, 18203, (177, 33, 243, 121, 227, 73, 49, 60 ));
   
   type IDataReaderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromBuffer
   (
      This       : access IDataReaderStatics_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IDataReader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataWriter : aliased constant Windows.IID := (1689817701, 54081, 18722, (179, 138, 221, 74, 248, 128, 140, 78 ));
   
   type IDataWriter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UnstoredBufferLength
   (
      This       : access IDataWriter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UnicodeEncoding
   (
      This       : access IDataWriter_Interface
      ; RetVal : access Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.HRESULT is abstract;
   
   function put_UnicodeEncoding
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.HRESULT is abstract;
   
   function get_ByteOrder
   (
      This       : access IDataWriter_Interface
      ; RetVal : access Windows.Storage.Streams.ByteOrder
   )
   return Windows.HRESULT is abstract;
   
   function put_ByteOrder
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Storage.Streams.ByteOrder
   )
   return Windows.HRESULT is abstract;
   
   function WriteByte
   (
      This       : access IDataWriter_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function WriteBytes
   (
      This       : access IDataWriter_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function WriteBuffer
   (
      This       : access IDataWriter_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function WriteBufferRange
   (
      This       : access IDataWriter_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; start : Windows.UInt32
      ; count : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function WriteBoolean
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function WriteGuid
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function WriteInt16
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Int16
   )
   return Windows.HRESULT is abstract;
   
   function WriteInt32
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function WriteInt64
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function WriteUInt16
   (
      This       : access IDataWriter_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function WriteUInt32
   (
      This       : access IDataWriter_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function WriteUInt64
   (
      This       : access IDataWriter_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function WriteSingle
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function WriteDouble
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function WriteDateTime
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function WriteTimeSpan
   (
      This       : access IDataWriter_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function WriteString
   (
      This       : access IDataWriter_Interface
      ; value : Windows.String
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function MeasureString
   (
      This       : access IDataWriter_Interface
      ; value : Windows.String
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function StoreAsync
   (
      This       : access IDataWriter_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IDataWriter_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DetachBuffer
   (
      This       : access IDataWriter_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function DetachStream
   (
      This       : access IDataWriter_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataWriterFactory : aliased constant Windows.IID := (864839618, 35716, 19499, (156, 80, 123, 135, 103, 132, 122, 31 ));
   
   type IDataWriterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDataWriter
   (
      This       : access IDataWriterFactory_Interface
      ; outputStream : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Storage.Streams.IDataWriter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBufferFactory : aliased constant Windows.IID := (1907331405, 49423, 18507, (188, 80, 20, 188, 98, 59, 58, 39 ));
   
   type IBufferFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IBufferFactory_Interface
      ; capacity : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBuffer : aliased constant Windows.IID := (2421821408, 48211, 4575, (140, 73, 0, 30, 79, 198, 134, 218 ));
   
   type IBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Capacity
   (
      This       : access IBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access IBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Length
   (
      This       : access IBuffer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBufferStatics : aliased constant Windows.IID := (3909215835, 55062, 18266, (169, 10, 175, 114, 41, 177, 231, 65 ));
   
   type IBufferStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCopyFromMemoryBuffer
   (
      This       : access IBufferStatics_Interface
      ; input : Windows.Foundation.IMemoryBuffer
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CreateMemoryBufferOverIBuffer
   (
      This       : access IBufferStatics_Interface
      ; input : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IMemoryBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContentTypeProvider : aliased constant Windows.IID := (2547030181, 15257, 19945, (136, 165, 225, 29, 47, 80, 199, 149 ));
   
   type IContentTypeProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentType
   (
      This       : access IContentTypeProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputStream : aliased constant Windows.IID := (2421821410, 48211, 4575, (140, 73, 0, 30, 79, 198, 134, 218 ));
   
   type IInputStream_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadAsync
   (
      This       : access IInputStream_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; count : Windows.UInt32
      ; options : Windows.Storage.Streams.InputStreamOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOutputStream : aliased constant Windows.IID := (2421821414, 48211, 4575, (140, 73, 0, 30, 79, 198, 134, 218 ));
   
   type IOutputStream_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteAsync
   (
      This       : access IOutputStream_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IOutputStream_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRandomAccessStream : aliased constant Windows.IID := (2421821409, 48211, 4575, (140, 73, 0, 30, 79, 198, 134, 218 ));
   
   type IRandomAccessStream_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IRandomAccessStream_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IRandomAccessStream_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetInputStreamAt
   (
      This       : access IRandomAccessStream_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetOutputStreamAt
   (
      This       : access IRandomAccessStream_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IRandomAccessStream_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function Seek
   (
      This       : access IRandomAccessStream_Interface
      ; position : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function CloneStream
   (
      This       : access IRandomAccessStream_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRead
   (
      This       : access IRandomAccessStream_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanWrite
   (
      This       : access IRandomAccessStream_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRandomAccessStreamWithContentType : aliased constant Windows.IID := (3424995367, 19261, 17295, (146, 50, 16, 199, 107, 199, 224, 56 ));
   
   type IRandomAccessStreamWithContentType_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRandomAccessStreamReference : aliased constant Windows.IID := (871248180, 7638, 20026, (128, 103, 209, 193, 98, 232, 100, 43 ));
   
   type IRandomAccessStreamReference_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenReadAsync
   (
      This       : access IRandomAccessStreamReference_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRandomAccessStreamStatics : aliased constant Windows.IID := (1380773327, 28201, 19685, (149, 115, 107, 117, 61, 182, 108, 58 ));
   
   type IRandomAccessStreamStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CopyAsync
   (
      This       : access IRandomAccessStreamStatics_Interface
      ; source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CopySizeAsync
   (
      This       : access IRandomAccessStreamStatics_Interface
      ; source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
      ; bytesToCopy : Windows.UInt64
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CopyAndCloseAsync
   (
      This       : access IRandomAccessStreamStatics_Interface
      ; source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputStreamReference : aliased constant Windows.IID := (1133681944, 24265, 19290, (145, 156, 66, 5, 176, 200, 4, 182 ));
   
   type IInputStreamReference_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenSequentialReadAsync
   (
      This       : access IInputStreamReference_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IInputStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRandomAccessStreamReferenceStatics : aliased constant Windows.IID := (2238908892, 16319, 20093, (152, 111, 239, 59, 26, 7, 169, 100 ));
   
   type IRandomAccessStreamReferenceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromFile
   (
      This       : access IRandomAccessStreamReferenceStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromUri
   (
      This       : access IRandomAccessStreamReferenceStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStream
   (
      This       : access IRandomAccessStreamReferenceStatics_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFileRandomAccessStreamStatics : aliased constant Windows.IID := (1934950663, 15191, 19293, (131, 69, 85, 77, 47, 198, 33, 240 ));
   
   type IFileRandomAccessStreamStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenAsync
   (
      This       : access IFileRandomAccessStreamStatics_Interface
      ; filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenWithOptionsAsync
   (
      This       : access IFileRandomAccessStreamStatics_Interface
      ; filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; sharingOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenTransactedWriteAsync
   (
      This       : access IFileRandomAccessStreamStatics_Interface
      ; filePath : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageStreamTransaction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenTransactedWriteWithOptionsAsync
   (
      This       : access IFileRandomAccessStreamStatics_Interface
      ; filePath : Windows.String
      ; openOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageStreamTransaction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenForUserAsync
   (
      This       : access IFileRandomAccessStreamStatics_Interface
      ; user : Windows.System.IUser
      ; filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenForUserWithOptionsAsync
   (
      This       : access IFileRandomAccessStreamStatics_Interface
      ; user : Windows.System.IUser
      ; filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; sharingOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenTransactedWriteForUserAsync
   (
      This       : access IFileRandomAccessStreamStatics_Interface
      ; user : Windows.System.IUser
      ; filePath : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageStreamTransaction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenTransactedWriteForUserWithOptionsAsync
   (
      This       : access IFileRandomAccessStreamStatics_Interface
      ; user : Windows.System.IUser
      ; filePath : Windows.String
      ; openOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageStreamTransaction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IRandomAccessStreamWithContentType : aliased constant Windows.IID := (3299179614, 12976, 21939, (173, 19, 206, 28, 35, 4, 30, 214 ));
   
   type IAsyncOperation_IRandomAccessStreamWithContentType_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRandomAccessStreamWithContentType_Interface
      ; handler : Windows.Storage.Streams.AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRandomAccessStreamWithContentType_Interface
      ; RetVal : access Windows.Storage.Streams.AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRandomAccessStreamWithContentType_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IBuffer : aliased constant Windows.IID := (2951624928, 63618, 24336, (150, 85, 31, 201, 140, 200, 204, 229 ));
   
   type IIterator_IBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IBuffer_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IBuffer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IBuffer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IBuffer_Interface
      ; items : Windows.Storage.Streams.IBuffer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IBuffer : aliased constant Windows.IID := (2418635455, 43396, 21571, (177, 197, 47, 4, 169, 158, 31, 202 ));
   
   type IIterable_IBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IBuffer_Interface
      ; RetVal : access Windows.Storage.Streams.IIterator_IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IBuffer : aliased constant Windows.IID := (4254352738, 4566, 24235, (189, 114, 112, 25, 147, 182, 143, 172 ));
   
   type IVectorView_IBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IBuffer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IBuffer_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IBuffer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Streams.IBuffer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IBuffer : aliased constant Windows.IID := (814737556, 52230, 20487, (188, 133, 203, 233, 74, 193, 167, 12 ));
   
   type IVector_IBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IBuffer_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IBuffer_Interface
      ; RetVal : access Windows.Storage.Streams.IVectorView_IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IBuffer_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IBuffer_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IBuffer_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IBuffer_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IBuffer_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IBuffer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IBuffer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IBuffer_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Streams.IBuffer_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IBuffer_Interface
      ; items : Windows.Storage.Streams.IBuffer_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IBuffer : aliased constant Windows.IID := (1005488180, 47527, 23168, (167, 70, 94, 240, 151, 34, 120, 120 ));
   
   type IAsyncOperation_IBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBuffer_Interface
      ; handler : Windows.Storage.Streams.AsyncOperationCompletedHandler_IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBuffer_Interface
      ; RetVal : access Windows.Storage.Streams.AsyncOperationCompletedHandler_IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBuffer_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IRandomAccessStreamReference : aliased constant Windows.IID := (1696042320, 59042, 23830, (178, 68, 101, 233, 114, 94, 90, 12 ));
   
   type IAsyncOperation_IRandomAccessStreamReference_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRandomAccessStreamReference_Interface
      ; handler : Windows.Storage.Streams.AsyncOperationCompletedHandler_IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRandomAccessStreamReference_Interface
      ; RetVal : access Windows.Storage.Streams.AsyncOperationCompletedHandler_IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRandomAccessStreamReference_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IRandomAccessStream : aliased constant Windows.IID := (1125043918, 5144, 23833, (129, 178, 93, 219, 56, 22, 3, 204 ));
   
   type IAsyncOperation_IRandomAccessStream_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRandomAccessStream_Interface
      ; handler : Windows.Storage.Streams.AsyncOperationCompletedHandler_IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRandomAccessStream_Interface
      ; RetVal : access Windows.Storage.Streams.AsyncOperationCompletedHandler_IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRandomAccessStream_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IInputStream : aliased constant Windows.IID := (2835220274, 21869, 22593, (183, 238, 179, 69, 15, 181, 38, 102 ));
   
   type IAsyncOperation_IInputStream_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IInputStream_Interface
      ; handler : Windows.Storage.Streams.AsyncOperationCompletedHandler_IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IInputStream_Interface
      ; RetVal : access Windows.Storage.Streams.AsyncOperationCompletedHandler_IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IInputStream_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IOutputStream : aliased constant Windows.IID := (3899877427, 53267, 21345, (151, 125, 197, 233, 153, 52, 104, 14 ));
   
   type IAsyncOperation_IOutputStream_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IOutputStream_Interface
      ; handler : Windows.Storage.Streams.AsyncOperationCompletedHandler_IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IOutputStream_Interface
      ; RetVal : access Windows.Storage.Streams.AsyncOperationCompletedHandler_IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IOutputStream_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IRandomAccessStream : aliased constant Windows.IID := (3363128426, 22655, 22746, (137, 126, 59, 190, 94, 199, 195, 11 ));
   
   type IIterator_IRandomAccessStream_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRandomAccessStream_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRandomAccessStream_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRandomAccessStream_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRandomAccessStream_Interface
      ; items : Windows.Storage.Streams.IRandomAccessStream_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IRandomAccessStream : aliased constant Windows.IID := (3127273984, 5461, 24052, (129, 165, 7, 210, 63, 127, 252, 235 ));
   
   type IIterable_IRandomAccessStream_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRandomAccessStream_Interface
      ; RetVal : access Windows.Storage.Streams.IIterator_IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IRandomAccessStream : aliased constant Windows.IID := (2462911046, 8806, 23766, (146, 147, 225, 17, 41, 159, 39, 147 ));
   
   type IVectorView_IRandomAccessStream_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IRandomAccessStream_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IRandomAccessStream_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IRandomAccessStream_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IRandomAccessStream_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Streams.IRandomAccessStream_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IRandomAccessStream : aliased constant Windows.IID := (657897067, 55971, 24076, (152, 66, 106, 15, 68, 181, 68, 11 ));
   
   type IVector_IRandomAccessStream_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; RetVal : access Windows.Storage.Streams.IVectorView_IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IRandomAccessStream_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IRandomAccessStream_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Streams.IRandomAccessStream_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IRandomAccessStream_Interface
      ; items : Windows.Storage.Streams.IRandomAccessStream_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IRandomAccessStreamReference : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterator_IRandomAccessStreamReference_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRandomAccessStreamReference_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRandomAccessStreamReference_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRandomAccessStreamReference_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRandomAccessStreamReference_Interface
      ; items : Windows.Storage.Streams.IRandomAccessStreamReference_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IRandomAccessStreamReference : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IRandomAccessStreamReference_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRandomAccessStreamReference_Interface
      ; RetVal : access Windows.Storage.Streams.IIterator_IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IRandomAccessStreamReference : aliased constant Windows.IID := (3960307915, 39559, 24331, (182, 223, 44, 9, 182, 49, 1, 119 ));
   
   type IVectorView_IRandomAccessStreamReference_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IRandomAccessStreamReference_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IRandomAccessStreamReference_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IRandomAccessStreamReference_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IRandomAccessStreamReference_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Streams.IRandomAccessStreamReference_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType : aliased constant Windows.IID := (1037954292, 7481, 22760, (131, 177, 219, 237, 84, 28, 127, 53 ));
   
   type AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType_Interface(Callback : access procedure (asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IBuffer : aliased constant Windows.IID := (1371788029, 47265, 22048, (183, 70, 126, 230, 213, 51, 172, 163 ));
   
   type AsyncOperationCompletedHandler_IBuffer_Interface(Callback : access procedure (asyncInfo : Windows.Storage.Streams.IAsyncOperation_IBuffer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IBuffer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBuffer_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IBuffer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IRandomAccessStreamReference : aliased constant Windows.IID := (1619292809, 59915, 24054, (137, 223, 242, 198, 44, 186, 150, 147 ));
   
   type AsyncOperationCompletedHandler_IRandomAccessStreamReference_Interface(Callback : access procedure (asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IRandomAccessStreamReference'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRandomAccessStreamReference_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IRandomAccessStream : aliased constant Windows.IID := (965493123, 31037, 23296, (129, 155, 74, 239, 146, 72, 94, 148 ));
   
   type AsyncOperationCompletedHandler_IRandomAccessStream_Interface(Callback : access procedure (asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IRandomAccessStream'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRandomAccessStream_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IInputStream : aliased constant Windows.IID := (3502047525, 36937, 22435, (189, 102, 226, 82, 93, 152, 200, 20 ));
   
   type AsyncOperationCompletedHandler_IInputStream_Interface(Callback : access procedure (asyncInfo : Windows.Storage.Streams.IAsyncOperation_IInputStream ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IInputStream'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IInputStream_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IInputStream
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IOutputStream : aliased constant Windows.IID := (3165880143, 15092, 22044, (169, 227, 238, 241, 115, 132, 148, 215 ));
   
   type AsyncOperationCompletedHandler_IOutputStream_Interface(Callback : access procedure (asyncInfo : Windows.Storage.Streams.IAsyncOperation_IOutputStream ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IOutputStream'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOutputStream_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IOutputStream
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DataReaderLoadOperation is Windows.Storage.Streams.IAsyncOperation_UInt32;
   subtype DataReader is Windows.Storage.Streams.IDataReader;
   function CreateDataReader
   (
      inputStream : Windows.Storage.Streams.IInputStream
   )
   return Windows.Storage.Streams.IDataReader;
   
   subtype DataWriterStoreOperation is Windows.Storage.Streams.IAsyncOperation_UInt32;
   subtype DataWriter is Windows.Storage.Streams.IDataWriter;
   function CreateDataWriter return Windows.Storage.Streams.IDataWriter;
   
   subtype Buffer is Windows.Storage.Streams.IBuffer;
   function Create
   (
      capacity : Windows.UInt32
   )
   return Windows.Storage.Streams.IBuffer;
   
   subtype RandomAccessStreamReference is Windows.Storage.Streams.IRandomAccessStreamReference;
   subtype FileRandomAccessStream is Windows.Storage.Streams.IRandomAccessStream;
   subtype FileInputStream is Windows.Storage.Streams.IInputStream;
   subtype FileOutputStream is Windows.Storage.Streams.IOutputStream;
   subtype RandomAccessStreamOverStream is Windows.Storage.Streams.IRandomAccessStream;
   subtype InputStreamOverStream is Windows.Storage.Streams.IInputStream;
   subtype OutputStreamOverStream is Windows.Storage.Streams.IOutputStream;
   subtype InMemoryRandomAccessStream is Windows.Storage.Streams.IRandomAccessStream;
   function CreateInMemoryRandomAccessStream return Windows.Storage.Streams.IRandomAccessStream;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FromBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IDataReader;
   
   function CreateCopyFromMemoryBuffer
   (
      input : Windows.Foundation.IMemoryBuffer
   )
   return Windows.Storage.Streams.IBuffer;
   
   function CreateMemoryBufferOverIBuffer
   (
      input : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IMemoryBuffer;
   
   function CopyAsync
   (
      source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Address;
   
   function CopySizeAsync
   (
      source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
      ; bytesToCopy : Windows.UInt64
   )
   return Windows.Address;
   
   function CopyAndCloseAsync
   (
      source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Address;
   
   function CreateFromFile
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Storage.Streams.IRandomAccessStreamReference;
   
   function CreateFromUri
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Storage.Streams.IRandomAccessStreamReference;
   
   function CreateFromStream
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Storage.Streams.IRandomAccessStreamReference;
   
   function OpenAsync
   (
      filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   
   function OpenWithOptionsAsync
   (
      filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; sharingOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   
   function OpenTransactedWriteAsync
   (
      filePath : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageStreamTransaction;
   
   function OpenTransactedWriteWithOptionsAsync
   (
      filePath : Windows.String
      ; openOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
   )
   return Windows.Storage.IAsyncOperation_IStorageStreamTransaction;
   
   function OpenForUserAsync
   (
      user : Windows.System.IUser
      ; filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   
   function OpenForUserWithOptionsAsync
   (
      user : Windows.System.IUser
      ; filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; sharingOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   
   function OpenTransactedWriteForUserAsync
   (
      user : Windows.System.IUser
      ; filePath : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageStreamTransaction;
   
   function OpenTransactedWriteForUserWithOptionsAsync
   (
      user : Windows.System.IUser
      ; filePath : Windows.String
      ; openOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
   )
   return Windows.Storage.IAsyncOperation_IStorageStreamTransaction;
   
end;
