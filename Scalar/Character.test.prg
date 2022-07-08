#include 'hbclass.ch'
#INCLUDE 'test.ch'
CLASS Test_Character FROM TestCase

    EXPORTED:
        DATA aCategories AS ARRAY INIT { TEST_CORE }


        METHOD Test_Upper()
        METHOD Test_Lower()
        METHOD Test_Alltrim()
        METHOD Test_Capitulate()
        METHOD Test_Capitalize()
        METHOD Test_Del()
        METHOD Test_DelLast()
        METHOD Test_IsEmpty()
        METHOD Test_IsJsonEmpty()
        METHOD Test_NotEmpty()
        METHOD Test_Long()
        METHOD Test_Value()
        METHOD Test_Str()
        METHOD Test_StrSql()
        METHOD Test_Val()
        METHOD Test_StrTran()
        METHOD Test_Has()
        METHOD Test_NotHas()
        METHOD Test_GetJson()
        METHOD Test_IsJsonValid()
        METHOD Test_Left()
        METHOD Test_Right()
        METHOD Test_LeftDeleteUntil()
        METHOD Test_Zeros()
        METHOD Test_Spaces()
        METHOD Test_Reverse()

END CLASS

METHOD Test_Left() CLASS Test_Character

    ::Assert():Equals( 'Ho', 'Hola':Left(2), 'Test Character Left()' )
    ::Assert():Equals( '', 'Hola':Left(), 'Test Character Left()' )
    ::Assert():Equals( 'Hola', 'Hola':Left(5), 'Test Character Left()' )

Return ( Nil )


METHOD Test_Right() CLASS Test_Character

    ::Assert():Equals( 'la', 'Hola':Right(2), 'Test Character Right()' )
    ::Assert():Equals( '', 'Hola':Right(), 'Test Character Right()' )
    ::Assert():Equals( 'Hola', 'Hola':Right(5), 'Test Character Right()' )

Return ( Nil )


METHOD Test_IsJsonEmpty() CLASS Test_Character

    ::Assert():True( hb_jsonEncode( { => } ):IsJsonEmpty(), 'Test_IsJsonEmpty()' )
    ::Assert():True( '':IsJsonEmpty(), 'Test_IsJsonEmpty()' )
    ::Assert():False( '{"dato":1}':IsJsonEmpty(), 'Test_IsJsonEmpty()' )
    ::Assert():False( 'a':IsJsonEmpty(), 'Test_IsJsonEmpty()' )

Return ( Nil )


METHOD Test_GetJson() CLASS Test_Character

    ::Assert():arrayequals( {"codigo"=>1,"codigo"=>2,"codigo"=>3}, '{"codigo":1,"codigo":2,"codigo":3}':GetJson(), 'Test Character:GetJson()')
    ::Assert():arrayequals( {"codigo"=>"1","codigo"=>"2","codigo"=>"3"}, '{"codigo":"1","codigo":"2","codigo":"3"}':GetJson(), 'Test Character:GetJson()')
    ::Assert():arrayequals( {"codigo"=>1,"codigo"=>"2"}, '{"codigo":1,"codigo": "2"}':GetJson(), 'Test Character:GetJson()')
    ::Assert():null( 'esto no es un json':GetJson(), 'Test GetJson()')
    ::Assert():null( '':GetJson(), 'Test GetJson()')

Return ( Nil )

METHOD Test_IsJsonValid() CLASS Test_Character

    ::Assert():True( '{"codigo":1}':IsJsonValid(), 'Test_IsJsonValid()' )
    ::Assert():False( '{}':IsJsonValid(), 'Test_IsJsonValid()' )
    ::Assert():False( '':IsJsonValid(), 'Test_IsJsonValid()' )
    ::Assert():False( 'nada':IsJsonValid(), 'Test_IsJsonValid()' )

Return ( Nil )


METHOD Test_Has() CLASS Test_Character

    ::Assert:True( 'ABCDE':Has( 'A' ), 'Test Charactger:Has()' )
    ::Assert:False( 'ABCDE':Has( 'F' ), 'Test Charactger:Has()' )
    ::Assert:False( 'ABCDE':Has( 'a' ), 'Test Charactger:Has()' )
    ::Assert:False( 'ABCDE':Has( '' ), 'Test Charactger:Has()' )

Return ( Nil )

