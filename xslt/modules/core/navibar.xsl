<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:param name="param0" />

    <xsl:template match="udata[@module = 'core'][@method = 'navibar']">
        <ul class="navibar">
            <xsl:apply-templates select="items/item" mode="navibar"/>
            <xsl:choose>
                <xsl:when test="$module = 'users'">
                    <xsl:if test="$method = 'settings'">&private_office;</xsl:if>
                    <xsl:if test="$method = 'login'">&authorization;</xsl:if>
                </xsl:when>
            </xsl:choose>
        </ul>
    </xsl:template>

    <xsl:template match="item" mode="navibar">
        <li><a href="{@link}"><xsl:value-of select="."/></a>/</li>
    </xsl:template>

    <xsl:template match="item[position() = last()]" mode="navibar">
        <li><xsl:value-of select="."/></li>
    </xsl:template>

</xsl:stylesheet>