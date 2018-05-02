<!-- Template for footnote references, inline with the text.
    Sets up cross-references to footnote text that appears after
    the document. End every footnote with a '|'character. You can add links after the | and they will only appear in the footnotes
    at the bottom. If you have no links replace "substring-before(.,'|')" with "."-->
	<xsl:template match="tei:note">
		<xsl:variable name="inc">
			<xsl:value-of select="./@n"/>
		</xsl:variable>
		<a href="#fn{$inc}" id="fnref{$inc}" class="fn">
			<sup>
				<xsl:value-of select="./@n"/>
			</sup>
			<span class="footnoteinline"><xsl:value-of select="@n"/>. <xsl:value-of select="substring-before(.,'|')"
			/></span>
		</a>
	</xsl:template>
	
	<!-- Template for footnote text that should appear following
    the document, with cross references back to where the footnote
    originally appears. Remember to add "apply templates mode='endlist'" to your main XSLT spreadsheet -->
	<xsl:template match="tei:note" mode="endlist">
		<xsl:variable name="incr">
			<xsl:number level="any" count="tei:note"/>
		</xsl:variable>
		
		<p>
			
			<sup>
				<a href="#fnref{$incr}" id="fn{$incr}" title="Return to text">
					<xsl:value-of select="@n"/>
				</a>
			</sup>
			<xsl:value-of select="substring-before(.,'|')"/>
			<a href="{./tei:ref/@target}"><xsl:value-of select="./tei:ref"/></a>			
		</p>
	</xsl:template>
