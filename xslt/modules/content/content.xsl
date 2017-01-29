<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="result[@module = 'content'][@method = 'content']">
        <div class="text-box">
            <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>

            <xsl:if test=".//property[@name = 'razdel_kataloga']/value">
                <xsl:apply-templates select="document(concat('udata://catalog/getObjectsListFull/null/', .//property[@name = 'razdel_kataloga']/value/page/@id))/udata" />
            </xsl:if>

            <xsl:if test="contains($request-uri, 'compare')">
                <xsl:apply-templates select="document('udata://emarket/compare/notemplate/(system_options)')/udata" />
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="udata[@module = 'emarket'][@method = 'compare']">
        <xsl:variable name="fields" select="fields/field" />
        <xsl:if test="count($fields)">
            <table width="100%" border="0" class="tableSrav" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="modssrv">продукт</td>
                    <xsl:for-each select="$fields[values]">
                        <td><xsl:value-of select="@title"/></td>
                    </xsl:for-each>
                    <td>&nbsp;</td>
                </tr>
                <xsl:for-each select="headers/items/item">
                    <xsl:variable name="productId" select="@id" />
                    <xsl:variable name="deleteLink" select="document(concat('udata://emarket/getCompareLink/', @id))/udata/del-link" />
                    <tr>
                        <td class="modssrv">
                            <a href="{@link}">
                                <xsl:call-template name="makeThumbnailSqueeze">
                                    <xsl:with-param name="element_id" select="@id" />
                                    <xsl:with-param name="field_name" select="'header_pic'" />
                                    <xsl:with-param name="width" select="$photoTableCatalogW" />
                                    <xsl:with-param name="alt" select="." />
                                    <xsl:with-param name="no-empty-image" select="0" />
                                </xsl:call-template>
                                <p><xsl:value-of select="."/></p>
                            </a>
                        </td>
                        <xsl:for-each select="$fields[values]">
                            <td>
                                <xsl:choose>
                                    <xsl:when test="@type = 'relation'"><xsl:value-of select="values/item[@id = $productId]/value/value/item/@name" /></xsl:when>
                                    <xsl:when test="@type = 'optioned'">
                                        <xsl:for-each select="values/item[@id = $productId]/value/value/option">
                                            <p><xsl:value-of select="object/@name"/> - <xsl:value-of select="@float"/></p>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise><xsl:value-of select="values/item[@id = $productId]/value/value" /></xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </xsl:for-each>
                        <td>
                            <p><a href="{$deleteLink}">X</a></p>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:if>
        <xsl:if test="not(count($fields))">
            <h1 class="titleh1">Не выбраны товары для сравнения.</h1>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
