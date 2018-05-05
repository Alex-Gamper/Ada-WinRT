--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
with Windows.Storage;
with Windows.Storage.Streams;
with Windows.Graphics.Imaging;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.AI.MachineLearning.Preview is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILearningModelEvaluationResultPreview_Interface
      ; asyncInfo : Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelEvaluationResultPreview
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILearningModelPreview_Interface
      ; asyncInfo : Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview
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
   
   function CreateFromModel
   (
      model : Windows.AI.MachineLearning.Preview.ILearningModelPreview
   )
   return Windows.AI.MachineLearning.Preview.ILearningModelBindingPreview is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.AI.MachineLearning.Preview.LearningModelBindingPreview");
      m_Factory     : Windows.AI.MachineLearning.Preview.ILearningModelBindingPreviewFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.AI.MachineLearning.Preview.ILearningModelBindingPreview := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILearningModelBindingPreviewFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromModel(model, RetVal'Access);
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
   
   function LoadModelFromStorageFileAsync
   (
      modelFile : Windows.Storage.IStorageFile
   )
   return Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.AI.MachineLearning.Preview.LearningModelPreview");
      m_Factory     : ILearningModelPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILearningModelPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadModelFromStorageFileAsync(modelFile, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadModelFromStreamAsync
   (
      modelStream : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.AI.MachineLearning.Preview.LearningModelPreview");
      m_Factory     : ILearningModelPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.AI.MachineLearning.Preview.IAsyncOperation_ILearningModelPreview;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILearningModelPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadModelFromStreamAsync(modelStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
