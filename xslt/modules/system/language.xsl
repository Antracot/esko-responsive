<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="udata[@module = 'system'][@method = 'getLangsList']">
        <div class="lng-t">
            <xsl:apply-templates select="items/item" />
        </div>
        <!-- end .select-lang-->
    </xsl:template>

    <xsl:template match="udata[@method = 'getLangsList']/items/item">
        <a href="/{@prefix}"><xsl:value-of select="."/></a>
    </xsl:template>

    <xsl:template match="udata[@method = 'getLangsList']/items/item[@is-current = 1]">
        <a href="#" class="active"><xsl:value-of select="."/></a>
    </xsl:template>

</xsl:stylesheet>