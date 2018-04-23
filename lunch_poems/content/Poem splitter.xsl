<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xml:lang="en" exclude-result-prefixes="xs" version="2.0">
    <!--<xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>-->
    <xsl:strip-space elements="*"/>
    <xsl:template match="//tei:div[@type = 'poem']">
        
        <xsl:variable name="order">
            <xsl:value-of select="position()"/>
        </xsl:variable>
        <xsl:result-document href="{concat('/E:/David/Desktop/poems/','poem',$order,'.xml')}">

            <xsl:text disable-output-escaping="yes"></xsl:text>
            <TEI>
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title>Lunch Poems</title>
                            <author>Frank O'Hara</author>
                            <respStmt>
                                <resp>Created using XSLT from EPUB, encoded by </resp>
                                <name>David Gustavsen</name>
                            </respStmt>
                        </titleStmt>
                        <publicationStmt>
                            <publisher>City Lights Books</publisher>
                            <date>1964</date>
                        </publicationStmt>
                        <seriesStmt>
                            <p>Pocket Poets Series: Number 19</p>
                        </seriesStmt>
                        <notesStmt>
                           
                        </notesStmt>
                        <sourceDesc>
                            <p>Created using XSLT from an EPUB then edited for consistancy</p>
                        </sourceDesc>
                    </fileDesc>
                    <encodingDesc>
                        <schemaSpec ident="myTEI" docLang="en" prefix="tei_" xml:lang="en">
                            <moduleRef key="core" except=""/>
                            <moduleRef key="tei" except=""/>
                            <moduleRef key="header" except=""/>
                            <moduleRef key="textstructure" except=""/>
                            <moduleRef key="namesdates" except=""/>
                            <moduleRef key="verse" except=""/>
                        </schemaSpec>
                        <tagsDecl>
                            <tei:rendition xml:id="center" n="tiebp:center" scheme="css"> display:block;
                                text-align:center; margin-left:auto; margin-right:auto; </tei:rendition>
                            <tei:rendition xml:id="itl" n="tiebp:itl" scheme="css"> font-style: italic; </tei:rendition>
                            <tei:rendition xml:id="right" n="teibp:right" scheme="css">
                                text-align:right; </tei:rendition>
                            <tei:rendition xml:id="l-indent-01" n="tiebp:l-indent-01" scheme="css">
                                display:block; padding-left:4em; text-indent:-2em; </tei:rendition>

                            <tei:rendition xml:id="l-indent-02" n="tiebp:l-indent-02" scheme="css">
                                display:block; padding-left:5em; text-indent:-2em; </tei:rendition>

                            <tei:rendition xml:id="l-indent-03" n="tiebp:l-indent-03" scheme="css">
                                display:block; padding-left:10em; text-indent:-2em; </tei:rendition>

                            <tei:rendition xml:id="l-indent-04" n="tiebp:l-indent-04" scheme="css">
                                display:block; padding-left:15em; text-indent:-2em; </tei:rendition>

                            <tei:rendition xml:id="l-indent-05" n="tiebp:l-indent-05" scheme="css">
                                display:block; padding-left:20em; text-indent:-2em; </tei:rendition>

                            <tei:rendition xml:id="l-indent-06" n="tiebp:l-indent-06" scheme="css">
                                display:block; padding-left:25em; text-indent:-2em; </tei:rendition>
                        </tagsDecl>
                    </encodingDesc>
                </teiHeader>
                <text>
                    <body>
                        <xsl:copy-of select="."/>
                    </body>
                </text>
            </TEI>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="l | lg | pb | persName | note | ref | hi"/>

</xsl:stylesheet>
