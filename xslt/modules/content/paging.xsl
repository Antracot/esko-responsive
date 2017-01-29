<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet  [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="udata[not(tobegin_link) and toend_link]" mode="paging.words">	
	<a class="jcarousel-control-prev arr_ne" href="{toprev_link}">Туда</a>
	<a class="jcarousel-control-next arr_ne" href="{tonext_link}">Сюда</a>
</xsl:template>

<xsl:template match="udata[tobegin_link and toend_link]" mode="paging.words">
	<a class="jcarousel-control-prev arr_ne" href="{toprev_link}">Туда</a>
	<a class="jcarousel-control-next arr_ne" href="{tonext_link}">Сюда</a>
</xsl:template>

<xsl:template match="udata[tobegin_link and not(toend_link)]" mode="paging.words">
	<a class="jcarousel-control-prev arr_ne" href="{toprev_link}">Туда</a>
	<a class="jcarousel-control-next arr_ne" href="{tonext_link}">Сюда</a>
</xsl:template>

<xsl:template match="udata[items]" mode="paging.numbers">
	<ul class="paging">
        <li class="caption">Страницы</li>
		<xsl:apply-templates select="items" mode="paging.numbers" />
	</ul>
</xsl:template>

<xsl:template match="item" mode="paging.numbers">
    <li><a href="{@link}">
       <xsl:value-of select="." />
    </a></li>
</xsl:template>

<xsl:template match="item[@is-active = '1']" mode="paging.numbers">
	<li><a href="#" class="active"><xsl:value-of select="." /></a></li>
</xsl:template>

</xsl:stylesheet>