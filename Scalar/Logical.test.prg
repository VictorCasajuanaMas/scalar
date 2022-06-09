#include 'hbclass.ch'
#INCLUDE 'test.ch'

CLASS Test_Logical FROM TestCase

    EXPORTED: 
        DATA aCategories INIT { TEST_CORE }

        METHOD Test_Str( )
        METHOD Test_StrSql( )
        METHOD Test_Value( )
        METHOD Test_NotEmpty()
        METHOD Test_Empty()

END CLASS



METHOD Test_Str() CLASS Test_Logical

    ::Assert():Equals( 'si' , .T.:Str('si','no') )
    ::Assert():Equals( 'no' , .F.:Str('si','no') )
    ::Assert():Equals( '.T.' , .T.:Str() )
    ::Assert():Equals( '.F.' , .F.:Str() )
    ::Assert():Equals( '.T.' , .T.:Str(,'no') )
    ::Assert():Equals( '.F.' , .F.:Str('si',) )

Return ( Nil )


METHOD Test_StrSql() CLASS Test_Logical

    ::Assert():Equals( '1', .T.:StrSql(), "Test StrSql()")
    ::Assert():Equals( '', .F.:StrSql(), "Test StrSql()")

Return ( Nil )



METHOD Test_Value() CLASS Test_Logical

    ::Assert():Equals( .T., .T.:Value() )
    ::Assert():Equals( .T., Nil:Value(.T.) )
    ::Assert():Equals( .F., Nil:Value(.F.) )

Return ( Nil )

METHOD Test_NotEmpty() CLASS Test_Logical

    ::Assert():Equals( .T., .T.:NotEmpty(), "Test NotEmpty()" )
    ::Assert():Equals( .T., .F.:NotEmpty(), "Test NotEmpty()" )

Return ( Nil )


METHOD Test_Empty() CLASS Test_Logical

    ::Assert():Equals( .F., .T.:Empty(), "Test Empty()" )
    ::Assert():Equals( .F., .F.:Empty(), "Test Empty()" )

Return ( Nil )