<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<!--Шаблон для страницы конкретной новости-->
    <xsl:template match="result[@module = 'news'][@method = 'item']">
        <div class="text-box">
            <div class="datenews" umi:field-name="publish_time" umi:empty="&empty-page-date;" umi:field-type="date">
                <xsl:apply-templates select=".//property[@name = 'publish_time']">
                    <xsl:with-param name="date_format" select="$newsDateFormat" />
                </xsl:apply-templates>
            </div>

            <div id="page_anons_{$page-id}_{generate-id()}" class="text" umi:element-id="{$page-id}"  umi:field-name="anons" umi:field-type="wysiwyg" umi:empty="&empty-page-anons;">
                <xsl:apply-templates select="//property[@name = 'anons']" />
            </div>

            <div id="page_content_{$page-id}_{generate-id()}" class="text" umi:element-id="{$page-id}"  umi:field-name="content" umi:field-type="wysiwyg" umi:empty="&empty-page-content;">
                <xsl:apply-templates select="//property[@name = 'content']" />
            </div>
        </div>

		<!--Комментарии-->
		<!--xsl:call-template name="comments">
			<xsl:with-param name="url" select="concat('http://',$_http_host, page/@link)" />
		</xsl:call-template-->
		<!--Конец-->
    </xsl:template>

</xsl:stylesheet>