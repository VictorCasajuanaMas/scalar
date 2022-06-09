#include 'hbclass.ch'
#INCLUDE 'test.ch'
#include 'date.inc'

CLASS Test_Date FROM TestCase

    EXPORTED:
        DATA aCategories INIT {TEST_CORE}

        METHOD Test_Year()
        METHOD Test_FirstDayOfYear()
        METHOD Test_LastDayOfYear()
        METHOD Test_Month()
        METHOD Test_Day()
        METHOD Test_AddDay( )
        METHOD Test_SubDay( )
        METHOD Test_Tomorrow() 
        METHOD Test_Yesterday() 
        METHOD Test_DiffDays( )
        METHOD Test_AddWeek( )
        METHOD Test_SubWeek( )
        METHOD Test_AddYear( )
        METHOD Test_SubYear( )
        METHOD Test_Str()
        METHOD Test_StrSql()
        METHOD Test_StrSqlQuoted()
        METHOD Test_StrFormat()
        METHOD Test_IsEmpty()
        METHOD Test_NotEmpty()

END CLASS

METHOD Test_Year() CLASS Test_Date

    ::Assert():Equals( 2020, 0d20200101:Year(), 'Test Date:Year()' )

Return ( Nil )

METHOD Test_FirstDayOfYear() CLASS Test_Date

    ::Assert():Equals( 0d20200101, 0d20200710:FirstDayOfYear(), 'Test Date:FirstDayOfYear()' )

Return ( Nil )

METHOD Test_LastDayOfYear() CLASS Test_Date

    ::Assert():Equals( 0d20201231, 0d20200710:LastDayOfYear(), 'Test Date:FirstDayOfYear()' )

Return ( Nil )


METHOD Test_Month() CLASS Test_Date

    ::Assert():Equals( 2, 0d20200201:Month(), 'Test Date:Month()' )

Return ( Nil )



METHOD Test_Day() CLASS Test_Date

    ::Assert():Equals( 1, 0d20200201:Day(), 'Test Date:Day()' )

Return ( Nil )



METHOD Test_AddDay( ) CLASS Test_Date

    ::Assert():Equals( 0d20220101, 0d20210101:AddDay( 365 ), 'Test Date:AddDay()' )
    ::Assert():Equals( 0d20201231, 0d20200101:AddDay( 365 ), 'Test Date:AddDay()' ) // bisiesto
    ::Assert():Equals( 0d20200102, 0d20200101:AddDay( ), 'Test Date:AddDay()' )

Return ( Nil )



METHOD Test_SubDay( ) CLASS Test_Date

    ::Assert():Equals( 0d20210101, 0d20220101:SubDay( 365 ), 'Test Date:SubDay()' )
    ::Assert():Equals( 0d20200101, 0d20201231:SubDay( 365 ), 'Test Date:SubDay()' ) // bisiesto
    ::Assert():Equals( 0d20191231, 0d20200101:SubDay( ), 'Test Date:SubDay()' )

Return ( Nil )


METHOD Test_Tomorrow( ) CLASS Test_Date

    ::Assert():Equals( 0d20200102, 0d20200101:Tomorrow( ), 'Test Date:Tomorrow()' )

Return ( Nil )    



METHOD Test_Yesterday() CLASS Test_Date

    ::Assert():Equals( 0d20191231, 0d20200101:Yesterday( ), 'Test Date:Yesterday()' )

Return ( Nil )    


METHOD Test_DiffDays() CLASS Test_Date

    ::Assert():Equals(         10, 0d20200101:DiffDays( 0d20200111 ), 'Test Date:DiffDays()' )
    ::Assert():Equals(        -10, 0d20200101:DiffDays( 0d20191222 ), 'Test Date:DiffDays()' )
    ::Assert():Equals( Date() - 0d20200101, 0d20200101:DiffDays( ), 'Test Date:DiffDays()' )
    ::Assert():Equals(          0, 0d20200101:DiffDays( 0d20200101 ), 'Test Date:DiffDays()' )

Return ( Nil )



METHOD Test_AddWeek( ) CLASS Test_Date

    ::Assert():Equals( 0d20200115, 0d20200101:AddWeek( 2 ) )
    ::Assert():Equals( 0d20200108, 0d20200101:AddWeek( ) )

