
PARAMETERS url

Local loXMLHTTP As "MSXML2.XMLHTTP"
loXMLHTTP = Createobject("MSXML2.XMLHTTP")

Wait 'downloading...' Window nowait noclear


With loXMLHTTP
	Try
		.Open("GET", url ,.F.)
		.Send()
		cres = .ResponseText
	Catch
		Messagebox('failed to download from '+m.url,0)
		cres = ''
	Endtry
Endwith

	wait clear
	Return m.cres

