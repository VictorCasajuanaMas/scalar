#INCLUDE 'hbclass.ch'
#INCLUDE 'test.ch'

CREATE CLASS Test_Array FROM TestCase

    EXPORTED:
        DATA aCategories AS ARRAY INIT { TEST_CORE }

        METHOD Test_Scan()
        METHOD Test_Len()
        METHOD Test_Exist()
        METHOD Test_NotExist()
        METHOD Test_Get()
        METHOD Test_GetLast()
        METHOD Test_GetEqualorLess()
        METHOD Test_AddIfNotExist()
        METHOD Test_Empty()
        METHOD Test_NotEmpty()
        METHOD Test_Equal()
        METHOD Test_ArrayInsert()
        METHOD Test_ArrayHashToArray()
        METHOD Test_Str()
        METHOD Test_Sort()
        METHOD Test_Map()

END CLASS

METHOD Test_Sort() CLASS Test_Array

    ::Assert():arrayequals( {1,2,3,4,5}, {4,3,5,1,2}:Sort (  {| x, y | x < y } ) )
    ::Assert():arrayequals( {5,4,3,2,1}, {4,3,5,1,2}:Sort (  {| x, y | x > y } ) )
    ::Assert():arrayequals( {'A','B','C'}, {'B','A','C'}:Sort (  {| x, y | x < y } ) )
    ::Assert():arrayequals( {'C','B','A'}, {'B','A','C'}:Sort (  {| x, y | x > y } ) )

Return ( nil )    


METHOD Test_GetEqualorLess() CLASS Test_Array

    ::Assert():equals( 2, { 1, 2, 3 }:GetEqualorLess( 2 ), 'test GetEqualorLess()')
    ::Assert():equals( 2, { 1, 2, 4 }:GetEqualorLess( 3 ), 'test GetEqualorLess()')
    ::Assert():Null( { }:GetEqualorLess( 2 ), 'test GetEqualorLess()')
    ::Assert():nULL( { 1, 2, 4 }:GetEqualorLess( ), 'test GetEqualorLess()')

    ::Assert():equals( 'B', { 'C', 'A', 'B' }:GetEqualorLess( "B" ), 'test GetEqualorLess()')
    ::Assert():equals( 'B', { 'A', 'D', 'B' }:GetEqualorLess( "C" ), 'test GetEqualorLess()')
    ::Assert():Null( { }:GetEqualorLess( "C" ), 'test GetEqualorLess()')
    ::Assert():nULL( { "A", "B", "D" }:GetEqualorLess( ), 'test GetEqualorLess()')

Return ( Nil )

METHOD Test_Str() CLASS Test_Array

    ::Assert():equals( '1,2,3', {1,2,3}:Str(), 'Test Artay:Str()')
    ::Assert():equals( 'A,B,C', {'A','B','C'}:Str(), 'Test Artay:Str()')
    ::Assert():equals( 'A-B-C', {'A','B','C'}:Str( '-' ), 'Test Artay:Str()')
    ::Assert():equals( '1-B-3', {1,'B',3}:Str( '-' ), 'Test Artay:Str()')
    ::Assert():equals( '1-B-.F.', {1,'B',.F.}:Str( '-' ), 'Test Artay:Str()')
    ::Assert():equals( '1-B-.F.-01/06/2021', {1,'B',.F.,0d20210601}:Str( '-' ), 'Test Artay:Str()')
    ::Assert():equals( '1-B-.F.-01/06/2021-Nil', {1,'B',.F.,0d20210601,}:Str( '-' ), 'Test Artay:Str()')

Return ( Nil )

METHOD Test_ArrayHashToArray() CLASS Test_Array

    Local aData:= {;
                      { 'codigo' => 'uno',    'nombre' => 'Juan' },;
                        { 'codigo' => 'dos',    'nombre' => 'Maria' },;
                        { 'codigo' => 'tres',   'nombre' => 'Jose' },;
                        { 'codigo' => 'cuatro', 'nombre' => 'Sonia' },;
                        { 'nombre' => 'Pedro',  'codigo' => 'cinco' },;
                        { 'edad'   => 18,       'codigo' => 'seis' };
                    }

    ::Assert():arrayequals({;
                            {'codigo','nombre','edad'},;
                            {'uno',   'Juan',  },;
                            {'dos',   'Maria', },;
                            {'tres',  'Jose',  },;
                            {'cuatro','Sonia', },;
                            {'cinco', 'Pedro', },;
                            {'seis',  ,       18};
                            }, aData:ArrayHashToArray(), 'Test ArrayHashToArray()')

    aData := {  {  "date" => 0d20210106 - 2, "item123" => 10, "item12" => 20 },;
                {  "date" => 0d20210106 - 1, "item123" => 30, "item1"  => 40 } ;
             }
    
    ::assert():arrayequals({;
                            {'date','item123','item12','item1'},;
                            {0d20210104,10,20,},;
                            {0d20210105,30,,40};
                            }, aData:ArrayHashToArray(), 'Test ArrayHashToArray()')

Return ( Nil )


METHOD Test_Scan() CLASS Test_Array

    ::Assert():Equals( 2 , { 1, 2, 3 }:Scan( 2 ) , 'test Scan()' )
    ::Assert():Equals( 0 , { 1, 2, 3 }:Scan( 4 ) , 'test Scan()' )
    ::Assert():Equals( 0 , { 1, 2, 3 }:Scan( 0 ) , 'test Scan()' )
    ::Assert():Equals( 2 , { 'a', 'b', 'c' }:Scan( 'b' ) , 'test Scan()' )
    ::Assert():Equals( 0 , { 'a', 'b', 'c' }:Scan( 'd' ) , 'test Scan()' )
    ::Assert():Equals( 0 , { 'a', 'b', 'c' }:Scan( '' ) , 'test Scan()' )
    ::Assert():Equals( 0 , { 'a', 'b', 'c' }:Scan( ) , 'test Scan()' )
    ::Assert():Equals( 0 , { }:Scan( ) , 'test Scan()' )
    ::Assert():Equals( 0 , { 1, 2, 3 }:Scan( ) , 'test Scan()' )

