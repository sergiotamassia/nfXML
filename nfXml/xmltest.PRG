

*
* Marco Plaza, 2018 - @nfoxProject

clear

Public op ,onp

opackages = getxml()

op   = nfxmlread( opackages('withPackage')  ,'/orderStatus/order[]')  && pass the xpath for .orderStatus.order to be identified as array
onp  = nfxmlread( opackages('withNoPackage'),'/orderStatus/order[]')

test( m.op )
test( m.oNp )

*------------------------------------------------
function test( oXml )
*------------------------------------------------

For Each Order In oXml.orderstatus._order

	With m.order

		? 'custOrder:',.customerordernumber
		
		try
			? 'package consignmentnumber:',.packages.package.consignmentnumber
		catch
			? 'no package Info'
		endtry
		
		For Each Status In .statuses.Status
			with status
				? 'status date:',.statusdate,' Code:',.statuscode,':',.statusdescription
			endwith
		Endfor

	Endwith

Endfor


*--------------------------------------
function getxml()
*--------------------------------------

TEXT to noPackage noshow
<?xml version="1.0" encoding="ISO-8859-1"?>
<orderStatus xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<order>
<clientCode>514</clientCode>
<orderNumber>OR0000014</orderNumber>
<customerOrderNumber>WEBORDER001</customerOrderNumber>
<statuses>
<status>
<statusCode>APK</statusCode>
<statusDescription>Awaiting Picking</statusDescription>
<statusDate>2015-12-15T16:24:31.000Z</statusDate>
<userId>SMG</userId>
<documentReference/>
<statusAction>Removed</statusAction>
</status>
<status>
<statusCode>FA</statusCode>
<statusDescription>Fully Allocated</statusDescription>
<statusDate>2015-12-15T16:26:17.000Z</statusDate>
<userId/>
<documentReference/>
<statusAction/>
</status>
<status>
<statusCode>OPK</statusCode>
<statusDescription>On Picking List </statusDescription>
<statusDate>2015-12-15T16:26:17.000Z</statusDate>
<userId>SMG</userId>
<documentReference>PK00004</documentReference>
<statusAction>Added</statusAction>
</status>
</statuses>
<lines>
<line>
<rucLineId/>
<lineNumber>1</lineNumber>
<priamSku stockType="P">1486</priamSku>
<qtyRequired>1</qtyRequired>
<qtyAllocated>1</qtyAllocated>
<qtyDespatched>0</qtyDespatched>
<qtyCancelled>0</qtyCancelled>
<qtyLost>0</qtyLost>
</line>
</lines>
<packages> </packages>
<userId>SMG</userId>
<userFullName/>
<customerInfo>
<billingDetails>
<Account>10</Account>
Miss
<Name>Sharon McKenzie</Name>
<Address1>179 Broomfield Road</Address1>
<Address2/>
<Address3/>
<Town>Coventry</Town>
<County/>
<Postcode>CV5 6LD</Postcode>
<Country>GB</Country>
<Tel1/>
<Tel2/>
<Mobile/>
<Email/>
<Profiles>
<Profile code="C">Customer</Profile>
<Profile code="CV">Coventry</Profile>
</Profiles>
<Company/>
<Comments> </Comments>
</billingDetails>
<shippingDetails>
<Account>10</Account>
Miss
<Name>Sharon McKenzie</Name>
<Address1>179 Broomfield Road</Address1>
<Address2/>
<Address3/>
<Town>Coventry</Town>
<County/>
<Postcode>CV5 6LD</Postcode>
<Country>GB</Country>
<Tel1/>
<Tel2/>
<Mobile/>
<Email/>
<Profiles>
<Profile code="C">Customer</Profile>
<Profile code="CV">Coventry</Profile>
</Profiles>
<Company/>
<Comments> </Comments>
<pickingDueDate>2015-12-15</pickingDueDate>
<deliveryDate>2015-12-15</deliveryDate>
</shippingDetails>
</customerInfo>
</order>
<order>
<clientCode>514</clientCode>
<orderNumber>OR0000014</orderNumber>
<customerOrderNumber>WEBORDER001</customerOrderNumber>
<statuses>
<status>
<statusCode>APK</statusCode>
<statusDescription>Awaiting Picking</statusDescription>
<statusDate>2015-12-15T16:24:31.000Z</statusDate>
<userId>SMG</userId>
<documentReference/>
<statusAction>Removed</statusAction>
</status>
<status>
<statusCode>FA</statusCode>
<statusDescription>Fully Allocated</statusDescription>
<statusDate>2015-12-15T16:26:17.000Z</statusDate>
<userId/>
<documentReference/>
<statusAction/>
</status>
<status>
<statusCode>OPK</statusCode>
<statusDescription>On Picking List </statusDescription>
<statusDate>2015-12-15T16:26:17.000Z</statusDate>
<userId>SMG</userId>
<documentReference>PK00004</documentReference>
<statusAction>Added</statusAction>
</status>
</statuses>
<lines>
<line>
<rucLineId/>
<lineNumber>1</lineNumber>
<priamSku stockType="P">1486</priamSku>
<qtyRequired>1</qtyRequired>
<qtyAllocated>1</qtyAllocated>
<qtyDespatched>0</qtyDespatched>
<qtyCancelled>0</qtyCancelled>
<qtyLost>0</qtyLost>
</line>
</lines>
<packages> </packages>
<userId>SMG</userId>
<userFullName/>
<customerInfo>
<billingDetails>
<Account>10</Account>
Miss
<Name>Sharon McKenzie</Name>
<Address1>179 Broomfield Road</Address1>
<Address2/>
<Address3/>
<Town>Coventry</Town>
<County/>
<Postcode>CV5 6LD</Postcode>
<Country>GB</Country>
<Tel1/>
<Tel2/>
<Mobile/>
<Email/>
<Profiles>
<Profile code="C">Customer</Profile>
<Profile code="CV">Coventry</Profile>
</Profiles>
<Company/>
<Comments> </Comments>
</billingDetails>
<shippingDetails>
<Account>10</Account>
Miss
<Name>Sharon McKenzie</Name>
<Address1>179 Broomfield Road</Address1>
<Address2/>
<Address3/>
<Town>Coventry</Town>
<County/>
<Postcode>CV5 6LD</Postcode>
<Country>GB</Country>
<Tel1/>
<Tel2/>
<Mobile/>
<Email/>
<Profiles>
<Profile code="C">Customer</Profile>
<Profile code="CV">Coventry</Profile>
</Profiles>
<Company/>
<Comments> </Comments>
<pickingDueDate>2015-12-15</pickingDueDate>
<deliveryDate>2015-12-15</deliveryDate>
</shippingDetails>
</customerInfo>
</order>
</orderStatus>
ENDTEXT



