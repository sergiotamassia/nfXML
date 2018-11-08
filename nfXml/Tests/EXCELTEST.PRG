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

Public oExcelFile  && check this in your debugger


tempdir = justpath(sys(16,1))+'\temp\'

xmlInput = justpath(sys(16,1))+'\xmlSamples\excelfile.xml'

pathsOut = m.tempdir+'allXPaths.txt'
xmlOut = m.tempDir+'xmlFromVfp.xml'

arrays = '/Workbook/Styles/Style[],/Workbook/Worksheet[]/Table/Row[]/Cell[]'


xPaths = ''

oExcelFile = nfXmlread(m.xmlInput,m.arrays,.F.,@xPaths)


If Vartype(oExcelFile) # 'O'
	Return
Endif


Strtofile( m.xPaths, m.pathsOut )
Modify file(m.pathsOut) Nowait

*--------------------------------------------


STRTOFILE( nfXmlCreate( m.oExcelFile ), m.xmlOut )
MODIFY FILE (m.xmlOut) nowait


messagebox('Check oExcelFile in your debugger',0)
