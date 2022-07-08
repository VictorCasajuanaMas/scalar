/* CLASS: Scalar Date
		  Clase que difine los métodos para el tipo de dato Date
*/
#include 'hbclass.ch'
#include 'hbcompat.ch'
#include 'date.inc'

CREATE CLASS Date INHERIT HBScalar FUNCTION HBDate

    EXPORTED:
        METHOD Year()
		METHOD Month()
        METHOD Week()
		METHOD Day()
		
		METHOD NameOfMonth()
		METHOD NameOfWeekDay()
		
        METHOD FirstDayOfYear()
        METHOD LastDayOfYear()
		METHOD FirstDayOfMonth()
		METHOD LastDayOfMonth()
		METHOD FirstDayOfWeek()
		METHOD LastDayOfWeek()
		
		METHOD AddYear( nYearsToAdd )
        METHOD SubYear( nYearsToSubstract )		
		METHOD AddMonth( nMonthsToAdd )
        METHOD SubMonth( nMonthsToSubstract )
		METHOD AddWeek( nWeeksToAdd )
        METHOD SubWeek( nWeeksToSubstract )
        METHOD AddDay( nDaysToAdd )
        METHOD SubDay( nDaysToSubstract )

        METHOD Tomorrow()
        METHOD Yesterday()
        METHOD DiffDays( dDate )
        METHOD Str()
        METHOD StrSql()
        METHOD StrSqlQuoted()
        METHOD IsEmpty()
        METHOD NotEmpty()
		METHOD StrFormat( cFormat )
ENDCLASS

// Group EXPORTED METHODS


/* METHOD: Year()
    Método que devuelve el año del valor del dato

Devuelve:
    Numérico
*/
METHOD Year() CLASS Date
RETURN Year( Self )


/* METHOD: Month()
    Método que devuelve el número de mes del dato

Devuelve:
    Numérico
*/
METHOD Month() CLASS Date
RETURN Month( Self )


/* METHOD: Week()
    Método que devuelve el número de la semana en el año

Devuelve:
    Numérico
*/
METHOD Week() CLASS Date
RETURN hb_Week( Self)


/* METHOD: Day()
    Método que devuelve el día del mes correspondiente al dato

Devuelve:
    Numérico
*/
METHOD Day() CLASS Date
RETURN Day( Self )


/* METHOD: NameOfMonth()
    Método que devuelve el nombre del mes correspondiente al dato

Devuelve:
    Carácter
*/
METHOD NameOfMonth() CLASS Date
RETURN cMonth( Self )


/* METHOD: NameOfWeekDay()
    Método que devuelve el nombre del día de la semana correspondiente al dato

Devuelve:
    Carácter
*/
METHOD NameOfWeekDay() CLASS Date
RETURN cDoW( Self )


/* METHOD: FirstDayOfYear()
    Método que devuelve el primer día del año

Devuelve:
    Fecha
*/
METHOD FirstDayOfYear() CLASS Date
RETURN Ctod ( '01/01/' + ::Year():Strint() )


/* METHOD: LastDayOfYear()
    Método que devuelve el último día del año

Devuelve:
    Fecha
*/
METHOD LastDayOfYear() CLASS Date
RETURN Ctod ( '31/12/' + ::Year():Strint() )


/* METHOD: FirstDayOfMonth()
    Método que devuelve la fecha del primer día del mes correspondiente al dato

Devuelve:
    Fecha
*/
METHOD FirstDayOfMonth() CLASS Date
RETURN Ctod ( '01/'+ ::Month():Strint() + '/' + ::Year():Strint() )


/* METHOD: LastDayOfMonth()
    Método que devuelve la fecha del último día del mes correspondiente al dato

Devuelve:
    Fecha
*/
METHOD LastDayOfMonth() CLASS Date
RETURN Ctod ( '01/'+ ::AddMonth():Month():Strint() + '/' + ::AddMonth():Year():Strint() )-1


/* METHOD: FirstDayOfWeek()
    Método que devuelve la fecha del primer día de la semana según ISO 8601,
	si lFirstSunDay el primer día será domingo en vez de lunes

Devuelve:
    Fecha
*/
METHOD FirstDayOfWeek(lFirstSunDay) CLASS Date
	HB_Default(@lFirstSunDay, .F.)
RETURN  Self - DoW(Self ) + iif(lFirstSunDay,1,2)


/* METHOD: LastDayOfWeek()
    Método que devuelve la fecha del último día de la semana ISO 8601,
	si lFirstSunDay el primer día será domingo en vez de lunes

Devuelve:
    Fecha
*/
METHOD LastDayOfWeek(lFirstSunDay) CLASS Date
	HB_Default(@lFirstSunDay, .F.)
