--------------------------------------------------------------------------------
with Windows;                                   use Windows;
with Windows.Foundation;                        use Windows.Foundation;
--------------------------------------------------------------------------------
package AwaitPackage is

    generic
        type T is interface and Windows.IInspectable_Interface;
    function GenericAwait(p_IAsyncOperation : access T'Class) return boolean;

end AwaitPackage;