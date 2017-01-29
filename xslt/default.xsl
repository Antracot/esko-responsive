<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output encoding="utf-8"
                indent="yes"
                method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/html4/strict.dtd"
                omit-xml-declaration="yes"/>

    <xsl:include href="layouts/common.xsl"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="{$lang}">
            <xsl:call-template name="head"/>

            <body>
                <div class="conteiner">
                    <!-- Header -->
                    <xsl:call-template name="header"/>
                    <xsl:variable name="class">
                        <xsl:if test="$module = 'catalog' and $method = 'object'">ptop50</xsl:if>
                    </xsl:variable>

                    <xsl:if test="$module = 'catalog' or contains($request-uri, 'compare')">
                        <xsl:variable name="searchId">
                            <xsl:choose>
                                <xsl:when test="contains($request-uri, 'compare')">katalog</xsl:when>
                                <xsl:when test="$method = 'object'"><xsl:value-of select="$parentId" /></xsl:when>
                                <xsl:otherwise><xsl:value-of select="$page-id" /></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:apply-templates select="document(concat('udata://catalog/customSearch/', $searchId, '/system_options//'))/udata[group]" />
                    </xsl:if>

                    <div class="wht1060 {$class}" id="center-box">
                        <xsl:if test="($module = 'catalog' and $parentId > 0) or contains($request-uri, 'compare')">
                            <xsl:apply-templates select="document('udata://core/navibar/')/udata"/>
                        </xsl:if>

                        <xsl:if test="$method != 'object'">
                            <h1 class="titleh1">
                                <xsl:value-of select=".//property[@name = 'h1']/value" disable-output-escaping="yes"/>
                            </h1>
                        </xsl:if>

                        <xsl:apply-templates select="result"/>

                        <xsl:apply-templates select="document('udata://menu/draw/central')/udata" mode="central_menu"/>

                        <div class="maps-box-menu">
                            <xsl:apply-templates select="document('udata://menu/draw/left')/udata" mode="left_menu"/>
                            <div class="right-side-b">
                                <div class="tabs">
                                    <script type="text/javascript" charset="utf-8"
                                            src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=xdGZuuIkSg6W9UCu9HnbCZriOH1QQnQg&amp;width=866&amp;height=264" />
                                </div>
                                <div class="tabs">
                                    <script type="text/javascript" charset="utf-8"
                                            src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=QQhpyQY2iu0W-LWvmeBP3fJuaZ5UG0_W&amp;width=866&amp;height=264" />
                                </div>
                                <div class="tabs">
                                    <script type="text/javascript" charset="utf-8"
                                            src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=2PtHlc5Xcb6bUJ1Qc6RlTLX9zAUPZExZ&amp;width=866&amp;height=264" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="end_content"/>
                </div>

                <xsl:call-template name="footer"/>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="result[@module='webforms' and @method='page']">
        <xsl:value-of select="//property[@name = 'content_before']/value" disable-output-escaping="yes"/>
        <xsl:variable name="form-id" select=".//property[@name = 'form_id']/value"/>

        <xsl:apply-templates select="document(concat('udata://webforms/add/', $form-id))/udata" mode="forms"/>

        <xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes"/>
    </xsl:template>

</xsl:stylesheet>