<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <!--Размер фотографий в каталоге при выводе таблицей-->
    <xsl:variable name="photoTableCatalogW" select="150" />
    <xsl:variable name="photoTableCatalogH" select="200" />
    <!--Размер фотографий в каталоге в плите-->
    <xsl:variable name="photoCatalogW" select="330" />
    <xsl:variable name="photoCatalogH" select="150" />
    <!--Размер большой фотографии в каталоге-->
    <xsl:variable name="photoCatalogFullW" select="235" />

    <xsl:include href="category.xsl" />
	<xsl:include href="getCategoryList.xsl" />
	<xsl:include href="getObjectsList.xsl" />
	<xsl:include href="object.xsl" />
	<xsl:include href="search.xsl" />

</xsl:stylesheet>