METHOD Test_NotHas() CLASS Test_Character

    ::Assert:False( 'ABCDE':NotHas( 'A' ), 'Test Charactger:NotHas()' )
    ::Assert:True( 'ABCDE':NotHas( 'F' ), 'Test Charactger:NotHas()' )
    ::Assert:True( 'ABCDE':NotHas( 'a' ), 'Test Charactger:NotHas()' )
    ::Assert:True( 'ABCDE':NotHas( '' ), 'Test Charactger:NotHas()' )

Return ( Nil )

METHOD Test_StrTran() CLASS Test_Character

    ::Assert():Equals( 'AB1DE', 'ABCDE':StrTran( 'C', '1' ), 'Test Character:STrTran()' )
    ::Assert():Equals( 'ABDE', 'ABCDE':StrTran( 'C', '' ), 'Test Character:STrTran()' )
    ::Assert():Equals( 'ABCDE', 'ABCDE':StrTran( 'F', '1' ), 'Test Character:STrTran()' )

Return ( Nil )

METHOD Test_Upper() CLASS Test_Character

    ::Assert():Equals( 'ABCDE', 'abcde':upper(), 'test Character:upper()')
    ::Assert():Equals( '¡…Õ”⁄', '·ÈÌÛ˙':upper(), 'test Character:upper()')
    ::Assert():Equals( '¿»Ã“Ÿ', '‡ËÏÚ˘':upper(), 'test Character:upper()')
    ::Assert():Equals( 'ƒÀœ÷‹', '‰ÎÔˆ¸':upper(), 'test Character:upper()')
    
Return ( Nil )

METHOD Test_Lower() CLASS Test_Character

    ::Assert():Equals( 'abcde', 'ABCDE':lower(), 'test Character:lower()' )
    ::Assert():Equals( '·ÈÌÛ˙', '¡…Õ”⁄':lower(), 'test Character:lower()' )
    ::Assert():Equals( '‡ËÏÚ˘', '¿»Ã“Ÿ':lower(), 'test Character:lower()' )
    ::Assert():Equals( '‰ÎÔˆ¸', 'ƒÀœ÷‹':lower(), 'test Character:lower()' )

Return ( Nil )

METHOD Test_Alltrim() CLASS Test_Character

    ::Assert():Equals( 'a b c d e', '  a b c d e   ':Alltrim(), 'test Character:Alltrim()' )

Return ( Nil )

METHOD Test_Capitulate() CLASS Test_Character

    ::Assert():Equals( 'Hola', 'hOLA':Capitulate(), 'test Character:Capitulate()' )
    ::Assert():Equals( 'Hola mundo', 'hOLA muNdo':Capitulate(), 'test Character:Capitulate()' )
    ::Assert():Equals( 'Un rincÛn del mundo', 'Un rincÛn del mundo':Capitulate(), 'test Character:Capitulate()' )

Return ( Nil )

METHOD Test_Capitalize() CLASS Test_Character

    ::Assert():Equals( 'Hola', 'hOLA':Capitalize(), 'test Character:Capitalize()' )
    ::Assert():Equals( 'Hola Mundo', 'hOLA muNdo':Capitalize(), 'test Character:Capitalize()' )
    ::Assert():Equals( 'Un RincÛn Del Mundo', 'un RincÛn dEL mundo':Capitalize(), 'test Character:Capitalize()' )


Return ( Nil )

METHOD Test_Del() CLASS Test_Character

    ::Assert():Equals( 'fichero', 'fichero.dbf':del( '.dbf' ), 'test Character:Del()' )
    ::Assert():Equals( 'fichero.dbf', 'fichero.dbf':del(), 'test Character:Del()' )
    ::Assert():Equals( 'fichero.dbf', 'fichero.dbf':del( '.DBF' ), 'test Character:Del()' )

Return ( Nil )

METHOD Test_DelLast() CLASS Test_Character

    Local cCadena := ''

    ::Assert():Equals( 'a,b,c,d', 'a,b,c,d,':DelLast(','), 'test Character:DelLast()' )
    ::Assert():Equals( 'a,b,a,b,', 'a,b,a,b,a,b,':DelLast('a,b,'), 'test Character:DelLast()' )
    ::Assert():Equals( 'a,b,', 'a,b,':DelLast(''), 'test Character:DelLast()' )

Return ( Nil )



