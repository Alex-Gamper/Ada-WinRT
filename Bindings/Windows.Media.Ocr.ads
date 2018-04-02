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
with Windows.Foundation.Collections;
limited with Windows.Graphics.Imaging;
limited with Windows.Globalization;
--------------------------------------------------------------------------------
package Windows.Media.Ocr is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IOcrResult_Interface;
   type AsyncOperationCompletedHandler_IOcrResult is access all AsyncOperationCompletedHandler_IOcrResult_Interface'Class;
   type AsyncOperationCompletedHandler_IOcrResult_Ptr is access all AsyncOperationCompletedHandler_IOcrResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IOcrWord_Interface;
   type IOcrWord is access all IOcrWord_Interface'Class;
   type IOcrWord_Ptr is access all IOcrWord;
   type IOcrLine_Interface;
   type IOcrLine is access all IOcrLine_Interface'Class;
   type IOcrLine_Ptr is access all IOcrLine;
   type IOcrResult_Interface;
   type IOcrResult is access all IOcrResult_Interface'Class;
   type IOcrResult_Ptr is access all IOcrResult;
   type IOcrEngine_Interface;
   type IOcrEngine is access all IOcrEngine_Interface'Class;
   type IOcrEngine_Ptr is access all IOcrEngine;
   type IOcrEngineStatics_Interface;
   type IOcrEngineStatics is access all IOcrEngineStatics_Interface'Class;
   type IOcrEngineStatics_Ptr is access all IOcrEngineStatics;
   type IIterator_IOcrWord_Interface;
   type IIterator_IOcrWord is access all IIterator_IOcrWord_Interface'Class;
   type IIterator_IOcrWord_Ptr is access all IIterator_IOcrWord;
   type IIterable_IOcrWord_Interface;
   type IIterable_IOcrWord is access all IIterable_IOcrWord_Interface'Class;
   type IIterable_IOcrWord_Ptr is access all IIterable_IOcrWord;
   type IVectorView_IOcrWord_Interface;
   type IVectorView_IOcrWord is access all IVectorView_IOcrWord_Interface'Class;
   type IVectorView_IOcrWord_Ptr is access all IVectorView_IOcrWord;
   type IIterator_IOcrLine_Interface;
   type IIterator_IOcrLine is access all IIterator_IOcrLine_Interface'Class;
   type IIterator_IOcrLine_Ptr is access all IIterator_IOcrLine;
   type IIterable_IOcrLine_Interface;
   type IIterable_IOcrLine is access all IIterable_IOcrLine_Interface'Class;
   type IIterable_IOcrLine_Ptr is access all IIterable_IOcrLine;
   type IVectorView_IOcrLine_Interface;
   type IVectorView_IOcrLine is access all IVectorView_IOcrLine_Interface'Class;
   type IVectorView_IOcrLine_Ptr is access all IVectorView_IOcrLine;
   type IAsyncOperation_IOcrResult_Interface;
   type IAsyncOperation_IOcrResult is access all IAsyncOperation_IOcrResult_Interface'Class;
   type IAsyncOperation_IOcrResult_Ptr is access all IAsyncOperation_IOcrResult;
   
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
   type IOcrWord_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BoundingRect
   (
      This       : access IOcrWord_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IOcrWord_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IOcrWord : aliased constant Windows.IID := (1009403770, 23769, 13605, (186, 42, 35, 209, 224, 166, 138, 29 ));
   
   ------------------------------------------------------------------------
   type IOcrLine_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Words
   (
      This       : access IOcrLine_Interface
      ; RetVal : access Windows.Media.Ocr.IVectorView_IOcrWord -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IOcrLine_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IOcrLine : aliased constant Windows.IID := (4432239, 58143, 14884, (137, 156, 212, 68, 189, 8, 129, 36 ));
   
   ------------------------------------------------------------------------
   type IOcrResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Lines
   (
      This       : access IOcrResult_Interface
      ; RetVal : access Windows.Media.Ocr.IVectorView_IOcrLine -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TextAngle
   (
      This       : access IOcrResult_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IOcrResult_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IOcrResult : aliased constant Windows.IID := (2614244786, 5979, 15722, (146, 226, 56, 140, 32, 110, 47, 99 ));
   
   ------------------------------------------------------------------------
   type IOcrEngine_Interface is interface and Windows.IInspectable_Interface;
   
   function RecognizeAsync
   (
      This       : access IOcrEngine_Interface
      ; bitmap : Windows.Graphics.Imaging.ISoftwareBitmap
      ; RetVal : access Windows.Media.Ocr.IAsyncOperation_IOcrResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RecognizerLanguage
   (
      This       : access IOcrEngine_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   IID_IOcrEngine : aliased constant Windows.IID := (1511308353, 23414, 12608, (182, 128, 136, 37, 86, 38, 131, 172 ));
   
   ------------------------------------------------------------------------
   type IOcrEngineStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxImageDimension
   (
      This       : access IOcrEngineStatics_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableRecognizerLanguages
   (
      This       : access IOcrEngineStatics_Interface
      ; RetVal : access Windows.Globalization.IVectorView_ILanguage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsLanguageSupported
   (
      This       : access IOcrEngineStatics_Interface
      ; language : Windows.Globalization.ILanguage
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateFromLanguage
   (
      This       : access IOcrEngineStatics_Interface
      ; language : Windows.Globalization.ILanguage
      ; RetVal : access Windows.Media.Ocr.IOcrEngine
   )
   return Windows.HRESULT is abstract;
   
   function TryCreateFromUserProfileLanguages
   (
      This       : access IOcrEngineStatics_Interface
      ; RetVal : access Windows.Media.Ocr.IOcrEngine
   )
   return Windows.HRESULT is abstract;
   
   IID_IOcrEngineStatics : aliased constant Windows.IID := (1543481434, 13188, 13632, (153, 64, 105, 145, 32, 212, 40, 168 ));
   
   ------------------------------------------------------------------------
   type IIterator_IOcrWord_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IOcrWord_Interface
      ; RetVal : access Windows.Media.Ocr.IOcrWord
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IOcrWord_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IOcrWord_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IOcrWord_Interface
      ; items : Windows.Media.Ocr.IOcrWord_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IOcrWord : aliased constant Windows.IID := (248787322, 39268, 20934, (172, 190, 2, 81, 42, 6, 144, 130 ));
   
   ------------------------------------------------------------------------
   type IIterable_IOcrWord_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IOcrWord_Interface
      ; RetVal : access Windows.Media.Ocr.IIterator_IOcrWord
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IOcrWord : aliased constant Windows.IID := (2697881146, 18128, 21989, (146, 142, 37, 30, 182, 122, 30, 153 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IOcrWord_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IOcrWord_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Ocr.IOcrWord
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IOcrWord_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IOcrWord_Interface
      ; value : Windows.Media.Ocr.IOcrWord
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IOcrWord_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Ocr.IOcrWord_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IOcrWord : aliased constant Windows.IID := (2153406663, 57167, 21116, (134, 178, 226, 158, 67, 154, 131, 210 ));
   
   ------------------------------------------------------------------------
   type IIterator_IOcrLine_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IOcrLine_Interface
      ; RetVal : access Windows.Media.Ocr.IOcrLine
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IOcrLine_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IOcrLine_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IOcrLine_Interface
      ; items : Windows.Media.Ocr.IOcrLine_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IOcrLine : aliased constant Windows.IID := (1388973962, 22408, 22165, (185, 5, 70, 184, 216, 23, 29, 136 ));
   
   ------------------------------------------------------------------------
   type IIterable_IOcrLine_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IOcrLine_Interface
      ; RetVal : access Windows.Media.Ocr.IIterator_IOcrLine
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IOcrLine : aliased constant Windows.IID := (1794806946, 24791, 23998, (148, 45, 129, 170, 57, 41, 200, 94 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IOcrLine_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IOcrLine_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Ocr.IOcrLine
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IOcrLine_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IOcrLine_Interface
      ; value : Windows.Media.Ocr.IOcrLine
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IOcrLine_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Ocr.IOcrLine_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IOcrLine : aliased constant Windows.IID := (1623682732, 34933, 24027, (161, 155, 101, 163, 147, 98, 121, 234 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IOcrResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IOcrResult_Interface
      ; handler : Windows.Media.Ocr.AsyncOperationCompletedHandler_IOcrResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IOcrResult_Interface
      ; RetVal : access Windows.Media.Ocr.AsyncOperationCompletedHandler_IOcrResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IOcrResult_Interface
      ; RetVal : access Windows.Media.Ocr.IOcrResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IOcrResult : aliased constant Windows.IID := (3352760718, 44598, 22976, (172, 118, 123, 173, 238, 113, 28, 139 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IOcrResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Ocr.IAsyncOperation_IOcrResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IOcrResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOcrResult_Interface
      ; asyncInfo : Windows.Media.Ocr.IAsyncOperation_IOcrResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IOcrResult : aliased constant Windows.IID := (2560365425, 17482, 24190, (177, 151, 158, 170, 249, 210, 130, 154 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype OcrWord is Windows.Media.Ocr.IOcrWord;
   subtype OcrLine is Windows.Media.Ocr.IOcrLine;
   subtype OcrResult is Windows.Media.Ocr.IOcrResult;
   subtype OcrEngine is Windows.Media.Ocr.IOcrEngine;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_MaxImageDimension
   return Windows.UInt32;
   
   function get_AvailableRecognizerLanguages
   return Windows.Globalization.IVectorView_ILanguage;
   
   function IsLanguageSupported
   (
      language : Windows.Globalization.ILanguage
   )
   return Windows.Boolean;
   
   function TryCreateFromLanguage
   (
      language : Windows.Globalization.ILanguage
   )
   return Windows.Media.Ocr.IOcrEngine;
   
   function TryCreateFromUserProfileLanguages
   return Windows.Media.Ocr.IOcrEngine;

end;
