<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                version="1.0"
                xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="default_main_menu">
        <ul class="topmenu">
            <xsl:apply-templates select="item" mode="default_main_menu" />
        </ul>
        <!-- end .menu-->
    </xsl:template>

    <xsl:template match="items" mode="default_main_menu">
        <ul>
            <xsl:apply-templates select="item" mode="default_main_menu" />
        </ul>
    </xsl:template>

    <xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="upper_main_menu">
        <ul class="ust-top1">
            <li></li>
            <xsl:apply-templates select="item" mode="default_main_menu" />
        </ul>
        <!-- end .menu-->
    </xsl:template>

    <xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="down_main_menu">
        <ul class="ust-top1 leftbotr">
            <xsl:apply-templates select="item" mode="default_main_menu" />
            <xsl:if test="item[position() mod 2 = 1]"><li></li></xsl:if>
        </ul>
        <!-- end .menu-->
    </xsl:template>

	<xsl:template match="item" mode="default_main_menu">
		<li>
			<a href="{@link}"><xsl:value-of select="@name"/></a>
            <xsl:apply-templates select="items" mode="default_main_menu" />
		</li>
	</xsl:template>

    <xsl:template match="item[@status = 'active']" mode="default_main_menu">
        <li>
            <a class="active" href="{@link}"><xsl:value-of select="@name"/></a>
            <xsl:apply-templates select="items" mode="default_main_menu" />
        </li>
    </xsl:template>

	<xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="footer">
        <ul class="footmenu">
            <xsl:apply-templates select="item" mode="second-nav" />
        </ul>
    </xsl:template>

    <!-- MOBILE MENU -->
    <xsl:template match="item" mode="mobile">
                
        <div class="mob_menu" >
            <ul class="mob_menu_ul" >
                <li class="mob_menu_li">
                    <a  class="main_link" id="{@id}" href="{@link}"><xsl:value-of select="@name" /></a>
                    <div class="li_under_line"></div>
                    <!-- <a onclick="getUniqId(this)" class="open_hide_menu" data-id="123" style="float: right; margin-right: 20px; cursor: pointer; font-size: 16px" >+</a> -->
                    <a class="open_hide_menu" id="link{@id}">+</a>
                </li>
                    <div class="hide_menu" data-id="999">
                        <xsl:apply-templates class="linka" select="items" mode="mobile" />
                    </div>
            </ul>
        </div>
    </xsl:template>


    <xsl:template match="item" mode="second-nav">
        <li><a href="{@link}"><xsl:value-of select="@name"/></a></li>
    </xsl:template>

    <xsl:template match="item[@status = 'active']" mode="second-nav">
        <li class="active"><xsl:value-of select="@name"/></li>
    </xsl:template>

    <xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="left_menu">
        <div class="left-side-b">
            <xsl:apply-templates select="item" mode="left_menu" />
        </div>
        <!-- end .menu-->
    </xsl:template>

    <xsl:template match="item[@status = 'active']" mode="left_menu">
        <a href="{@link}" class="active"><xsl:value-of select="@name"/></a>
    </xsl:template>

    <xsl:template match="item" mode="left_menu">
        <a href="{@link}"><xsl:value-of select="@name"/></a>
    </xsl:template>

    <xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="central_menu">
        <ul class="menu-usl-bot">
            <xsl:apply-templates select="item" mode="default_main_menu" />
						<!--img src="/templates/esco/images/flame.jpg" style="margin-left:-2px;" border="0" /-->
        </ul>
        <!-- end .menu-->
    </xsl:template>

</xsl:stylesheet>