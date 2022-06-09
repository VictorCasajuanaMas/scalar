//TODO: Testear el resto de tipos de dato, faltará incluir el método value en cada tipo de dato scalar.

#INCLUDE 'hbclass.ch'
#INCLUDE 'test.ch'

CREATE CLASS Test_NIL FROM TestCase

    EXPORTED:
        DATA aCategories AS ARRAY INIT { TEST_CORE }

        METHOD Test_Value()
        METHOD Test_Empty()
        METHOD Test_NotEmpty()
        METHOD Test_Nil()

END CLASS



METHOD Test_Value() CLASS Test_NIL

    ::Assert():Equals( "" , Nil:Value("") , 'test Value()' )

Return( Nil )



METHOD Test_Empty() CLASS Test_NIL

    ::Assert():True( Nil:Empty(), 'test Empty()' )

Return ( Nil )



METHOD Test_NotEmpty() CLASS Test_NIL

    ::Assert():False( Nil:NotEmpty(), 'test NotEmpty()' )

Return ( Nil )


METHOD Test_Nil() CLASS Test_NIL

    ::Assert():equals( 'Nil', Nil:Str(), 'Test Nil:Str()')

Return ( Nil )