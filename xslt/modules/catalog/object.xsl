<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:decimal-format decimal-separator="." grouping-separator=" "/>
    <xsl:decimal-format name="us_default"/>

    <xsl:template match="result[@module = 'catalog'][@method = 'object']">
		<xsl:variable name="old_price" select="//property[@name = 'old_price']/value" />
		<xsl:variable name="catalog_option_props" select="//group[@name = 'system_options']" />
		<xsl:variable name="catalog_additional_options" select="//group[@name = 'additional_options']" />
        <xsl:variable name="stores_state" select="//property[@name = 'stores_state']/value/option/@int"/>

        <div class="ofvbix">
            <div class="imgbox-dir">
                <a class="object_image_a group" title="{page/name}" href="{//property[@name = 'header_pic']/value}" rel="{page/@alt-name}" umi:url-attribute="href">
                    <xsl:if test="not(//property[@name = 'header_pic']/value)">
                        <xsl:attribute name="href">&empty-photo;</xsl:attribute>
                    </xsl:if>
                    <xsl:call-template name="makeThumbnailSqueeze">
                        <xsl:with-param name="element_id" select="$page-id" />
                        <xsl:with-param name="field_name" select="'header_pic'" />
                        <xsl:with-param name="width" select="$photoCatalogFullW" />
                        <xsl:with-param name="alt" select="//property[@name = 'h1']/value" />
                    </xsl:call-template>
                </a>
            </div>
            <div class="opis-dir-box">
                <h1 class="titleh1 tovarname"><xsl:value-of select=".//property[@name = 'h1']/value" disable-output-escaping="yes"/></h1>
                <xsl:if test="page/@type-id != 136">
                    <xsl:apply-templates select="$catalog_additional_options" mode="catalog_add_opt_props"/>
                </xsl:if>
                <xsl:if test="./parents/page[2]/@id = 4788">
                    <xsl:variable name="priceBlock" select="document(concat('udata://custom/getOptionedPrice//', .//property[@name = 'price_burner']/value/option[1]/object/@id))/udata" />

                    <div class="prices">
                        <span class="totalBlock">
                            <strong class="totalPrice">Стоимость оборудования:</strong>
                            <xsl:choose>
                                <xsl:when test="$priceBlock/discount > 0">
                                    <em><xsl:value-of select="$priceBlock/total" /> руб.</em>
                                    <span><xsl:value-of select="$priceBlock/total_dis" /></span> руб.
                                </xsl:when>
                                <xsl:otherwise><span><xsl:value-of select="$priceBlock/total" /></span> руб.</xsl:otherwise>
                            </xsl:choose><br />

                            в т.ч.<br />
                        </span>

                        <strong class="burnerPrice">корпус горелки:</strong>
                        <xsl:choose>
                            <xsl:when test="$priceBlock/discount > 0">
                                <em><xsl:value-of select="$priceBlock/burner" /> руб.</em>
                                <span><xsl:value-of select="$priceBlock/burner_dis" /></span> руб.
                            </xsl:when>
                            <xsl:otherwise><span><xsl:value-of select="$priceBlock/burner" /></span> руб.</xsl:otherwise>
                        </xsl:choose><br />
                        <xsl:if test=".//property[@name = 'fuel_type']/value/item/@id != 1027">
                            <span class="rampBlock">
                                <strong class="rampPrice">газовая рампа с адаптером:</strong>
                                <xsl:choose>
                                    <xsl:when test="$priceBlock/discount > 0">
                                        <em><xsl:value-of select="$priceBlock/ramp" /> руб.</em>
                                        <span><xsl:value-of select="$priceBlock/ramp_dis" /></span> руб.
                                    </xsl:when>
                                    <xsl:otherwise><span><xsl:value-of select="$priceBlock/ramp" /></span> руб.</xsl:otherwise>
                                </xsl:choose>
                            </span>
                        </xsl:if>
                    </div>                    
                </xsl:if>
            </div>
        </div>

		<div class="object" umi:element-id="{$page-id}">
			<!-- Опциональные Свойства -->
            <xsl:apply-templates select="$catalog_option_props" mode="catalog_opt_props"/>

			<!--Основное описание-->
			<div class="text" id="description_{$page-id}_{generate-id()}" umi:element-id="{$page-id}" umi:field-name="description" umi:field-type="wysiwyg" umi:empty="&empty-page-content;">
				<xsl:apply-templates select="//property[@name = 'description']" />
			</div>
			<!--Конец-->
		</div>

        <xsl:variable name="compareLink" select="document(concat('udata://emarket/getCompareLink/', $page-id))/udata" />
        <xsl:variable name="compareList" select="document('udata://emarket/getCompareList')/udata" />

        <div class="txtalgrightdf">
            <a href="{$compareLink/add-link}" class="sravtovare">добавить к сравнению</a>
            <xsl:if test="count($compareList/items/item) &gt; 0">
                <a href="/compare-products/" class="sravtovare">сравнить (<xsl:value-of select="count($compareList/items/item)" />)</a>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="page/@type-id = 148"><a href="#lease" class="zformonlinet">аренда</a><a href="#sell" class="zformonlinet">продажа</a></xsl:when>
                <xsl:otherwise><a href="#formBOxw23" class="zformonlinet">заказать</a></xsl:otherwise>
            </xsl:choose>
        </div>

        <xsl:apply-templates select="document(concat('udata://webforms/add/', 141))/udata" mode="forms"/>
        <xsl:if test="page/@type-id = 148">
            <xsl:apply-templates select="document(concat('udata://webforms/add/', 151))/udata" mode="forms"/>
            <xsl:apply-templates select="document(concat('udata://webforms/add/', 152))/udata" mode="forms"/>
        </xsl:if>
		
		<xsl:if test="page/@type-id = 148">
           <xsl:value-of select="//property[@name = 'descnew']" disable-output-escaping="yes" />
           <div style="clear:both"></div>
        </xsl:if>

        <!--Сопутствующие товары-->
        <xsl:apply-templates select="document('udata://custom/getObjectWithParamsList/extra_goods')/udata"/>
        <!--Конец-->
	</xsl:template>

    <!--Сопутствующие товары-->
    <xsl:template match="udata[@module = 'custom'][@method = 'getObjectWithParamsList']" />
    <xsl:template match="udata[@module = 'custom'][@method = 'getObjectWithParamsList'][total != 0]">
        <div class="boxTovzPok">
            <h3>C ЭТИМ товаром ТАКЖЕ ПОКУПАЮТ:</h3>
            <div class="iosslider233">
                <div class="slider">
                    <xsl:apply-templates select="items/item[not(@id = $page-id)]" />
                </div>
            </div>
            <a class="prevSlidersT"><img src="{$template-resources}images/right_arr_sl.png" alt="" title="" /></a>
            <a class="nextSlidersT"><img src="{$template-resources}images/left_arr_sl.png" alt="" title="" /></a>
        </div>
    </xsl:template>

    <xsl:template match="udata[@method = 'getObjectWithParamsList']/items/item">
        <div class="slide">
            <a href="{@link}">
                <xsl:call-template name="makeThumbnailSqueeze">
                    <xsl:with-param name="element_id" select="@id" />
                    <xsl:with-param name="field_name" select="'header_pic'" />
                    <xsl:with-param name="width" select="$photoTableCatalogW" />

                    <xsl:with-param name="alt" select="." />
                    <xsl:with-param name="no-empty-image" select="0" />
                </xsl:call-template>
                <span><xsl:value-of select="." disable-output-escaping="yes" /></span>
            </a>
        </div>
    </xsl:template>

    <!-- Дополнительные свойства -->
    <xsl:template match="group" mode="catalog_add_opt_props">
        <table width="100%" border="0" class="litmAttra">
            <xsl:apply-templates select="./property" mode="catalog_opt_props">
                <xsl:with-param name="class" select="'nametrsd'" />
            </xsl:apply-templates>
        </table>
    </xsl:template>

    <!-- Опциональные свойства -->
	<xsl:template match="group" mode="catalog_opt_props">
        <table width="100%" class="attrfulltre" cellpadding="0" cellspacing="0">
            <xsl:if test="./property[contains(@name, 'core_power_max')]">
                <tr>
                    <td class="namertyr">Мощность, кВт</td>
                    <td>
                        <div class="opt_prop">
                            <span class="opt_prop_rel">
                                MIN
                            </span>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="./property[@name = 'core_power_min']/value" />
                        </div>
                        <div class="opt_prop">
                            <span class="opt_prop_rel">
                                MAX
                            </span>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="./property[@name = 'core_power_max']/value" />
                        </div>
                    </td>
                </tr>
            </xsl:if>
            <xsl:apply-templates select="./property[contains(@name, 'ramp_gear')]" mode="catalog_opt_props" />
            <xsl:if test="./property[contains(@name, 'work_pressure')]">
                <tr>
                    <td class="namertyr">Раб. давл. газа, бар</td>
                    <td>
                        <div class="opt_prop">
                            <span class="opt_prop_rel">
                                MIN
                            </span>
                            <xsl:text> - </xsl:text>
                            <span class="min_work_pressure"><xsl:value-of select="./property[@name = 'min_work_pressure']/value/item[1]/@name" /></span>
                        </div>
                        <div class="opt_prop">
                            <span class="opt_prop_rel">
                                MAX
                            </span>
                            <xsl:text> - </xsl:text>
                            <span class="max_work_pressure"><xsl:value-of select="./property[@name = 'max_work_pressure']/value/item[1]/@name" /></span>
                        </div>
                    </td>
                </tr>
            </xsl:if>
			<xsl:apply-templates select="./property[not(contains(@name, 'core_power_') or contains(@name, 'work_pressure') or contains(@name, 'ramp_gear'))]" mode="catalog_opt_props" />
			<xsl:if test="not(./property[@name = 'delivery']/value)">
                <tr>
                    <td class="namertyr">ДОСТАВКА:</td>
                    <td style="font-weight:normal">САМОВЫВОЗ. ВОЗМОЖНА ДОСТАВКА ТРАНСПОРТНОЙ<br />КОМПАНИЕЙ ПО СОГЛАСОВАНИЮ С МЕНЕДЖЕРОМ.</td>
                </tr>
            </xsl:if>
		</table>
	</xsl:template>

    <xsl:template match="property[@type = 'float' or @type = 'int' or @type = 'string']" mode="catalog_opt_props">
        <xsl:param name="class" select="'namertyr'" />
        <tr>
            <td class="{$class}"><xsl:value-of select="title" disable-output-escaping="yes"/></td>
            <td style="font-weight:normal"><xsl:apply-templates select="value" mode="catalog_opt_props" /></td>
        </tr>
    </xsl:template>

    <xsl:template match="property[@type = 'boolean']" mode="catalog_opt_props">
        <tr>
            <td class="namertyr"><xsl:value-of select="title" disable-output-escaping="yes"/></td>
            <td style="font-weight:normal"><xsl:choose>
                <xsl:when test="value > 0">По запросу</xsl:when>
                <xsl:otherwise>-</xsl:otherwise>
            </xsl:choose></td>
        </tr>
    </xsl:template>
	
	<xsl:template match="property[@type = 'optioned']" mode="catalog_opt_props">
        <tr>
            <td class="namertyr"><xsl:value-of select="title" disable-output-escaping="yes"/></td>
            <td><xsl:apply-templates select="value/option" mode="catalog_opt_props" /></td>
        </tr>
	</xsl:template>

    <xsl:template match="property[@type = 'relation']" mode="catalog_opt_props">
        <tr>
            <td class="namertyr"><xsl:value-of select="title" disable-output-escaping="yes"/></td>
            <td style="font-weight:normal">
                <xsl:choose>
                    <xsl:when test="count(value/item) and @name = 'ramp_gear'">
                        <select name="{@name}" class="{@type}">
                            <option value="0" selected="" disabled="">--</option>
                            <xsl:apply-templates select="value/item" mode="catalog_opt_props" />
                        </select>
                    </xsl:when>
                    <xsl:otherwise><xsl:apply-templates select="value/item" mode="catalog_opt_props" /></xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="value/item" mode="catalog_opt_props">
        <option value="{@id}"><xsl:value-of select="@name" disable-output-escaping="yes"/></option>
    </xsl:template>
	
	<xsl:template match="value/option" mode="catalog_opt_props">
		<div class="opt_prop">
			<span class="opt_prop_rel">
				<xsl:value-of select="object/@name" disable-output-escaping="yes"/>
			</span>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="@float" />
		</div>
	</xsl:template>
	
</xsl:stylesheet>