TEXT to withpackage noshow
<?xml version="1.0" encoding="ISO-8859-1"?>
<orderStatus xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<order>
<clientCode>514</clientCode>
<orderNumber>OR0000014</orderNumber>
<customerOrderNumber>WEBORDER001</customerOrderNumber>
<statuses>
<status>
<statusCode>CO</statusCode>
<statusDescription>Complete</statusDescription>
<statusDate>2015-12-15T16:28:09.000Z</statusDate>
<userId/>
<documentReference/>
<statusAction>Added</statusAction>
</status>
<status>
<statusCode>FA</statusCode>
<statusDescription>Fully Allocated</statusDescription>
<statusDate>2015-12-15T16:28:09.000Z</statusDate>
<userId/>
<documentReference/>
<statusAction>Removed</statusAction>
</status>
<status>
<statusCode>OPK</statusCode>
<statusDescription>On Picking List </statusDescription>
<statusDate>2015-12-15T16:26:17.000Z</statusDate>
<userId>SMG</userId>
<documentReference>PK00004</documentReference>
<statusAction>Removed</statusAction>
</status>
</statuses>
<lines>
<line>
<rucLineId/>
<lineNumber>1</lineNumber>
<priamSku stockType="P">1486</priamSku>
<qtyRequired>1</qtyRequired>
<qtyAllocated>1</qtyAllocated>
<qtyDespatched>1</qtyDespatched>
<qtyCancelled>0</qtyCancelled>
<qtyLost>0</qtyLost>
</line>
</lines>
<packages>
<package>
<despatch>SD0000007</despatch>
<packedBy>SMG</packedBy>
<packedDate>2015-12-15T16:28:09.000Z</packedDate>
<consignmentNumber/>
<metaDMC/>
<metaStatus/>
<packageNumber>1</packageNumber>
<invoiceNumber>SI0000007</invoiceNumber>
<carrierCode/>
<carrierUrl/>
<lines>
<line>
<lineNumber>1</lineNumber>
<priamSku>1486</priamSku>
<qty>1</qty>
</line>
</lines>
</package>
</packages>
<userId>SMG</userId>
<userFullName/>
<customerInfo>
<billingDetails>
<Account>10</Account>
Miss
<Name>Sharon McKenzie</Name>
<Address1>179 Broomfield Road</Address1>
<Address2/>
<Address3/>
<Town>Coventry</Town>
<County/>
<Postcode>CV5 6LD</Postcode>
<Country>GB</Country>
<Tel1/>
<Tel2/>
<Mobile/>
<Email/>
<Profiles>
<Profile code="C">Customer</Profile>
<Profile code="CV">Coventry</Profile>
</Profiles>
<Company/>
<Comments> </Comments>
</billingDetails>
<shippingDetails>
<Account>10</Account>
Miss
<Name>Sharon McKenzie</Name>
<Address1>179 Broomfield Road</Address1>
<Address2/>
<Address3/>
<Town>Coventry</Town>
<County/>
<Postcode>CV5 6LD</Postcode>
<Country>GB</Country>
<Tel1/>
<Tel2/>
<Mobile/>
<Email/>
<Profiles>
<Profile code="C">Customer</Profile>
<Profile code="CV">Coventry</Profile>
</Profiles>
<Company/>
<Comments> </Comments>
<pickingDueDate>2015-12-15</pickingDueDate>
<deliveryDate>2015-12-15</deliveryDate>
</shippingDetails>
</customerInfo>
</order>
</orderStatus>

ENDTEXT

o = createobject('collection')
with o
	.add(m.nopackage,'withNoPackage')
	.add(m.withpackage,'withPackage')
endwith

return m.o