METHOD Test_IsEmpty CLASS Test_Character

    ::Assert():True( '':IsEmpty, 'test character:Isempty()' )
    ::Assert():True( ' ':IsEmpty, 'test character:Isempty()' )
    ::Assert():False( 'A':IsEmpty, 'test character:Isempty()' )
    ::Assert():False( ' A':IsEmpty, 'test character:Isempty()' )
    ::Assert():False( 'A ':IsEmpty, 'test character:Isempty()' )
    ::Assert():False( ' A ':ISEmpty, 'test character:Isempty()' )

Return ( Nil )

METHOD Test_NotEmpty CLASS Test_Character

    ::Assert():False( '':NotEmpty, 'test character:NotEmpty()' )
    ::Assert():False( ' ':NotEmpty, 'test character:NotEmpty()' )
    ::Assert():True( 'A':NotEmpty, 'test character:NotEmpty()' )
    ::Assert():True( ' A':NotEmpty, 'test character:NotEmpty()' )
    ::Assert():True( 'A ':NotEmpty, 'test character:NotEmpty()' )
    ::Assert():True( ' A ':NotEmpty, 'test character:NotEmpty()' )

Return ( Nil )

METHOD Test_Long() CLASS Test_Character

    ::Assert():Equals(  0, '':Long(), 'test long()' )
    ::Assert():Equals( 10, '1234567890':Long(), 'test long()' )
    ::Assert():Equals( 10, ' 1234567890':Long(), 'test long()' )
    ::Assert():Equals( 10, '1234567890 ':Long(), 'test long()' )
    ::Assert():Equals( 10, ' 1234567890 ':Long(), 'test long()' )

Return ( Nil )

METHOD Test_Value() CLASS Test_Character

    ::Assert():Equals( 'hola', 'hola':Value(), 'test_value()' )
    ::Assert():Equals( 'hola', Nil:Value('hola'), 'test_value()' )

Return ( Nil )


METHOD Test_Str() CLASS Test_Character

    ::Assert():Equals( 'Hola', 'Hola':Str(), 'test_str()')
    ::Assert():Equals( '', '':Str(), 'test_str()')

Return ( Nil )


METHOD Test_StrSql() CLASS Test_Character

    ::Assert():Equals( 'Hola', 'Hola':StrSql(), 'test_strSql()')
    ::Assert():Equals( '', '':StrSql(), 'test_strSql()')

Return ( Nil )



METHOD Test_Val() CLASS Test_Character

    ::Assert():Equals( 123, '123':Val(), 'test_val()' )
    ::Assert():Equals( 123.45, '123.45':Val(), 'test_val()' )
    ::Assert():Equals( 123, '123,45':Val(), 'test_val()' )

Return ( Nil )


METHOD Test_LeftDeleteUntil() CLASS Test_Character

    ::Assert():Equals( '204', '000204':LeftDeleteUntil( '0' ) )
    ::Assert():Equals( '000204', '000204':LeftDeleteUntil( '' ) )
    ::Assert():Equals( '000204', '000204':LeftDeleteUntil( '1' ) )
    ::Assert():Equals( '000204', '000204':LeftDeleteUntil( '2' ) )

Return ( Nil )

METHOD Test_Zeros() CLASS Test_Character

    ::Assert():Equals( '0025', '25':Zeros( 4 ) )
    ::Assert():Equals( '0025', '0025':Zeros( 4 ) )
    ::Assert():Equals( '12345', '12345':Zeros( 4 ) )
    ::Assert():Equals( '25', '25':Zeros( ) )

Return ( Nil )

METHOD Test_Spaces() CLASS Test_Character

    ::Assert():Equals( 'HOLA ', 'HOLA':SpacesRight( 5 ) )
    ::Assert():Equals( 'HOL', 'HOLA':SpacesRight( 3 ) )
    ::Assert():Equals( 'HOLA      ', 'HOLA ':SpacesRight( 10 ) )

Return  ( Nil )

METHOD Test_Reverse() CLASS Test_Character

    ::Assert():Equals( 'aloH', 'Hola':Reverse(), "Test CharacterReverse()" )
    ::Assert():Equals( 'odnuM aloH', 'Hola Mundo':Reverse(), "Test CharacterReverse()" )
    ::Assert():Equals( '54321', '12345':Reverse(), "Test CharacterReverse()" )
    ::Assert():Equals( '', '':Reverse(), "Test CharacterReverse()" )

Return ( Nil )