<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="template-resources" />
    <xsl:param name="_http_referer" />
    <xsl:param name="_http_host" />
    <xsl:param name="lang" select="/result/@lang" />
    <xsl:param name="domain" select="/result/@domain" />
    <xsl:param name="page-id" select="/result/page/@id" />
    <xsl:param name="parentId" select="/result/page/@parentId" />
    <xsl:param name="module" select="/result/@module" />
    <xsl:param name="method" select="/result/@method" />
    <xsl:param name="userId" select="/result/user/@id" />
    <xsl:param name="utype" select="/result/user/@type" />
    <xsl:param name="request-uri" select="/result/@request-uri" />
    <xsl:param name="p" select="'0'" />
    <xsl:param name="guid"/>
    <xsl:param name="param0" />

    <xsl:variable name="loged">
        <xsl:if test="$utype = 'user' or $utype = 'sv'">
            <xsl:text>loged</xsl:text>
        </xsl:if>
    </xsl:variable>

    <xsl:include href="../modules/content/__common.xsl"/>
    <xsl:include href="../modules/catalog/__common.xsl"/>
    <xsl:include href="../modules/users/__common.xsl" />
    <xsl:include href="../modules/news/__common.xsl" />
    <xsl:include href="../modules/banners/view.xsl" />
    <xsl:include href="../modules/search/default.xsl" />
    <xsl:include href="../modules/webforms/add.xsl"/>
    <xsl:include href="../modules/webforms/posted.xsl"/>
    <xsl:include href="../modules/system/__common.xsl"/>
    <xsl:include href="../modules/core/navibar.xsl" />
    <xsl:include href="../library/properties.xsl" />
    <xsl:include href="../library/thumbnails.xsl" />
    <xsl:include href="../library/numpages.xsl" />

    <xsl:include href="head.xsl" />
    <xsl:include href="header.xsl" />
    <xsl:include href="footer.xsl" />

</xsl:stylesheet>