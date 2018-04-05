<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" method="xml"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="html">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="p[position() > 12]">
        <l>
            <xsl:apply-templates/>
        </l>
    </xsl:template>

<xsl:template match="head|p[10 > position()]"/>
    

</xsl:stylesheet>
