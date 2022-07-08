#include 'hbclass.ch'

Function Main()

    Local oSuite := TestSuite():New()
    Local oRunner := TestTestRunner():New()

    
    SET CENTURY ON
    SET EXACT ON
    SET DATE TO BRITISH
    
    REQUEST HB_LANG_ES
    REQUEST HB_CODEPAGE_ESWIN
    REQUEST HB_CODEPAGE_UTF8EX
    HB_LangSelect("ES")
    HB_CDPSELECT ("ESWIN")

    oSuite:setCategories( {'core'} ) 

    oSuite:addTest( Test_Character():New() )
    oSuite:addTest( Test_Date():New() )
    oSuite:addTest( Test_Logical():New() )
    oSuite:addTest( Test_Numeric():New() )
    oSuite:addTest( Test_TimeStamp():New() )
    oSuite:addTest( Test_NIL():New() )
    oSuite:addTest( Test_Array():New() )
    oSuite:addTest( Test_Hash():New() )

    oRunner:Run( oSuite )
    oSuite:End()

Return ( Nil )