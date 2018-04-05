<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="html">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="h1|head"/>
    
    <xsl:template match="div" mode="html">
        <xsl:result-document href="{concat('My_First_Epub/OEBPS/', 'chap0', position(), '.html')}">
            <xsl:variable name="title" select="h2"/>
            <html> 
            <head>
                <title><xsl:value-of select="$title"/></title>
                <link href="stylesheet.css" type="text/css"/>
            </head>
            <body>
                <h1><xsl:value-of select="$title"/></h1>
                <xsl:apply-templates select="p" mode="html"/>
            </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="p" mode="html">
        <xsl:copy>
            <xsl:apply-templates mode="html"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:result-document href="{'My_First_Epub/OEBPS/toc.ncx'}">
            <ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1">
                <head>
                    <meta content="test id" name="dtb:uid"/>
                    <meta content="0" name="dtb:totalPageCount"/>
                    <meta content="0" name="dtb:maxPageNumber"/>
                </head>
                <docTitle>
                    <text>Hello World: My First EPUB</text>
                </docTitle>
                <docAuthor>
                    <text>Nick Homenda</text>
                </docAuthor>
            <navMap>
                <navPoint id="navpoint-1" playOrder="1">
                    <navLabel><text>Cover</text></navLabel>
                    <content src="cover.html"/>
                </navPoint>
                <xsl:apply-templates select="div" mode="ncx"/>
                <xsl:apply-templates select="div" mode="html"/>
            </navMap>
            </ncx>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="div" mode="ncx">
        <xsl:variable name="order" select="position()"/>
        <navPoint id="{concat('navpoint-',$order+1)}" playOrder="{$order+1}" xmlns="http://www.daisy.org/z3986/2005/ncx/">
            <navLabel xmlns="http://www.daisy.org/z3986/2005/ncx/"><text xmlns="http://www.daisy.org/z3986/2005/ncx/"><xsl:value-of select="h2"/></text></navLabel>
            <content src="{concat('chap0',$order, '.html')}" xmlns="http://www.daisy.org/z3986/2005/ncx/"/>
        </navPoint>
        
    </xsl:template>
    
</xsl:stylesheet>