Return( Nil )



METHOD Test_Len() CLASS Test_Array

    ::Assert():Equals( 2 , { 1, 2 }:Len() , 'test Array Len()' )
    ::Assert():Equals( 0 , { }:Len() , 'test Array Len()' )

Return ( Nil )    


METHOD Test_Exist() CLASS Test_Array

    ::Assert():True( { 1, 2 }:Exist( 1 ) , 'test Array Exist()' )
    ::Assert():False( { 1, 2 }:Exist( 3 ) , 'test Array Exist()' )
    ::Assert():False( { 1, 2 }:Exist( ) , 'test Array Exist()' )
    ::Assert():False( { }:Exist( 1 ) , 'test Array Exist()' )
    ::Assert():False( { }:Exist( ) , 'test Array Exist()' )

Return ( Nil )



METHOD Test_NotExist() CLASS Test_Array

    ::Assert():False( { 1, 2 }:NotExist( 1 ) , 'test Array NotExist()' )
    ::Assert():True( { 1, 2 }:NotExist( 3 ) , 'test Array NotExist()' )
    ::Assert():True( { 1, 2 }:NotExist( ) , 'test Array NotExist()' )
    ::Assert():True( {  }:NotExist( 1 ) , 'test Array NotExist()' )
    ::Assert():True( {  }:NotExist( ) , 'test Array NotExist()' )

Return ( Nil )



METHOD Test_Get() CLASS Test_Array

    ::Assert():Null( { 1, 2 }:Get(3) , 'Test Array Get()')
    ::Assert():Null( { 1, 2 }:Get() , 'Test Array Get()')
    ::Assert():Null( { 1, 2 }:Get(-1) , 'Test Array Get()')
    ::Assert():Equals( 1, { 1, 2 }:Get(1) , 'Test Array Get()')
    ::Assert():Equals( 0, { 1, 2 }:Get(3,0) , 'Test Array Get()')

Return ( Nil )


METHOD Test_GetLast() CLASS Test_Array

    ::Assert():equals( 3, { 1, 2, 3 }:GetLast(), 'Test Array GetLast()')
    ::Assert():equals( 1, { 1 }:GetLast(), 'Test Array GetLast()')
    ::Assert():equals( Nil, {  }:GetLast(), 'Test Array GetLast()')

Return ( Nil )


METHOD Test_AddIfNotExist() CLASS Test_Array

    Local aArrayTest := {}

    ::Assert():True( { 1, 2 }:AddIfNotExist( 3 ), 'Test Array AddIfNotExist()' )
    ::Assert():False( { 1, 2 }:AddIfNotExist( 2 ), 'Test Array AddIfNotExist()' )

    aArrayTest := { 1, 2 }
    aArrayTest:AddIfNotExist( 3 )
    ::Assert():arrayequals( { 1, 2, 3 }, aArrayTest, 'Test Array AddIfNotExist()')

    aArrayTest := { 1, 2, 3 }
    aArrayTest:AddIfNotExist( 3 )
    ::Assert():arrayequals( { 1, 2, 3 }, aArrayTest, 'Test Array AddIfNotExist()')

Return ( Nil )



METHOD Test_Empty() CLASS Test_Array

    ::Assert():True( {}:Empty(), 'Test Array Empty()' )
    ::Assert():False( {1,2}:Empty(), 'Test Array Empty()' )
    ::Assert():False( {1}:Empty(), 'Test Array Empty()' )

Return ( Nil )


METHOD Test_NotEmpty() CLASS Test_Array

    ::Assert():False( {}:NotEmpty(), 'Test Array NotEmpty()' )
    ::Assert():True( {1,2}:NotEmpty(), 'Test Array NotEmpty()' )
    ::Assert():True( {1}:NotEmpty(), 'Test Array NotEmpty()' )

Return ( Nil )


METHOD Test_Equal() CLASS Test_Array

    ::Assert():True( {'a','b','c'}:Equal ( {'a','b','c' }), 'Test Array Equal()' )
    ::Assert():False( {'a','b','c'}:Equal ( {'a','B','c'}), 'Test Array Equal()' )
    ::Assert():False( {'a','b','c'}:Equal ( {'a'}), 'Test Array Equal()' )
    ::Assert():False( {'a','b','c'}:Equal ( 'abc' ), 'Test Array Equal()' )
    ::Assert():False( {'a','b','c'}:Equal(), 'Test Array Equal()' )
    ::Assert():True( {'a', { 1, 2, 3}, 'b', 'c' }:Equal ( {'a', { 1, 2, 3}, 'b', 'c' } ), 'Test Array Equal()' )

Return ( Nil )

METHOD Test_ArrayInsert() CLASS Test_Array      

    Local aArrayTest := { 'a', 'b', 'c' }

    aArrayTest:ArrayInsert( { 1 , 2 , 3 } )
    ::Assert:arrayequals( { 1, 2, 3, 'a', 'b', 'c' }, aArrayTest, 'Test ArrayInsert()' )
    
Return ( Nil ) 

METHOD Test_Map() CLASS Test_Array

    ::assert:arrayequals( { 2, 3, 4 }, { 1, 2, 3 }:Map( { | x | x + 1 } ) )

Return ( Nil )