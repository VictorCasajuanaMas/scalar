#INCLUDE 'hbclass.ch'
#INCLUDE 'test.ch'

CLASS Test_Numeric FROM TestCase

    EXPORTED:
        DATA aCategories INIT { TEST_CORE }

        METHOD Test_Int()
        METHOD Test_Round()
        METHOD Test_StrInit()
        METHOD Test_StrFloat()
        METHOD Test_Str()
        METHOD Test_StrSql()
        METHOD Test_StrRaw()
        METHOD Test_Value()
        METHOD Test_Empty()
        METHOD Test_NotEmpty()


END CLASS

METHOD Test_StrSql() CLASS Test_Numeric

    ::Assert():Equals( '123456', 123456:StrSql() )
    ::Assert():Equals( '0', 0:StrSql() )
    ::Assert():Equals( '123456.789000', 123456.789:StrSql() )
    ::Assert():Equals( '0.000001', 0.000001:StrSql() )

Return ( Nil )

METHOD Test_Int() CLASS Test_Numeric

    ::Assert():Equals( 123456 , 123456:Int() )
    ::Assert():Equals( 123456 , 123456.7890:Int() )
    ::Assert():Equals( 0 , 0.123:Int() )

Return ( Nil )    

METHOD Test_Round() CLASS Test_Numeric

    ::Assert():Equals( 123456 , 123456:Round() )
    ::Assert():Equals( 123456.8 , 123456.78:Round(1) )
    ::Assert():Equals( 0.12 , 0.123:Round(2) )

Return ( Nil )    


METHOD Test_StrInit() CLASS Test_Numeric

    ::Assert():Equals( '123456' , 123456:StrInt() )
    ::Assert():Equals( '123457' , 123456.7890:StrInt() )
    ::Assert():Equals( '0' , 0:StrInt() )

Return ( Nil )

METHOD Test_StrFloat() CLASS Test_Numeric

    ::Assert():Equals( '123456.7890' , 123456.7890:StrFloat(4) )
    ::Assert():Equals( '123456.79' , 123456.7890:StrFloat(2) )
    ::Assert():Equals( '123456.78' , 123456.7840:StrFloat(2) )
    ::Assert():Equals( '123456.79' , 123456.7850:StrFloat(2) )
    ::Assert():Equals( '123456.789000' , 123456.7890:StrFloat() )
    ::Assert():Equals( '0.000000' , 0:StrFloat() )

Return ( Nil )


METHOD Test_Str() CLASS Test_Numeric

    ::Assert():Equals( '123', 123.00:Str() )
    ::Assert():Equals( '123', 123.12:Str() )
    ::Assert():Equals( '123.12', 123.12:Str(,2) )
    ::Assert():Equals( '***', 123.12:Str(3,2) )
    ::Assert():Equals( '123.12', 123.12:Str(6,2) )
    ::Assert():Equals( '**', 123.12:Str(2) )

Return ( Nil )



METHOD Test_StrRaw() CLASS Test_Numeric

    ::Assert():Equals( '123', 123.00:Str() )
    ::Assert():Equals( '123', 123.12:Str() )
    ::Assert():Equals( '123.12', 123.12:Str(,2) )
    ::Assert():Equals( '***', 123.12:Str(3,2) )
    ::Assert():Equals( '123.12', 123.12:StrRaw(6,2) )
    ::Assert():Equals( '  123.12', 123.12:StrRaw(8,2) )
    ::Assert():Equals( '**', 123.12:Str(2) )

Return ( Nil )



METHOD Test_Value() CLASS Test_Numeric

    ::Assert():Equals( 0, 0:Value() )
    ::Assert():Equals( 0, Nil:Value(0) )

Return ( Nil )


METHOD Test_Empty() CLASS Test_Numeric

    ::Assert():True( 0:Empty() )
    ::Assert():False( 1:Empty() )

Return ( Nil )


METHOD Test_NotEmpty() CLASS Test_Numeric

    ::Assert():True( 1:NotEmpty())
    ::Assert():False( 0:NotEmpty())

Return ( Nil )