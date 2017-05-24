*--------------------------------------------------------
* excel file saved as xml 2003 sample:
* ( excelfile.xml )
*
* will read xmlsamples\excelfile.xml
* parse to vfp object
* get all  object properties paths into m.xPaths , save it to "allxPaths.txt"
* and show in editor
*
* will create xml back from vfpObject and show in editor
*
* check nfXmlReadHelp.txt
*
*--------------------------------------------------------

Set Path To '..\' additive
Public oExcelFile  && check in your debugger


inputFile = 'xmlSamples\excelfile.xml'

arrays = '/Workbook/Styles/Style[],/Workbook/Worksheet[]/Table/Row[]/Cell[]'


xPaths = ''

oExcelFile = nfXmlread(m.inputFile,m.arrays,.F.,@xPaths)


If Vartype(oExcelFile) # 'O'
	Return
Endif

Clear

For Each worksheet In oExcelFile.workbook.worksheet

	? 'WorkSheet:',worksheet._attr_.ss_name

	For Each xrow In worksheet.Table._row    && row() is a vfp function, nfXmlRead renamed to _row

		? 'row: '

		if type('xRow.cell') # 'U' && avoid rows w/o cells
			For Each xcell In xRow.cell
				??  ','+xcell.Data._NODETEXT_
				
				if type('xcell._attr_.ss_formula') = 'C'
					? 'Formula: '+ xcell._attr_.ss_formula
				endif
				
			endfor
		endif
	

	Endfor

? ''

Endfor

Strtofile( m.xPaths, 'allXPaths.txt')
Modify File objectPaths Nowait

*--------------------------------------------

m.cout = 'temp\xmlFromVfp.xml'
STRTOFILE( nfXmlCreate( m.oExcelFile ), m.cOut )
MODIFY FILE (m.cOut) nowait



