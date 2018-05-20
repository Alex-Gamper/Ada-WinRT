--------------------------------------------------------------------------------
--                                                                            --
-- Copyright (c) 2018 Alexander Gamper, All Rights Reserved.                  --
--                                                                            --
-- This program is free software: you can redistribute it and/or modify       --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.      --
--                                                                            --
--------------------------------------------------------------------------------
with Windows;                                   use Windows;
with Windows.Foundation;                        use Windows.Foundation;
with Windows.Storage;                           use Windows.Storage;
with Windows.Storage.Streams;                   use Windows.Storage.Streams;
with Windows.Graphics.Imaging;                  use Windows.Graphics.Imaging;
with Windows.Media.Ocr;                         use Windows.Media.Ocr;
with Ada.Exceptions;                            use Ada.Exceptions;
with Ada.Text_IO;                               use Ada.Text_IO;
with AwaitPackage;                              use AwaitPackage;
with Utility;                                   use Utility;
with Ada.Unchecked_Conversion;

--------------------------------------------------------------------------------
procedure Ocr is

    Hr  : Windows.HRESULT := S_OK;

    ----------------------------------------------------------------------------
    function Get_StorageFile(ImageFileName : Wide_String) return IStorageFile is
        function Await  is new GenericAwait(IAsyncOperation_IStorageFile_Interface);
        m_IAsyncOperation_IStorageFile  : IAsyncOperation_IStorageFile;
        RetVal                          : aliased IStorageFile := null;
    begin
        m_IAsyncOperation_IStorageFile := GetFileFromPathAsync(To_String(ImageFileName));
        if m_IAsyncOperation_IStorageFile /= null then
            if Await(m_IAsyncOperation_IStorageFile) = true then
                Hr := m_IAsyncOperation_IStorageFile.GetResults(RetVal'Access);
            end if;
        end if;
        return RetVal;
    end;

    ----------------------------------------------------------------------------
    function Get_RandomAccessStream (p_IStorageFile : IStorageFile) return IRandomAccessStream is
        function Await  is new GenericAwait(IAsyncOperation_IRandomAccessStream_Interface);
        m_IAsyncOperation_IRandomAccessStream   : aliased IAsyncOperation_IRandomAccessStream;
        RetVal                                  : aliased IRandomAccessStream := null;
    begin
        Hr := p_IStorageFile.OpenAsync(Read, m_IAsyncOperation_IRandomAccessStream'access);
        if m_IAsyncOperation_IRandomAccessStream /= null then
            if Await(m_IAsyncOperation_IRandomAccessStream) = true then
                Hr := m_IAsyncOperation_IRandomAccessStream.GetResults(RetVal'Access);
            end if;
        end if;
        return RetVal;
    end;

    ----------------------------------------------------------------------------
    function Get_BitmapDecoder (p_IRandomAccessStream : IRandomAccessStream) return IBitmapDecoder is
        function Await  is new GenericAwait(IAsyncOperation_IBitmapDecoder_Interface);
        m_IAsyncOperation_IBitmapDecoder    : IAsyncOperation_IBitmapDecoder;
        RetVal                              : aliased IBitmapDecoder;
    begin
        m_IAsyncOperation_IBitmapDecoder := CreateAsync(p_IRandomAccessStream); -- Static
        if m_IAsyncOperation_IBitmapDecoder /= null then
            if Await(m_IAsyncOperation_IBitmapDecoder) = true then
                Hr := m_IAsyncOperation_IBitmapDecoder.GetResults(RetVal'Access);
            end if;
        end if;
        return RetVal;
    end;

    ----------------------------------------------------------------------------
    function Get_SoftwareBitmap (p_IBitmapDecoder : IBitmapDecoder) return ISoftwareBitmap is
        function Await  is new GenericAwait(IAsyncOperation_ISoftwareBitmap_Interface);
        
        function QI is new GenericQI(IBitmapDecoder_Interface , IBitmapFrameWithSoftwareBitmap , IID_IBitmapFrameWithSoftwareBitmap'Access);

        m_IBitmapFrameWithSoftwareBitmap    : aliased IBitmapFrameWithSoftwareBitmap;
        m_IAsyncOperation_ISoftwareBitmap   : aliased IAsyncOperation_ISoftwareBitmap;
        RetVal                              : aliased ISoftwareBitmap := null;
    begin
        m_IBitmapFrameWithSoftwareBitmap := QI(p_IBitmapDecoder); --Hr := p_IBitmapDecoder.QueryInterface(IID_IBitmapFrameWithSoftwareBitmap'access, m_IBitmapFrameWithSoftwareBitmap'Access);
        Hr := m_IBitmapFrameWithSoftwareBitmap.GetSoftwareBitmapAsync(m_IAsyncOperation_ISoftwareBitmap'access);
        if m_IAsyncOperation_ISoftwareBitmap /= null then
            if Await(m_IAsyncOperation_ISoftwareBitmap) = true then
                Hr := m_IAsyncOperation_ISoftwareBitmap.GetResults(RetVal'Access);
            end if;
        end if;
        return RetVal;
    end;

    ----------------------------------------------------------------------------
    function Get_OcrResult (p_IOcrEngine : IOcrEngine; p_ISoftwareBitmap : ISoftwareBitmap) return IOcrResult is
        function Await  is new GenericAwait(IAsyncOperation_IOcrResult_Interface);
        m_IAsyncOperation_IOcrResult    : aliased IAsyncOperation_IOcrResult;
        RetVal                          : aliased IOcrResult := null;
    begin
        Hr := p_IOcrEngine.RecognizeAsync(p_ISoftwareBitmap, m_IAsyncOperation_IOcrResult'access);
        if m_IAsyncOperation_IOcrResult /= null then
            if Await(m_IAsyncOperation_IOcrResult) = true then
                Hr := m_IAsyncOperation_IOcrResult.GetResults(RetVal'Access);
            end if;
        end if;
        return RetVal;
    end;

    ----------------------------------------------------------------------------
    procedure Start is

        m_IStorageFile          : IStorageFile := null;
        m_IRandomAccessStream   : IRandomAccessStream := null;
        m_IBitmapDecoder        : IBitmapDecoder := null;
        m_ISoftwareBitmap       : ISoftwareBitmap := null;
        m_IOcrEngine            : IOcrEngine := null;
        m_IOcrResult            : IOcrResult := null;
        m_Text                  : aliased Windows.String;

    begin

        m_IStorageFile := Get_StorageFile("C:\Users\alexg\Pictures\message.png"); -- Full Path required
        m_IRandomAccessStream := Get_RandomAccessStream(m_IStorageFile);
        m_IBitmapDecoder := Get_BitmapDecoder(m_IRandomAccessStream);
        m_ISoftwareBitmap := Get_SoftwareBitmap(m_IBitmapDecoder);
        m_IOcrEngine := TryCreateFromUserProfileLanguages;  -- Static Function
        m_IOcrResult := Get_OcrResult (m_IOcrEngine, m_ISoftwareBitmap);
        Hr := m_IOcrResult.get_Text(m_Text'access);

        Put_Line(To_Ada(m_Text));

    end;

begin

    Hr := RoInitialize(1);
    if (Hr = 0) then
        Start;
        RoUninitialize;
    end if;

exception when Error: others =>
    Put_Line (Exception_Name (Error));
    Put_Line (Exception_Message (Error));
end;