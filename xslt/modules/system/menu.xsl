<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="udata[@module = 'content' and @method = 'menu']" mode="main">
        <ul class="topmenu">
            <xsl:apply-templates select="items/item" mode="main" />
        </ul>
	</xsl:template>
	
	<xsl:template match="item" mode="main">
        <li>
            <a href="{@link}"><xsl:value-of select="@name"/></a>
        </li>
	</xsl:template>

    <xsl:template match="item[@status = 'active']" mode="main">
        <li>
            <a href="{@link}" class="active"><xsl:value-of select="@name"/></a>
        </li>
    </xsl:template>

</xsl:stylesheet>