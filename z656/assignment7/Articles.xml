<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:variable name="meta_journal"><xsl:value-of select="/journal_issue/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/title"/></xsl:variable>
    <xsl:variable name="meta_date"><xsl:value-of select="/journal_issue/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/imprint/dat"/></xsl:variable>

    <xsl:template match="//div[@type = 'scholarlyArticle']">
        <xsl:variable name="articleno"><xsl:value-of select="position() div 2"/></xsl:variable>
        <xsl:result-document href="{concat('/E:/David/Desktop/articles/',$articleno,'.html')}">
        <html>
            <head>
                <title>
                    <xsl:value-of select="head"/>
                </title>
                <link rel="stylesheet" type="text/css" href="indiana_magazine.css"/>
            </head>
            <body>
                <div>
                    <h1><xsl:value-of select="concat($meta_journal, ', ',$meta_date)"/></h1>
                <xsl:apply-templates/>
                </div>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="head">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="p">
        <xsl:apply-templates select="note"/>
        
        <xsl:copy>
            <xsl:apply-templates select="node() except note"/>
        </xsl:copy>
        
    </xsl:template>
    <!--<xsl:template match="p">    
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>-->
    <xsl:template match="hi|quote">
        <xsl:variable name="rend">
            <xsl:value-of select="@rend"/>
        </xsl:variable>
        <span class="{$rend}">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="note">
        <div class="subhead">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="teiHeader"/>
</xsl:stylesheet>
