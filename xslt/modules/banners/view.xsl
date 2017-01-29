<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="udata[@module='custom' and @method='insert']/items/item" mode="scroller">
        <div class = 'slide'>
            <a href="{@banner-url}" title="{./alt}">
                <xsl:if test="./@target">
                    <xsl:attribute name="target">
                        <xsl:value-of select="./@target"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="." disable-output-escaping="yes"/>
            </a>
        </div>
    </xsl:template>
    
    <xsl:template match="udata[@module='custom' and @method='insert']/items/item">        
        <a href="{@banner-url}" title="{./alt}" class="side-ad">
            <xsl:if test="./@target">
                <xsl:attribute name="target">
                    <xsl:value-of select="./@target"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="." disable-output-escaping="yes"/>
        </a>
    </xsl:template>  

</xsl:stylesheet>