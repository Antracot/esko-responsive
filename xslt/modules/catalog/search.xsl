<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="udata[@method = 'search' or @method = 'customSearch']">
        <div class="boxFilter">
            <div class="wpcF">
                <img src="{$template-resources}/images/arr_bottom_cat.png" class="arrbottom" />
                <div class="filtertitlre">
                    <h3><span>поиск по каталогу</span></h3>
                </div>
                <div class="bodyFilter">
                    <div class="box1FilterB">
                        <xsl:for-each select="document('udata://content/menu/notemplate/0/katalog')/udata/items/item">
                            <a href="{@link}">
                                <span attt-box="#tbs1s">
                                    <xsl:attribute name="class">
                                        <xsl:if test="@status = 'active' and not($method = 'object')">active</xsl:if>
                                    </xsl:attribute>
                                    <xsl:value-of select="." disable-output-escaping="yes"/>
                                </span>
                            </a>
                        </xsl:for-each>
                    </div>

                    <xsl:apply-templates select="group" mode="search"/>
                </div>
            </div>
        </div>
	</xsl:template>
	
	<xsl:template match="group" mode="search"/>

	<xsl:template match="group[count(field/values/item) &gt; 0]" mode="search">
        <div class="tabsFilter" id="tbs1s">
            <form class="formFilterM" id="catalog_filters" method="get" action="">
                <xsl:apply-templates select="field" mode="search" />

                <input class="submtryf" type="submit" value="&apply;" />
            </form>
        </div>
	</xsl:template>

	<xsl:template match="field" mode="search" />

	<xsl:template match="field[@data-type = 'relation']" mode="search">
		<xsl:if test="count(values/item) != 0">
            <div class="tmf{position()}" id="{@name}">
                <h3><xsl:value-of select="@title" disable-output-escaping="yes" /></h3>
                <xsl:choose>
                    <xsl:when test="count(values/item) &gt; 6">
                        <div class="chkbox"><xsl:apply-templates select="values/item" mode="search-box-complex"/></div>
                    </xsl:when>
                    <xsl:otherwise><xsl:apply-templates select="values/item" mode="search-box-simple" /></xsl:otherwise>
                </xsl:choose>
            </div>
		</xsl:if>
	</xsl:template>

    <xsl:template match="field[@data-type = 'string' or @data-type = 'int' or @data-type = 'float' or @data-type = 'price' or @data-type = 'text' or @data-type = 'wysiwyg']" mode="search">
        <div class="tmf{position()}" id="{@name}">
            <h3><xsl:value-of select="@title" disable-output-escaping="yes" /></h3>
            <div style="margin-bottom:5px">Min&nbsp; <input type="text" style="width:60px" name="fields_filter[{@name}][0]" value="{value_from}" /> кВт</div>
            <div>Max <input type="text" style="width:60px" name="fields_filter[{@name}][1]" value="{value_to}" /> кВт</div>
        </div>
    </xsl:template>

	<xsl:template match="item" mode="search">
		<a class="filter_anchor" id="set_{../../@name}" href="?fields_filter[{../../@name}]={@id}">
			<xsl:value-of select="." disable-output-escaping="yes" />
		</a>
		<xsl:if test="position() != last()">
			<xsl:text> | </xsl:text>
		</xsl:if>
	</xsl:template>

    <xsl:template match="item" mode="search-box-complex">
        <span class="chrkeit">
            <input id="isf{generate-id()}" type="checkbox" name="fields_filter[{../../@name}][]" value="{@id}">
                <xsl:if test="@selected or checked">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>
            <label for="isf{generate-id()}"><xsl:value-of select="." disable-output-escaping="yes" /></label>
        </span>
    </xsl:template>

    <xsl:template match="item" mode="search-box-simple">
        <div>
            <input id="isf{generate-id()}" type="checkbox" name="fields_filter[{../../@name}][]" value="{@id}">
                <xsl:if test="@selected or checked">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>
            <label for="isf{generate-id()}"><xsl:value-of select="." disable-output-escaping="yes" /></label>
        </div>
    </xsl:template>

	<xsl:template match="item" mode="search-select">
		<option value="{@id}"><xsl:value-of select="." disable-output-escaping="yes" /></option>
	</xsl:template>

	<xsl:template match="item[@selected]" mode="search-select">
		<option value="{@id}" selected="selected"><xsl:value-of select="." disable-output-escaping="yes" /></option>
	</xsl:template>

	<xsl:template match="item[@selected]" mode="search-select-control">
		<span class="filter_anchor act">
			<xsl:value-of select="." disable-output-escaping="yes" />
		</span>
		<xsl:if test="position() != last()">
			<xsl:text> | </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="item[@selected]" mode="search-сontrol">
		<input type="hidden" id="field_{../../@name}" name="fields_filter[{../../@name}]" value="{@id}" />
	</xsl:template>

</xsl:stylesheet>