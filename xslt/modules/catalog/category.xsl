<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<!--Каталог товаров и услуг-->
	<xsl:template match="result[@module = 'catalog'][@method = 'category']">
		<div id="descr_{$page-id}_{generate-id()}" class="text" umi:element-id="{$page-id}" umi:field-name="descr" umi:field-type="wysiwyg" umi:empty="&empty-page-content;">
			<xsl:apply-templates select="//property[@name = 'descr']" />
		</div>

        <xsl:apply-templates select="." mode="simple_catalog"/>

        <xsl:apply-templates select="//property[@name = 'content_after']" />
	</xsl:template>
        
    

    <!--Простой каталог-->
    <xsl:template match="result[@module = 'catalog'][@method = 'category']" mode="simple_catalog">
        <xsl:variable name="depth">
            <xsl:choose>
                <xsl:when test="contains($request-uri, 'fields_filter')"><xsl:value-of select="'-1'"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="'0'" /></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="not(contains($request-uri, 'fields_filter'))">
            <xsl:apply-templates select="document(concat('udata://catalog/getCategoryListFull/null/', $page-id, '/100500/'))/udata" />
        </xsl:if>
        <xsl:apply-templates select="document(concat('udata://catalog/getObjectsListFull/null/', $page-id, '///', $depth))/udata" />
        <xsl:apply-templates select="document(concat('udata://webforms/add/', 142))/udata" mode="forms"/>
            <script type="text/javascript">
                <xsl:text>

                $(".o-listr li").mouseover(function() {
                    var $this = $(this).find('.itemolist');    
                    $this.fadeIn(700).css('opacity', '1').css();
                });
                 $(".o-listr li").mouseout(function() {
                    var $this = $(this).find('.itemolist');    
                    $this.css('opacity', '0');
                });


                </xsl:text>
            </script>     
    </xsl:template>


</xsl:stylesheet>


