<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="udata[@module = 'search'][@method = 'insert_form']">
        <form action="/search/search_do/" method="get" enctype="multipart/form-data" id="search">
            <input type="text" class="sercinpt"
                   name="search_string"
                   value="{last_search_string}"
                   onfocus="javascript: if(this.value == '{last_search_string}') this.value = '';"
                   onblur="javascript: if(this.value == '') this.value = '{last_search_string}';"/>
            <input  class="submtr" type="submit" value="ok" />
        </form>
        <!-- end .search-->
    </xsl:template>

    <xsl:template match="result[@module = 'search'][@method = 'search_do']">
        <xsl:variable name="search-results" select="document('udata://search/search_do/')/udata" />

        <h1>Поиск по сайту: <xsl:value-of select="$search_string"/></h1>
        <xsl:apply-templates select="$search-results"/>

        <xsl:apply-templates select="document(concat('udata://system/numpages/',
    $search-results/total, '/', $search-results/per_page, '/notemplate/p/3'))/udata" mode="paging.numbers"/>
    </xsl:template>

    <xsl:template match="udata[@module = 'search'][@method = 'search_do'][not(items/item)]">
        <div class="search_message">
            <xsl:text>По запросу </xsl:text>
            <span>&#171;<xsl:value-of select="$search_string" />&#187;</span>
            <xsl:text> ничего не найдено.</xsl:text>
      </div>
    </xsl:template>


    <xsl:template match="udata[@module = 'search'][@method = 'search_do'][items/item]">
        <div class="search_message">
            <xsl:text>Найдено страниц: </xsl:text>
            <xsl:value-of select="total" />
        </div>

        <ul class="search_results">
            <xsl:apply-templates select="items/item" mode="search.results"/>
        </ul>
    </xsl:template>


    <xsl:template match="item" mode="search.results" >
        <li>
            <a href="{@link}">
                <xsl:value-of select="@name"/>
            </a>
            <!--xsl:value-of select="." disable-output-escaping="yes"/-->
        </li>
    </xsl:template>
</xsl:stylesheet>