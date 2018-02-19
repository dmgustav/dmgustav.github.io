<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" indent="yes"/>
    
    
    <!-- <xsl:variable name="playername"><xsl:value-of select="concat(./@first,' ',./@last,' # ',./@num)"/></xsl:variable>--> 
    <!--<xsl:variable name="playername" select="concat(@first,' ',@last,' # ',@num)"></xsl:variable> -->
   <!-- <xsl:variable name="playername"><xsl:copy-of select="concat(@first,' ',@last,' # ',@num)"></xsl:copy-of></xsl:variable>-->
    
    
    <xsl:template match="game">
       
        <html>
            <head>
                <title><xsl:value-of select="team[1]/@name"/> vs <xsl:value-of select="team[2]/@name"/> <xsl:value-of select="@date"/></title>
                <link rel="stylesheet" type="text/css" href="mlb.css"></link>
            </head>
            <body>
                <h1>The <xsl:value-of select="team[1]/@name"/> vs The <xsl:value-of select="team[2]/@name"/> at <xsl:value-of select="@venue"/> on <xsl:value-of select="@date"/></h1>
                <xsl:apply-templates/>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="team">
        <h2><xsl:value-of select="@name"/> (<xsl:value-of select="@type"/>)</h2>
        <h3>Batter Stats for <xsl:value-of select="@name"/></h3>
        <table>
            <tr><th>Player</th> <th>Position</th> <th>Starting Batting Order</th> <th>Batting Average</th><th>Home Runs</th> <th>RBI</th>
            </tr>
            <xsl:apply-templates select="player[@position!='P']">
                <xsl:sort select="@last" data-type="text" order="ascending"></xsl:sort>
            </xsl:apply-templates>
        </table>
        <p/>
        <h3>Pitcher Stats for <xsl:value-of select="@name"/></h3>
        <table>
            <tr><th>Player</th> <th>Batting Average</th> <th>Home Runs</th> <th>RBI</th> <th>Earned Run Average</th>
            </tr>
            <xsl:apply-templates select="player[@position='P']">
                <xsl:sort select="@last" data-type="text" order="ascending"></xsl:sort>
            </xsl:apply-templates>
        </table>
        <footer><p>Compiled from <a href="http://gd2.mlb.com/components/game/mlb/year_2011/month_04/day_04/gid_2011_04_04_minmlb_nyamlb_1/players.xml">xml data</a> using <a href="/MLBXSLT.xml">MLBXSLT</a>. Background image copyright realtor.com </p></footer>
    </xsl:template>
    
    <xsl:template match="player[@position!='P']">
        <xsl:variable name="playername"><xsl:value-of select="concat(@first,' ',@last,' #',@num)"/></xsl:variable>
        <tr>
            <td>
                <xsl:value-of select="$playername"/>
                <!--<xsl:value-of select="concat(@first,' ',@last,' # ',@num)"/>-->
            </td>
            <td><xsl:choose>
                <xsl:when test="@position='D'">Designated Hitter</xsl:when>
                <xsl:when test="@position='RF'">Right Fielder</xsl:when>
                <xsl:when test="@position='LF'">Left Fielder</xsl:when>
                <xsl:when test="@position='CF'">Center Fielder</xsl:when>
                <xsl:when test="@position='1B'">1st Baseman</xsl:when>
                <xsl:when test="@position='2B'">2nd Baseman</xsl:when>
                <xsl:when test="@position='3B'">3rd Baseman</xsl:when>
                <xsl:when test="@position='SS'">Short Stop</xsl:when>
                <xsl:when test="@position='C'">Catcher</xsl:when>
            </xsl:choose></td>
            <td><xsl:value-of select="@bat_order"/></td>
            <td><xsl:value-of select="@avg"/></td>
            <td><xsl:value-of select="@hr"/></td>
            <th><xsl:value-of select="@rbi"/></th>
        </tr>
    </xsl:template>
    <xsl:template match="player[@position='P']">
        <xsl:variable name="playername"><xsl:value-of select="concat(@first,' ',@last,' #',@num)"/></xsl:variable>
        <tr>
            <td><!--<xsl:value-of select="concat(@first,' ', @last,' #',@num)"/>-->
            <xsl:value-of select="$playername"/>
            </td>
            <td><xsl:choose><xsl:when test="@avg!='.000'"><xsl:value-of select="@avg"/></xsl:when>
                <xsl:when test="@avg='.000'">-</xsl:when></xsl:choose></td>
            <td><xsl:choose><xsl:when test="@avg!='.000'"><xsl:value-of select="@hr"/></xsl:when><xsl:when test="@avg='.000'">-</xsl:when></xsl:choose></td>
            <th><xsl:choose><xsl:when test="@rbi!='0'"><xsl:value-of select="@rbi"/></xsl:when>
                <xsl:when test="@rbi='0'">-</xsl:when></xsl:choose></th>
            <td><xsl:value-of select="@era"/></td>
        </tr>
    </xsl:template>
    
    
</xsl:stylesheet>
