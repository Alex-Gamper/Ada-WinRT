--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Data.Xml.Dom;
--------------------------------------------------------------------------------
package Windows.Data.Xml.Xsl is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IXsltProcessor_Interface;
   type IXsltProcessor is access all IXsltProcessor_Interface'Class;
   type IXsltProcessor_Ptr is access all IXsltProcessor;
   type IXsltProcessor2_Interface;
   type IXsltProcessor2 is access all IXsltProcessor2_Interface'Class;
   type IXsltProcessor2_Ptr is access all IXsltProcessor2;
   type IXsltProcessorFactory_Interface;
   type IXsltProcessorFactory is access all IXsltProcessorFactory_Interface'Class;
   type IXsltProcessorFactory_Ptr is access all IXsltProcessorFactory;
   
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
   type IXsltProcessor_Interface is interface and Windows.IInspectable_Interface;
   
   function TransformToString
   (
      This       : access IXsltProcessor_Interface
      ; inputNode : Windows.Data.Xml.Dom.IXmlNode
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IXsltProcessor : aliased constant Windows.IID := (2070179903, 21772, 18630, (169, 15, 147, 165, 185, 100, 81, 143 ));
   
   ------------------------------------------------------------------------
   type IXsltProcessor2_Interface is interface and Windows.IInspectable_Interface;
   
   function TransformToDocument
   (
      This       : access IXsltProcessor2_Interface
      ; inputNode : Windows.Data.Xml.Dom.IXmlNode
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   IID_IXsltProcessor2 : aliased constant Windows.IID := (2376358998, 38821, 17611, (168, 190, 39, 216, 98, 128, 199, 10 ));
   
   ------------------------------------------------------------------------
   type IXsltProcessorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IXsltProcessorFactory_Interface
      ; document : Windows.Data.Xml.Dom.IXmlDocument
      ; RetVal : access Windows.Data.Xml.Xsl.IXsltProcessor
   )
   return Windows.HRESULT is abstract;
   
   IID_IXsltProcessorFactory : aliased constant Windows.IID := (658589376, 39505, 18019, (191, 48, 14, 247, 66, 20, 111, 32 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype XsltProcessor is Windows.Data.Xml.Xsl.IXsltProcessor;
   
   function CreateInstance
   (
      document : Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.Data.Xml.Xsl.IXsltProcessor;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