RETURN ::FirstDayOfWeek(lFirstSunDay) + 6


/* METHOD: AddYear( nYearsToAdd )
    Devuelve la fecha del dato sumando nYearsToAdd años

Parámetros:
    nYearsToAdd - Número de años a sumar, si no se le pasa suma 1 año

Devuelve:
    Fecha
*/
METHOD AddYear( nYearsToAdd ) CLASS Date

    hb_Default( @nYearsToAdd, 1 )


Return AddMonth(Self, (nYearsToAdd * 12) )


/* METHOD: SubYear( nYearsToSubstract )
     Devuelve la decha del datos restando nYearsToSubstract años

Parámetros:
    nYearsToSubstract - Número de años a restar, si no se le pasa resta 1 año

Devuelve:
    Fecha
*/
METHOD SubYear( nYearsToSubstract ) CLASS Date

    hb_Default( @nYearsToSubstract, 1 )

Return AddMonth(Self,-(nYearsToSubstract * 12) )


/* METHOD: AddMonth( nMonthsToAdd )
    Devuelve la fecha del dato dentro de nMonthsToAdd meses

Parámetros:
    nMonthstoAdd - Número de meses a sumar, si no se le pasa suma 1 mes

Devuelve:
    Fecha
*/
METHOD AddMonth( nMonthsToAdd ) CLASS Date

    hb_Default( @nMonthsToAdd, 1 )

Return AddMonth(Self, nMonthsToAdd)


/* METHOD: SubMonth( nMonthsToSubstract )
     Resta tantos meses como nMonthstoSubstract a la fecha del valor

Parámetros:
    nMonthstoSubstract - Número de meses a restar, si no se le pasa resta 1 mes

Devuelve:
    Fecha
*/
METHOD SubMonth( nMonthsToSubstract ) CLASS Date

    hb_Default( @nMonthsToSubstract, 1 )

Return AddMonth(Self,-nMonthsToSubstract)


/* METHOD: AddWeek( nWeekstoAdd )
    Método que añade nWeekstoAdd a la fecha del valor

Parámetros:
    nWeeksToAdd - Número de semanas a sumar, si se omite tomará 1 por defecto

Devuelve:
    Numérico
*/
METHOD AddWeek( nWeeksToAdd ) CLASS Date

    hb_Default( @nWeeksToAdd, 1 )

Return Self + ( nWeeksToAdd*7 )


/* METHOD: SubWeek( nWeekstoSubstract )
    Método que resta tantas semanas como nweekstoSubstract a la fecha del valor

Parámetros:
    nWeeksToSubstract - Número de semanas a restar, si se omite tomará 1 por defecto

Devuelve:
    Numérico
*/
METHOD SubWeek( nWeeksToSubstract ) CLASS Date

    hb_Default( @nWeeksToSubstract, 1 )

Return Self - ( nWeeksToSubstract*7 )


/* METHOD: AddDay( ndaysToAdd )
    Devuelve la fecha del dato dentro de ndaystoAdd

Parámetros:
    nDaystoAdd - Número de días a sumar, si no se le pasa suma 1 día

Devuelve:
    Fecha
*/
METHOD AddDay( nDaysToAdd ) CLASS Date

    hb_Default( @nDaysToAdd, 1 )

Return Self + nDaysToAdd


/* METHOD: SubDay( nDaysToSubstract )
    Devuelve la fecha del dato antes de nDaysToSubstract

Parámetros:
    nDaysToSubstract - Número de días a restar, si no se le pasa resta 1 día

Devuelve:
    Fecha
*/
METHOD SubDay ( nDaysToSubstract ) CLASS Date

    hb_Default( @nDaysToSubstract, 1 )

Return Self - nDaysToSubstract


/* METHOD: Tomorrow()
    Devuelve el día posterioer al dato

Devuelve:
    Fecha
*/
METHOD Tomorrow() CLASS Date
Return ::AddDay()


/* METHOD: Yesterday()
    Devuelve el día anterior al dato

Devuelve:
    Fecha
*/
METHOD Yesterday() CLASS Date
Return ::SubDay()


/* METHOD: DiffDays( dDate )
    Devuelve el número de días de diferencia entre el dato y date.
    Si dDate es posterior al dato el valore será positivo y si es anterior el valor será negativo

Parámetros:
    dDate - Fecha a tomar como diferencia al valor

Devuelve:
    Numérico
*/
METHOD DiffDays( dDate ) CLASS Date

    hb_Default( @dDate, Date() )

Return dDate - Self


/* METHOD: Str()
    Devuelve el string del valor de la fecha

Parámetros:

Devuelve:
    String
*/
METHOD Str() CLASS Date
Return dtoc( Self )


