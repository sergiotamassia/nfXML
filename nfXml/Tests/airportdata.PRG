
Clear

Set Path To '..\' Additive

Public oAirports,cXml

country = 'italy'


Try

	cXml = download('http://www.webservicex.net/airport.asmx/GetAirportInformationByCountry?country='+M.country)

	oAirports= nfXmlRead( m.cXml  )

	Xmltocursor(oAirports.String._nodetext_,'airports')
	
	IF USED('airports')
		BROWSE
	ELSE
		MESSAGEBOX('no data for '+m.country,0)
	ENDIF

Catch To oerr

	Messagebox(oerr.Message,0)

ENDTRY

