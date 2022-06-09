#INCLUDE 'hbclass.ch'
#INCLUDE 'test.ch'

CREATE CLASS Test_TimeStamp FROM TestCase

    EXPORTED:
        DATA aCategories INIT {TEST_CORE}

        METHOD Test_Date()
        METHOD Test_Time()
        METHOD Test_Year()
        METHOD Test_Month()
        METHOD Test_Day()
        METHOD Test_Hour()
        METHOD Test_Minute()
        METHOD Test_Sec()
        METHOD Test_str()

END CLASS


METHOD Test_Date() CLASS Test_TimeStamp

    ::Assert():Equals( 0d20200101 , hb_dtot( 0d20200101, "12:34:56.000"):Date() , 'test Date()' )

Return( Nil )



METHOD Test_Time() CLASS Test_TimeStamp

    ::Assert():Equals( "12:34:56" , hb_dtot( 0d20200101, "12:34:56.000"):Time() , 'test Time()' )

Return( Nil )



METHOD Test_Year() CLASS Test_TimeStamp

    ::Assert():Equals( 2020 , hb_dtot( 0d20200101, "12:34:56.000"):Year() , 'test Year()' )

Return( Nil )



METHOD Test_Month() CLASS Test_TimeStamp

    ::Assert():Equals( 2 , hb_dtot( 0d20200201, "12:34:56.000"):Month() , 'test Month()' )

Return( Nil )



METHOD Test_Day() CLASS Test_TimeStamp

    ::Assert():Equals( 3 , hb_dtot( 0d20200203, "12:34:56.000"):Day() , 'test Day()' )

Return( Nil )



METHOD Test_Hour() CLASS Test_TimeStamp

    ::Assert():Equals( 12 , hb_dtot( 0d20200101, "12:34:56.000"):Hour() , 'test Hour()' )

Return( Nil )



METHOD Test_Minute() CLASS Test_TimeStamp

    ::Assert():Equals( 34 , hb_dtot( 0d20200101, "12:34:56.000"):Minute() , 'test Minute()' )

Return( Nil )



METHOD Test_Sec() CLASS Test_TimeStamp

    ::Assert():Equals( 56 , hb_dtot( 0d20200101, "12:34:56.000"):Sec() , 'test Sec()' )

Return( Nil )


METHOD Test_Str() CLASS Test_TimeStamp

    ::Assert():Equals( '2020-01-01 12:34:56.000', hb_dtot( 0d20200101, "12:34:56.000"):Str() )

Return ( Nil )