<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output omit-xml-declaration="yes" media-type="HTML"/>
    <xsl:template match="CATALOG">

        <html>
            <head>
                <title>Homenda Greenhouses Product Catalog</title>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Common Name</th>
                        <th>Botanical name</th>
                        <th>Plant Hardiness Zone<a
                                href="http://planthardiness.ars.usda.gov/PHZMWeb/">(find the
                                hardiness zone for your area)</a></th>
                        <th>Annual?</th>
                        <th>Appropriate Light</th>
                        <th>Price(per plant)</th>
                        <th>#Avalible</th>
                    </tr>

                    <xsl:apply-templates>
                        <xsl:sort select="COMMON" data-type="text" order="ascending"/>
                    </xsl:apply-templates>
                </table>
            </body>
            <footer><p>created from <a href="https://www.w3schools.com/xml/plant_catalog.xml">XML</a> using FLOWERPOWERXSLT</p></footer>
        </html>
    </xsl:template>

    <xsl:template match="PLANT">

        <tr>
            <td>
                <xsl:value-of select="COMMON"/>
            </td>
            <td>
                <xsl:value-of select="BOTANICAL"/>
            </td>
            <xsl:choose>
                <xsl:when test="ZONE != 'Annual'">
                    <td>
                        <xsl:value-of select="ZONE"/>
                    </td>
                    <td>No</td>
                </xsl:when>
                <xsl:otherwise>
                    <td/>
                    <td>YES</td>
                </xsl:otherwise>
            </xsl:choose>
            <td>
                <xsl:value-of select="LIGHT"/>
            </td>
            <td>
                <xsl:value-of select="PRICE"/>
            </td>
            <td>
                <xsl:value-of select="number(AVAILABILITY)"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
