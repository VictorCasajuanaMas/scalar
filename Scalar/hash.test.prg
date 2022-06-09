#INCLUDE 'hbclass.ch'
#INCLUDE 'test.ch'

CREATE CLASS Test_Hash FROM TestCase

    EXPORTED:
        DATA aCategories AS ARRAY INIT { TEST_CORE }

        METHOD Test_UpperKeys()
        METHOD Test_ValueOfKey( cKey )
        METHOD Test_HasKey( cKey )
        METHOD Test_NotHasKey( cKey )
        METHOD Test_HasKeys( ... )
        METHOD Test_Empty(  )
        METHOD Test_NotEmpty(  )
        METHOD Test_Str()

END CLASS



METHOD Test_UpperKeys() CLASS Test_Hash

    ::Assert():ArrayEquals( {'KEY'=>'valor'} , {'key'=>'valor'}:UpperKeys() , 'test UpperKeys()' )

Return( Nil )




METHOD Test_ValueOfKey() CLASS Test_Hash

    ::Assert():Null( {'uno'=>'1','dos'=>'2'}:ValueOfKey() , 'test ValueOfKey()' )
    ::Assert():Null( {'uno'=>'1','dos'=>'2'}:ValueOfKey('3') , 'test ValueOfKey()' )
    ::Assert():Null( {'uno'=>'1','dos'=>'2'}:ValueOfKey(3) , 'test ValueOfKey()' )
    ::Assert():Equals( '2', {'uno'=>'1','dos'=>'2'}:ValueOfKey('dos') , 'test ValueOfKey()' )
    ::Assert():Equals( 'defecto', {'uno'=>'1','dos'=>'2'}:ValueOfKey(3,'defecto') , 'test ValueOfKey()' )

Return( Nil )



METHOD Test_HasKey( cKey ) CLASS Test_Hash

    ::Assert():True( {'uno' => 1, 'dos' => 2 }:HasKey( 'uno' ), 'test HasKey()' )
    ::Assert():False( {'uno' => 1, 'dos' => 2 }:HasKey( 'tres' ), 'test HasKey()' )
    ::Assert():False( {'uno' => 1, 'dos' => 2 }:HasKey( 3 ), 'test HasKey()' )

Return ( Nil )


METHOD Test_NotHasKey( cKey ) CLASS Test_Hash

    ::Assert():False( {'uno' => 1, 'dos' => 2 }:NotHasKey( 'uno' ), 'test HasKey()' )
    ::Assert():True( {'uno' => 1, 'dos' => 2 }:NotHasKey( 'tres' ), 'test HasKey()' )
    ::Assert():True( {'uno' => 1, 'dos' => 2 }:NotHasKey( 3 ), 'test HasKey()' )

Return ( Nil )



METHOD Test_HasKeys( ... ) CLASS Test_Hash

    ::Assert():False( {'uno' => 1, 'dos' => 2 }:HasKeys( ), 'test HasKeys()' )
    ::Assert():True( {'uno' => 1, 'dos' => 2 }:HasKeys(  'uno' ), 'test HasKeys()' )
    ::Assert():True( {'uno' => 1, 'dos' => 2 }:HasKeys( 'uno','dos' ), 'test HasKeys()' )
    ::Assert():False( {'uno' => 1, 'dos' => 2 }:HasKeys( 'uno','dos','tres' ), 'test HasKeys()' )
    ::Assert():False( {'uno' => 1, 'dos' => 2 }:HasKeys( 'uno',2 ), 'test HasKeys()' )

Return ( Nil )



METHOD Test_Empty() CLASS Test_Hash

    ::Assert():True( {}:Empty(), 'test Empty')
    ::Assert():False( {'uno'=>1}:Empty(), 'test Empty')

Return ( Nil )



METHOD Test_NotEmpty() CLASS Test_Hash

    ::Assert():False( {}:NotEmpty(), 'test NotEmpty')
    ::Assert():True( {'uno'=>1}:NotEmpty(), 'test NotEmpty')

Return ( Nil )

METHOD Test_Str() CLASS Test_Hash

    ::Assert():true( HB_ISSTRING( {'numero'=> 1, 'string'=>'1', 'fecha'=>Date(), 'lógico'=>.T.}:Str() ) )

Return ( Nil )