/* METHOD: StrSql()
    Devuelve el string del valor en formato fecha SQL  YYYY-MM-DD

    Devuelve String
*/
METHOD StrSql()
Return ( Self:StrFormat( 'aaaa-0m-0d') )


/* METHOD: StrSqlQuoted()
    Devuelve StrSql entre comillado

    Devuelve String
*/
METHOD StrSqlQuoted()
Return Chr( 39 ) + Self:StrSql() + Chr( 39 )


/* METHOD: IsEmpty()
    Indica si en el Valor de fecha está vacío devolviendo .T. en este caso y .F. si contiene un valor válido de fecha

    Devuelve:
        Lógico
*/
METHOD IsEmpty() CLASS Date
Return ( Self:Str() == FECHAVACIA .or. Empty(Self) )


/* METHOD: NotEmpty
    Indica si hay un valor de fecha válido devolviendo .T. en este caso y .F. si el valor de la fecha está vacío.

    Devuelve:
        Lógico
*/
METHOD NotEmpty() CLASS Date
Return ( Self:Str() != FECHAVACIA .and. !Empty(Self) )


/* METHOD: StrFormat( cFormat )
    Devuelve la fecha formateada según "dd de mmmm de aaaa"
    Adaptación inicial de: Bingen Ugaldebere

Parámetros:
   cFormat - Formato según
            0d -- día anteponiendo 0 en los días de un dígito

            dd -- día

            0m -- número del mes anteponiendo 0 en los meses de un dígito

            mm -- número del mes

           mmm -- las primeras tres letras del mes en minusculas

           Mmm -- las primeras tres letras del mes en comenzando con mayuscula

           MMM -- las primeras tres letras del mes en mayusculas

          mmmm -- el nombre del mes en minusculas

          Mmmm -- el nombre del mes comenzando con mayuscula

          MMMM -- el nombre del mes en mayusculas

            aa -- año con dos dígitos

          aaaa -- año con cuatro dígitos



Devuelve:
    String
*/
METHOD StrFOrmat( cFormat ) CLASS Date

    Local cDate := ''
    Local cVar := ''
    Local aMesesTemporal := { '   ' }
    Local cCharforEmpty := '0'

    hb_Default ( @cFormat,  "dd de mmmm de aaaa" )

    aEval( {  "Enero     ",;
              "Febrero   ",;
              "Marzo     ",;
              "Abril     ",;
              "Mayo      ",;
              "Junio     ",;
              "Julio     ",;
              "Agosto    ",;
              "Septiembre",;
              "Octubre   ",;
              "Noviembre ",;
              "Diciembre "}, < | cMes |
                                 aAdD( aMesesTemporal, cMes:Lower():Alltrim() )
                                 return ( nil )
                             >)

    cDate := cFormat

    cVar:=if(day(Self)>0,allTrim(str(day(Self))), Replicate( cCharforEmpty, 2) )
    cDate:=strTran(cDate,"dd",cVar)
    cDate:=strTran(cDate,"DD",cVar)
    cVar:=if(day(Self)>0,strZero(day(Self),2), Replicate( cCharforEmpty, 2))
    cDate:=strTran(cDate,"0d",cVar)
    cDate:=strTran(cDate,"0D",cVar)
    cVar:=aMesesTemporal[month(Self)+1]
    cDate:=strTran(cDate,"mmmm",cVar)
    cDate:=strTran(cDate,"Mmmm",upper(left(cVar,1))+subStr(cVar,2))
    cDate:=strTran(cDate,"MMMM",upper(cVar))
    cVar:=left(cVar,3)
    cDate:=strTran(cDate,"mmm",cVar)
    cDate:=strTran(cDate,"Mmm",upper(left(cVar,1))+subStr(cVar,2))
    cDate:=strTran(cDate,"MMM",upper(cVar))
    cVar:=if(month(Self)>0,allTrim(str(month(Self))), Replicate( cCharforEmpty, 2))
    cDate:=strTran(cDate,"mm",cVar)
    cDate:=strTran(cDate,"MM",cVar)
    cVar:=if(day(Self)>0,strZero(month(Self),2), Replicate( cCharforEmpty, 2))
    cDate:=strTran(cDate,"0m",cVar)
    cDate:=strTran(cDate,"0M",cVar)
    cVar:=if(year(Self)>0,TRANSFORM(year(Self),"@E 9999"), Replicate( cCharforEmpty, 4))
    cDate:=strTran(cDate,"aaaa",cVar)
    cDate:=strTran(cDate,"AAAA",cVar)
    cVar:=right(cVar,2)
    cDate:=strTran(cDate,"aa",cVar)
    cDate:=strTran(cDate,"AA",cVar)

Return ( cDate )
