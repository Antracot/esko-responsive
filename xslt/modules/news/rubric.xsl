<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'news'][@method = 'rubric']">
        <ul class="news-list">
            <xsl:apply-templates select="document(concat('udata://news/lastlist/',page/@id,'/'))/udata">
                <xsl:with-param name="id" select="page/@id" />
            </xsl:apply-templates>
        </ul>
    </xsl:template>

    <!--Новости на главной странице-->
    <xsl:template match="udata" mode="news_index"/>

    <xsl:template match="udata[total != 0]" mode="news_index">
        <xsl:apply-templates select="page" mode="news_index"/>
    </xsl:template>

    <xsl:template match="page" mode="news_index">
        <div class="slider">
            <xsl:apply-templates select="document(concat('udata://news/lastlist/',@id,'//',$indexNews,'/1/'))/udata" mode="list_index"/>
        </div>
    </xsl:template>

</xsl:stylesheet>