Return ( Nil )

METHOD Test_AddYear( ) CLASS Test_Date

    ::Assert():Equals( 0d20220101, 0d20200101:AddYear( 2 ) )
    ::Assert():Equals( 0d20210101, 0d20200101:AddYear( ) )

Return ( Nil )

METHOD Test_SubYear( ) CLASS Test_Date

    ::Assert():Equals( 0d20180101, 0d20200101:SubYear( 2 ) )
    ::Assert():Equals( 0d20190101, 0d20200101:SubYear( ) )

Return ( Nil )

METHOD Test_SubWeek( ) CLASS Test_Date

    ::Assert():Equals( 0d20191218, 0d20200101:SubWeek( 2 ) )
    ::Assert():Equals( 0d20191225, 0d20200101:SubWeek( ) )

Return ( Nil )



METHOD Test_Str() CLASS Test_Date

    ::Assert():Equals( '01/01/2020', 0d20200101:Str() )
    ::Assert():Equals( FECHAVACIA, 0d00000000:Str() )
    ::Assert():Equals( FECHAVACIA, ctod('  /  /  '):Str() )
    ::Assert():Equals( FECHAVACIA, ctod('/  /'):Str() )
    ::Assert():Equals( FECHAVACIA, ctod('  /  /'):Str() )
    ::Assert():Equals( FECHAVACIA, ctod('/  /  '):Str() )
    ::Assert():Equals( FECHAVACIA, ctod('//'):Str() )
    ::Assert():Equals( FECHAVACIA, ctod(''):Str() )
    ::Assert():Equals( FECHAVACIA, ctod('123456'):Str() )
    ::Assert():Equals( FECHAVACIA, ctod('abcdef'):Str() )

Return ( Nil )

METHOD Test_StrSql() CLASS Test_Date

    ::Assert():Equals( '2020-01-01', 0d20200101:StrSql(), 'Test StrSql()')
    ::Assert():Equals( '0000-00-00', 0d00000000:StrSql(), 'Test StrSql()')

Return ( Nil )

METHOD Test_StrSqlQuoted() CLASS Test_Date

    ::Assert():Equals( "'2020-01-01'", 0d20200101:StrSqlQuoted(), 'Test StrSqlQuoted()')
    ::Assert():Equals( "'0000-00-00'", 0d00000000:StrSqlQuoted(), 'Test StrSqlQuoted()')

Return ( Nil )


METHOD Test_StrFormat() CLASS Test_Date

    ::Assert():Equals( '1 de enero de 2020', 0d20200101:StrFormat( 'dd de mmmm de aaaa'), 'Test_StrFormat()' )
    ::Assert():Equals( '01 de Enero del 20', 0d20200101:StrFormat( '0d de Mmmm del aa'), 'Test_StrFormat()' )
    ::Assert():Equals( '01 de 1 del 20', 0d20200101:StrFormat( '0d de mm del aa'), 'Test_StrFormat()' )
    ::Assert():Equals( '01 de 01 de 2020', 0d20200101:StrFormat( '0d de 0m de aaaa'), 'Test_StrFormat()' )
    ::Assert():Equals( '1 de ene de 2020', 0d20200101:StrFormat( 'dd de mmm de aaaa'), 'Test_StrFormat()' )
    ::Assert():Equals( '1 de ENE de 2020', 0d20200101:StrFormat( 'dd de MMM de aaaa'), 'Test_StrFormat()' )
    ::Assert():Equals( '20200201', 0d20200201:StrFormat( 'aaaa0m0d'), 'Test_StrFormat()' )

Return ( Nil )



METHOD Test_IsEmpty() CLASS Test_Date

    ::Assert():True( 0d00000000:ISEmpty() )
    ::Assert():False( 0d20200101:ISEmpty() )
    ::Assert():True( cTod(''):ISEmpty() )
    ::Assert():False( cTod('01/01/2020'):ISEmpty() )

Return ( Nil )



METHOD Test_NotEmpty() CLASS Test_Date

    ::Assert():False( 0d00000000:NotEmpty() )
    ::Assert():True( 0d20200101:NotEmpty() )
    ::Assert():False( cTod(''):NotEmpty() )
    ::Assert():True( cTod('01/01/2020'):NotEmpty() )

Return ( Nil )