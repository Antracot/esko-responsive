<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<!--Обертка списка новостей-->
	<xsl:template match="udata[@module = 'news'][@method = 'lastlist']">
		<xsl:param name="id" select="category_id"/>
		<xsl:param name="noPages" select="0"/>

        <xsl:apply-templates select="items/item" />

		<!--xsl:if test="not($noPages)">
			<xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'/'))/udata" />
		</xsl:if-->
	</xsl:template>
	
	<!--Эллемент списка новостей-->
	<xsl:template match="udata[@method = 'lastlist']/items/item">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="publish_time">
			<xsl:apply-templates select="@publish_time">
				<xsl:with-param name="date_format" select="$newsDateFormat" />
			</xsl:apply-templates>
		</xsl:variable>

        <li umi:region="row" umi:element-id="{@id}" umi:delete-text="&delete-text-news;" umi:delete="delete">
            <a href="{@link}" umi:field-name="name" umi:field-type="string" umi:empty="&empty-page-name;" umi:url-attribute="href">
                <xsl:call-template name="makeThumbnailSqueeze">
                    <xsl:with-param name="element_id" select="@id" />
                    <xsl:with-param name="field_name" select="'anons_pic'" />
                    <xsl:with-param name="width" select="$photoW" />
                    <xsl:with-param name="alt" select="." />
                </xsl:call-template>

                <span>
                    <span class="name"><xsl:value-of select="." disable-output-escaping="yes" /></span>
                    <span class="date" umi:field-name="publish_time" umi:field-type="date" umi:empty="&empty-page-date;"><xsl:value-of select="$publish_time" disable-output-escaping="yes" /></span>
                </span>
            </a>
        </li>
	</xsl:template>

    <xsl:template match="udata[@module = 'news'][@method = 'lastlist']" mode="list_index">
        <xsl:for-each select="items/item[position() mod 3 = 1]">
            <div class="slide">
                <ul class="newslist_m">
                    <xsl:apply-templates select=".|following-sibling::item[position() &lt; 3]" mode="news_index"/>
                </ul>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="udata[@method = 'lastlist']/items/item" mode="news_index">
        <xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
        <xsl:variable name="publish_time">
            <xsl:apply-templates select="@publish_time">
                <xsl:with-param name="date_format" select="$newsDateFormat" />
            </xsl:apply-templates>
        </xsl:variable>

        <li umi:region="row" umi:element-id="{@id}" umi:delete-text="&delete-text-news;" umi:delete="delete">
            <a href="{@link}" umi:field-name="name" umi:field-type="string" umi:empty="&empty-page-name;" umi:url-attribute="href">
                <xsl:value-of select="." disable-output-escaping="yes" />
            </a>

            <div class="date" umi:field-name="publish_time" umi:field-type="date" umi:empty="&empty-page-date;"><xsl:value-of select="$publish_time" /></div>
            <div id="anons_{@id}_{generate-id()}" umi:field-name="anons" umi:field-type="wysiwyg" umi:empty="&empty-page-anons;">
                <xsl:value-of select="$item//property[@name = 'anons']/value" disable-output-escaping="yes" />
            </div>
        </li>
    </xsl:template>
</xsl:stylesheet>