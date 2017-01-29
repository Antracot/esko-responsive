<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--Количество новстей на главной странице-->
    <xsl:variable name="indexNews" select="6" />
    <!--Формат даты для новостей и блогов-->
    <xsl:variable name="newsDateFormat" select="'d/m/Y'" />
    <!--Формат даты для комментариев-->
    <xsl:variable name="commentDateFormat" select="'d.m.Y%20%D0%B2%20H:i'" />

    <!--Размер фотографий в фотоальбоме-->
    <xsl:variable name="photoW" select="335" />
    <xsl:variable name="photoH" select="170" />

	<xsl:include href="item.xsl" />
	<xsl:include href="lastlents.xsl" />
	<xsl:include href="lastlist.xsl" />
	<xsl:include href="rubric.xsl" />

</xsl:stylesheet>