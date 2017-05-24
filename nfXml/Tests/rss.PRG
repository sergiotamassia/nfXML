***************************************************************
* download RSS feed from VFPx
* and show content in browser
****************************************************************

Set Path To '..\' additive

RSSFEED = "https://www.foxite.com/forum/rss.aspx"

outfile = "temp\Feeds.html"

Public oRss && explore in your debugger using watch window

xmlFeed = download( m.RSSFEED )
oRss = nfXmlRead( m.xmlFeed )

Set Textmerge On To (m.outfile) Noshow

\ <h2><<oRss.rss.channel.title>></h2>
\ <b><<oRss.rss.channel.description>></b>

For Each rssentry In  oRss.rss.channel.Item

	With rssentry

		\ <h3> <a href="<<.link>>" > <<.Title>> </a></h3>
		\ <<.Description>>

	Endwith

Endfor

Set Textmerge To

messagebox('Check oRss in your debugger to see Rss source',64)

onv=Createobject('hyperlink')
onv.NavigateTo('file://'+Fullpath(m.outfile))


