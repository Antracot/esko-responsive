<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="udata[@method='getLoginzaProvider']">
        <xsl:choose>
            <xsl:when test="providers/provider/@name = 'facebook'"><li><a href="{widget_url}" class="soc-icon fb-icon loginza"><span></span></a></li></xsl:when>
            <xsl:when test="providers/provider/@name = 'twitter'"><li><a href="{widget_url}" class="soc-icon twitter-icon loginza"><span></span></a></li></xsl:when>
            <xsl:when test="providers/provider/@name = 'vkontakte'"><li><a href="{widget_url}" class="soc-icon vk-icon loginza"><span></span></a></li></xsl:when>
            <xsl:when test="providers/provider/@name = 'odnoklassniki'"><li><a href="{widget_url}" class="soc-icon ok-icon loginza"><span></span></a></li></xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>