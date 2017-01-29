<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="udata[@module = 'catalog'][@method = 'getCategoryList' or @method = 'getCategoryListFull']" />

	<xsl:template match="udata[@module = 'catalog'][@method = 'getCategoryList' or @method = 'getCategoryListFull'][total]">
        <ul class="cat-list o-listr">
            <xsl:apply-templates select="items/item" />
        </ul>
	</xsl:template>

    <xsl:template match="udata[@module = 'catalog'][@method = 'getCategoryList' or @method = 'getCategoryListFull'][total]" mode="inner">
        <xsl:apply-templates select="items/item" mode="inner" />
    </xsl:template>

    <xsl:template match="udata[@method = 'getCategoryList' or @method = 'getCategoryListFull']/items/item" mode="inner">
		<a href="{@link}" class="itemolist" umi:field-name="name" umi:field-type="string" umi:empty="&empty-section-name;" umi:url-attribute="href">
            <xsl:value-of select="." disable-output-escaping="yes" />
        </a>
    </xsl:template>

	<xsl:template match="udata[@method = 'getCategoryList' or @method = 'getCategoryListFull']/items/item">
    <xsl:variable name="page" select="document(concat('upage://',@id))/udata/page" />
		<li umi:region="row" umi:element-id="{@id}" umi:delete="delete" umi:delete-text="&delete-text-catalog;">
            <a href="{@link}" umi:field-name="name" umi:field-type="string" umi:empty="&empty-section-name;" umi:url-attribute="href">
            <div class="img"><xsl:call-template name="makeThumbnailSqueeze">
                    <xsl:with-param name="element_id" select="@id" />
                    <xsl:with-param name="field_name" select="'header_pic'" />
                    <xsl:with-param name="width" select="$photoCatalogW" />

                    <xsl:with-param name="alt" select="." />
                    <xsl:with-param name="no-empty-image" select="0" />
                </xsl:call-template></div>
                
                <div class="plaska-main">
                    <div class="name-prod"><xsl:value-of select="." disable-output-escaping="yes" /></div>
                </div> 
            </a>
           
            <xsl:if test="$page-id = 4562">
                <div style="padding:10px;background:#dce4e8; height:64px;"><xsl:value-of select="$page//property[@name = 'kratkoe_opisanie_kategorii']/value"/></div>
            </xsl:if>
            <xsl:apply-templates select="document(concat('udata://catalog/getCategoryListFull/null/', @id, '/100500/'))/udata" mode="inner"/>
            
		</li>
	</xsl:template>

</xsl:stylesheet>