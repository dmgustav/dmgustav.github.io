<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" method="xml"/>

   <!-- <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>-->

    <xsl:template match="html">
        <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:lang="en">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Lunch Poems</title>
                        <author>Frank O'Hara</author>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>City Lights Books</publisher>
                        <date>1964</date>
                    </publicationStmt>
                    <seriesStmt><p>Pocket Poets Series: Number 19</p></seriesStmt>
                    <notesStmt>
                        <note type="ns">Digital edition created by David Gustavsen for Z656</note>
                    </notesStmt>
                    <sourceDesc>
                        <p>Created using XSLT from an EPUB then edited for consistancy</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <front>
                    <div type="dedication"><p><xsl:value-of select="body/div/p[10]"/></p></div>
                   <div type="preface"> <p><xsl:value-of select="body/div/p[11]"/></p></div>
                </front>
                <body>
                    <schemaSpec ident="myTEI" docLang="en" prefix="tei_" xml:lang="en">
                        <moduleRef key="core" except=""/>
                        <moduleRef key="tei" except=""/>
                        <moduleRef key="header" except=""/>
                        <moduleRef key="textstructure" except=""/>
                        <moduleRef key="namesdates" except=""/>
                        <moduleRef key="verse" except=""/>
                    </schemaSpec>
                    <xsl:apply-templates/>
                </body>
            </text>
        </TEI>
    </xsl:template>
 <xsl:template match="div[@class='newpage']">
     <pb n="{substring-after(@id,'page-')}" xml:id="{concat('p',substring-after(@id,'page-'))}" facs="{concat('../images/', 'p',substring-after(@id,'page-'), '.png')}"></pb>
 </xsl:template>
    
   
    
    <xsl:template match="h1">
       <xsl:variable name="title" select="."/>
        <div type="poem">
            <head><xsl:apply-templates/></head>
            <xsl:for-each select="following-sibling::p[preceding-sibling::h1[1]=$title]">
                <l><xsl:value-of select="."/></l>
            </xsl:for-each>
        </div>
    </xsl:template>
    

<xsl:template match="head|p"/>
    

</xsl:stylesheet>
