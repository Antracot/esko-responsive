<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'content'][@method = 'notfound']">
        <div class="main-holder events-main-holder">
            <div id="content">
                <xsl:call-template name="not-found"/>
                <xsl:call-template name="sitemap" />
            </div>
        </div>
	</xsl:template>

	<xsl:template name="not-found">
		<div id="page404_text_{generate-id()}" class="content-box">
			&notfound-page;
		</div>
	</xsl:template>

	<xsl:template name="sitemap">
		<div class="content-box sitemap">
			<h2>&sitemap-title;</h2>
			<xsl:apply-templates select="document('udata://content/menu//4')/udata/items" mode="menu">
				<xsl:with-param name="parent" select="." />
			</xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="items" mode="menu">
		<ul>
			<xsl:apply-templates select="item" mode="menu" />
		</ul>
	</xsl:template>

	<xsl:template match="item" mode="menu">
		<li>
			<a href="{@link}">
				<xsl:value-of select="@name" />
			</a>
			<xsl:apply-templates select="items" mode="menu" />
		</li>
	</xsl:template>

</xsl:stylesheet>