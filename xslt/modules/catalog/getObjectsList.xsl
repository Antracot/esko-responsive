<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="udata[@module = 'catalog'][@method = 'getObjectsList' or @method = 'getObjectsListFull']"/>
	
	<xsl:template match="udata[@module = 'catalog'][@method = 'getObjectsList' or @method = 'getObjectsListFull'][total]">
        <xsl:apply-templates select="lines/item" mode="simple_catalog"/>
	</xsl:template>

    <xsl:template match="udata[@method = 'getObjectsList' or @method = 'getObjectsListFull']/lines/item|page" mode="simple_catalog">
        <xsl:variable name="model" select="document(concat('uobject://', @id))/udata" />
        <xsl:variable name="class">
            <xsl:if test="position() = 1">active</xsl:if>
        </xsl:variable>
        <!--h3 class="cliashtrs">
            <a href="#" class="active" attt-box="#boxc{position()}">
                <xsl:value-of select="$model//@name" disable-output-escaping="yes" />
            </a>
        </h3-->

        <div class="tabscat {$class}" id="boxc{position()}">
            <ul class="news-list olistr">
                <xsl:apply-templates select="model" mode="simple_catalog"/>
            </ul>
        </div>
    </xsl:template>

	<!--Простой список товаров-->
	<xsl:template match="udata[@method = 'getObjectsList' or @method = 'getObjectsListFull']/lines/item/model" mode="simple_catalog">
		<xsl:variable name="page" select="document(concat('upage://',@id))/udata/page" />
		<li class="simple_catalog_item objectlist" umi:region="row" umi:element-id="{@id}" umi:delete="delete" umi:delete-text="&delete-text-catalog-object;">
            <a href="{@link}" umi:field-name="name" umi:field-type="string" umi:empty="&empty-name;" umi:url-attribute="href">
                <div class="img"><xsl:call-template name="makeThumbnailSqueeze">
                    <xsl:with-param name="element_id" select="@id" />
                    <xsl:with-param name="field_name" select="'header_pic'" />
                    <xsl:with-param name="width" select="$photoCatalogW" />

                    <xsl:with-param name="alt" select="." />
                    <xsl:with-param name="no-empty-image" select="0" />
                </xsl:call-template></div>
                <span>
                    <span class="name"><xsl:value-of select="$page/name" disable-output-escaping="yes" /></span>
                    <xsl:if test="$page//property[@name = 'core_power_max']/value">
                        <span style="font-size:12px;text-align:left;">Мощность (кВт): <xsl:if test="$page//property[@name = 'core_power_min']/value"><xsl:value-of select="$page//property[@name = 'core_power_min']/value" />-</xsl:if>
                        <xsl:value-of select="$page//property[@name = 'core_power_max']/value" /></span>
                    </xsl:if>
                    <xsl:if test="$page//property[@name = 'control_type']/value">
                        <span style="font-size:11px;text-align:left;"><xsl:value-of
                                select="$page//property[@name = 'control_type']/title"/>: <xsl:value-of select="$page//property[@name = 'control_type']/value/item/@name" /></span>
                    </xsl:if>
                    <xsl:if test="$page//property[@name = 'core_power']/value">
                        <span style="font-size:13px;text-align:left;"><xsl:value-of
                                select="$page//property[@name = 'core_power']/title"/>: <strong><xsl:value-of select="$page//property[@name = 'core_power']/value" /></strong></span>
                    </xsl:if>
                </span>
            </a>
			<div id="desc_{@id}_{generate-id()}" class="desc text" umi:field-name="desc" umi:field-type="wysiwyg" umi:empty="&empty-desc;" >
				<xsl:value-of select="$page//property[@name = 'desc']/value" disable-output-escaping="yes"/>
			</div>
		</li>
	</xsl:template>
	
	<!--Списки товаров для интернет магазина-->
	<xsl:template match="udata[@method = 'getObjectsList' or @method = 'getObjectsListFull']/lines/item">
		<xsl:apply-templates select="." mode="simple_shop_catalog"/>
	</xsl:template>
	
	<xsl:template match="item|page" mode="simple_shop_catalog">
		<xsl:variable name="page" select="document(concat('upage://',@id))/udata/page" />
        <xsl:variable name="stores_state" select="$page//property[@name = 'stores_state']/value/option/@int"/>
        <xsl:if test="$stores_state &gt; 0">
            <li umi:region="row" umi:element-id="{@id}" umi:delete="delete" umi:delete-text="&delete-text-catalog-object;">
                <xsl:attribute name="class">
                    <xsl:if test="@is-active">objectlist cat-item-active</xsl:if>
                    <xsl:if test="not(@is-active)">objectlist cat-item-inactive</xsl:if>
                </xsl:attribute>
                <xsl:if test="$сatalogTitle">
                    <div class="object_title">
                        <a href="{@link}" umi:field-name="name" umi:field-type="string" umi:empty="&empty-name;">
                            <xsl:value-of select="$page/name" disable-output-escaping="yes" />
                        </a>
                    </div>
                    <div class="prefix" umi:field-name="prefix" umi:field-type="string" umi:empty="&empty-prefix;" >
                        <xsl:value-of select="$page//property[@name = 'prefix']/value" />
                    </div>
                </xsl:if>
                <a href="{@link}" class="object_item" umi:url-attribute="href">
                    <xsl:call-template name="makeThumbnailSqueeze">
                        <xsl:with-param name="element_id" select="@id" />
                        <xsl:with-param name="field_name" select="'photo'" />
                        <xsl:with-param name="width" select="$photoCatalogW" />
                        <xsl:with-param name="height" select="$photoCatalogH" />
                        <xsl:with-param name="alt" select="." />
                        <xsl:with-param name="no-empty-image" select="0" />
                    </xsl:call-template>
                </a>
                <xsl:if test="not($сatalogTitle)">
                    <div class="object_title">
                        <a href="{@link}" umi:field-name="name" umi:field-type="string" umi:empty="&empty-name;">
                            <xsl:value-of select="$page/name" disable-output-escaping="yes" />
                        </a>
                    </div>
                    <div class="prefix" umi:field-name="prefix" umi:field-type="string" umi:empty="&empty-prefix;" >
                        <xsl:apply-templates select="document(concat('upage://',@id,'.prefix'))/udata/property[value]" />
                    </div>
                </xsl:if>

                <input type="hidden" id="stored_{@id}" value="{$stores_state}" />

                <xsl:variable name="old_price" select="$page//property[@name = 'old_price']/value" />
                <xsl:variable name="price" select="$page//property[@name = 'price']/value" />

                <div class="price">
                    <span class="price_value" umi:field-name="price" umi:field-type="price" umi:empty="&empty-price;">
                        <xsl:apply-templates select="$price" />
                    </span>
                </div>
            </li>
        </xsl:if>
	</xsl:template>

</xsl:stylesheet>