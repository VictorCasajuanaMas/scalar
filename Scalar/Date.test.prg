#include 'hbclass.ch'
#INCLUDE 'test.ch'
#include 'date.inc'

CLASS Test_Date FROM TestCase

    EXPORTED:
        DATA aCategories INIT {TEST_CORE}

        METHOD Test_Year()
            METHOD Test_Month()
            METHOD Test_Week()
            METHOD Test_Day()
            
            METHOD Test_NameOfMonth()
            METHOD Test_NameOfWeekDay()
            
            METHOD Test_FirstDayOfYear()
            METHOD Test_LastDayOfYear()
            METHOD Test_FirstDayOfMonth()
            METHOD Test_LastDayOfMonth()
            METHOD Test_FirstDayOfWeek()
            METHOD Test_LastDayOfWeek()
    
            METHOD Test_AddYear( nYearsToAdd )
            METHOD Test_SubYear( nYearsToSubstract )
            METHOD Test_AddMonth( nMonthsToAdd )
            METHOD Test_SubMonth( nMonthsToSubstract )
            METHOD Test_AddWeek( nWeeksToAdd )
            METHOD Test_SubWeek( nWeeksToSubstract )
            METHOD Test_AddDay( nDaysToAdd )
            METHOD Test_SubDay( nDaysToSubstract )
    
            METHOD Test_Tomorrow()
            METHOD Test_Yesterday()
            METHOD Test_DiffDays( dDate )
            METHOD Test_Str()
            METHOD Test_StrSql()
            METHOD Test_StrSqlQuoted()
            METHOD Test_IsEmpty()
            METHOD Test_NotEmpty()
            METHOD Test_StrFormat()
    
    
    END CLASS
    
    METHOD Test_Year() CLASS Test_Date
    
        ::Assert():Equals( 2020, 0d20200101:Year(), 'Test Date:Year()' )
    
    Return ( Nil )
    
    
    METHOD Test_Month() CLASS Test_Date
    
        ::Assert():Equals( 2, 0d20200201:Month(), 'Test Date:Month()' )
    
    Return ( Nil )
    
    
    METHOD Test_Week() CLASS Test_Date
    
        ::Assert():Equals( 5, 0d20200201:Week(), 'Test Date:Week()' )
        ::Assert():Equals( 53, 0d20201230:Week(), 'Test Date:Week()' )
    
    Return ( Nil )
    
    
    METHOD Test_Day() CLASS Test_Date
    
        ::Assert():Equals( 1, 0d20200201:Day(), 'Test Date:Day()' )
    
    Return ( Nil )
    
    
    METHOD Test_NameOfMonth() CLASS Test_Date
        Local cLangOld
        
        REQUEST HB_LANG_EN
        cLangOld := HB_LangSelect( "EN" )
        ::Assert():Equals('January',0d20200101:NameOfMonth(), 'Test Date:NameOfMonth' )
        ::Assert():Equals('December',0d20201201:NameOfMonth(), 'Test Date:NameOfMonth' )
        
        REQUEST HB_LANG_ES
        HB_LangSelect( "ES" )
        ::Assert():Equals('Enero',0d20200101:NameOfMonth(), 'Test Date:NameOfMonth' )
        ::Assert():Equals('Diciembre',0d20201201:NameOfMonth(), 'Test Date:NameOfMonth' )
        
        REQUEST HB_LANG_FR
        HB_LangSelect( "FR" )
        ::Assert():Equals('Janvier',0d20200101:NameOfMonth(), 'Test Date:NameOfMonth' )
        ::Assert():Equals('D'+Chr(130)+'cembre',0d20201201:NameOfMonth(), 'Test Date:NameOfMonth' )
        
        HB_LangSelect( cLangOld )	
    
    Return ( Nil )
    
    
    METHOD Test_NameOfWeekDay() CLASS Test_Date
    
        Local cLangOld
        
        REQUEST HB_LANG_EN
        cLangOld := HB_LangSelect( "EN" )
        
        ::Assert():Equals('Wednesday',0d20200101:NameOfWeekDay(), 'Test Date:NameOfWeekDay' )
        ::Assert():Equals('Tuesday',  0d20201201:NameOfWeekDay(), 'Test Date:NameOfWeekDay' )
        
        REQUEST HB_LANG_ES
        HB_LangSelect( "ES" )
        ::Assert():Equals('Mi'+Chr(130)+'rcoles',0d20200101:NameOfWeekDay(), 'Test Date:NameOfWeekDay' )
        ::Assert():Equals('Martes',0d20201201:NameOfWeekDay(), 'Test Date:NameOfWeekDay' )
        
        REQUEST HB_LANG_FR
        HB_LangSelect( "FR" )
        ::Assert():Equals('Mercredi',0d20200101:NameOfWeekDay(), 'Test Date:NameOfWeekDay' )
        ::Assert():Equals('Mardi',   0d20201201:NameOfWeekDay(), 'Test Date:NameOfWeekDay' )
        
        HB_LangSelect( cLangOld )	
    
    Return ( Nil )
    
    
    METHOD Test_FirstDayOfYear() CLASS Test_Date
    
        ::Assert():Equals( 0d20200101, 0d20200710:FirstDayOfYear(), 'Test Date:FirstDayOfYear()' )
    
    Return ( Nil )
    
    
    METHOD Test_LastDayOfYear() CLASS Test_Date
    
        ::Assert():Equals( 0d20201231, 0d20200710:LastDayOfYear(), 'Test Date:FirstDayOfYear()' )
    
    Return ( Nil )
    
    
    METHOD Test_FirstDayOfMonth() CLASS Test_Date
        
        ::Assert():Equals( 0d20200701, 0d20200710:FirstDayOfMonth(), 'Test Date:FirstDayOfMonth()' )
        
    Return ( Nil )
    
    
    METHOD Test_LastDayOfMonth() CLASS Test_Date
    
        ::Assert():Equals( 0d20200731, 0d20200710:LastDayOfMonth(), 'Test Date:LastDayOfMonth()' )
        ::Assert():Equals( 0d20200229, 0d20200213:LastDayOfMonth(), 'Test Date:LastDayOfMonth()' )  // bisiesto
        ::Assert():Equals( 0d20210228, 0d20210213:LastDayOfMonth(), 'Test Date:LastDayOfMonth()' )
    
    Return ( Nil )
    
    
    METHOD Test_FirstDayOfWeek() CLASS Test_Date
        
        ::Assert():Equals( 0d20200706, 0d20200710:FirstDayOfWeek(), 'Test Date:FirstDayOfWeek()' )
        ::Assert():Equals( 0d20220704, 0d20220707:FirstDayOfWeek(), 'Test Date:FirstDayOfWeek()' )
        ::Assert():Equals( 0d20220703, 0d20220707:FirstDayOfWeek(.t.), 'Test Date:FirstDayOfWeek()' )
        
    Return ( Nil )
    
    
    METHOD Test_LastDayOfWeek() CLASS Test_Date
    
        ::Assert():Equals( 0d20200712, 0d20200710:LastDayOfWeek(), 'Test Date:LastDayOfWeek()' )
        ::Assert():Equals( 0d20220710, 0d20220707:LastDayOfWeek(), 'Test Date:LastDayOfWeek()' )
        ::Assert():Equals( 0d20220709, 0d20220707:LastDayOfWeek(.t.), 'Test Date:LastDayOfWeek()' )
    
    Return ( Nil )
    
    
    METHOD Test_AddYear( ) CLASS Test_Date
    
        ::Assert():Equals( 0d20240101, 0d20210101:AddYear( 3 ),   'Test Date:AddYear()' )
        ::Assert():Equals( 0d20220228, 0d20200229:AddYear( 2 ),   'Test Date:AddYear()' ) // A??isiesto
        ::Assert():Equals( 0d20210101, 0d20200101:AddYear( ),     'Test Date:AddYear()' )
    
    Return ( Nil )
    
    
    METHOD Test_SubYear( ) CLASS Test_Date
    
        ::Assert():Equals( 0d20190101, 0d20220101:SubYear( 3 ),   'Test Date:SubYear()' )
        ::Assert():Equals( 0d20150228, 0d20200229:SubYear( 5 ),   'Test Date:SubYear()' ) // A??isiesto
        ::Assert():Equals( 0d20190301, 0d20200301:SubYear( ),     'Test Date:SubYear()' )
    
    Return ( Nil )
    
    
    METHOD Test_AddMonth( ) CLASS Test_Date
    
        ::Assert():Equals( 0d20210401, 0d20210101:AddMonth( 3 ),   'Test Date:AddMonth()' )
        ::Assert():Equals( 0d20200229, 0d20191231:AddMonth( 2 ),   'Test Date:AddMonth()' ) // A??isiesto
        ::Assert():Equals( 0d20200201, 0d20200101:AddMonth( ),     'Test Date:AddMonth()' )
    
    Return ( Nil )
    
    
    METHOD Test_SubMonth( ) CLASS Test_Date
    
        ::Assert():Equals( 0d20211001, 0d20220101:SubMonth( 3 ),   'Test Date:SubMonth()' )
        ::Assert():Equals( 0d20191130, 0d20201231:SubMonth( 13 ),  'Test Date:SubMonth()' ) // Mes de 30 d? desde mes con 31
        ::Assert():Equals( 0d20200201, 0d20200301:SubMonth( ),     'Test Date:SubMonth()' )
    
    Return ( Nil )
    
    
    METHOD Test_AddWeek( ) CLASS Test_Date
    
        ::Assert():Equals( 0d20200115, 0d20200101:AddWeek( 2 ) )
        ::Assert():Equals( 0d20200108, 0d20200101:AddWeek( ) )
    
    Return ( Nil )
    
    
    METHOD Test_SubWeek( ) CLASS Test_Date
    
        ::Assert():Equals( 0d20191218, 0d20200101:SubWeek( 2 ) )
        ::Assert():Equals( 0d20191225, 0d20200101:SubWeek( ) )
    
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
        ::Assert():True( cTod('  /  /    '):ISEmpty() )
    
    Return ( Nil )
    
    
    METHOD Test_NotEmpty() CLASS Test_Date
    
        ::Assert():False( 0d00000000:NotEmpty() )
        ::Assert():True( 0d20200101:NotEmpty() )
        ::Assert():False( cTod(''):NotEmpty() )
        ::Assert():True( cTod('01/01/2020'):NotEmpty() )
    
    Return ( Nil )
    
    
    
    
    