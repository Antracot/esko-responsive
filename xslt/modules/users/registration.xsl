<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:param name="param0" />

    <xsl:template match="result[@module='users'][@method = 'registrate']">
		<xsl:apply-templates select="document('udata://users/registrate')/udata" />
	</xsl:template>


	<xsl:template match="result[@method = 'registrate_done']">
        <h1>&registration;</h1>

        <div class="main-holder events-main-holder">
            <div id="content">
                <div class="content-box">
                    <p>&registration-activation-note;</p>
                </div>
            </div>
        </div>
	</xsl:template>
	
	<xsl:template match="result[@method = 'activate']">
		<xsl:variable name="activation-errors" select="document('udata://users/activate')/udata/error" />

        <h1>&registration;</h1>

        <div class="main-holder events-main-holder">
            <div id="content">
                <div class="content-box">
                    <xsl:choose>
                        <xsl:when test="count($activation-errors)">
                            <xsl:apply-templates select="$activation-errors" />
                        </xsl:when>
                        <xsl:otherwise>
                            <p>
                                <xsl:text>&account-activated;</xsl:text>
                            </p>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </div>
        </div>
	</xsl:template>

</xsl:stylesheet>