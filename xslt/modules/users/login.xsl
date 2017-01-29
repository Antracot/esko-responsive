<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="result[@module = 'users'][@method = 'login' or @method = 'login_do' or @method = 'auth']">
        <h1>&authorization;</h1>

        <div class="main-holder events-main-holder">
            <div id="content">
                <div class="content-box">
                    <xsl:choose>
                        <xsl:when test="$utype = 'sv'">
                            <xsl:call-template name="login_admin"/>
                        </xsl:when>
                        <xsl:when test="$utype = 'guest'">
                            <xsl:if test="@method = 'login_do'">
                                <div class="text">
                                    <p>&user-reauth;</p>
                                    <a href="/users/settings/" class="yellow-link enter-user">&log-in;</a>
                                </div>
                            </xsl:if>
                            <xsl:call-template name="login_form"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="login_logged"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template name="login_form">
        <div class="tabs2">
            <ul class="tabset">
                <li><a href="#tab01" class="opener"><span>Постоянный покупатель</span></a></li>
                <li><a href="#tab02"><span>Новый покупатель</span></a></li>
            </ul>
            <div class="clear"></div>

            <div class="tab" id="tab01" style="display: block;">
                <form method="post" action="/users/login_do/" class="login">
                    <xsl:choose>
                        <xsl:when test="@method = 'login_do'">
                            <input type="hidden" name="from_page" value="/users/settings/" />
                        </xsl:when>
                        <xsl:otherwise>
                            <input type="hidden" name="from_page" value="{$_http_referer}" />
                        </xsl:otherwise>
                    </xsl:choose>
                    <div style="margin-left: 60px;padding-bottom:30px;">
                        <div class="row">
                            <div class="col3">
                                <label>&login; <span>*</span></label>
                                <input class="inptFz" type="text" required="" name="login" />
                            </div>
                            <div class="col3">
                                <label>&password; <span>*</span></label>
                                <input class="inptFz" type="password" required="" name="password" />
                            </div>
                        </div>
                        <div class="clear"></div>
                        <input type="submit" value="&log-in;" class="sendz"/>
                        <a href="/users/forget/" class="sendz">&forget-password;</a>
                    </div>
                </form>
            </div>

            <div class="tab" id="tab02" style="display: none;">
                <div style="margin-left: 60px;padding-bottom:30px;">
                    <form action="/users/registrate_do/" id="reg" method="post" enctype="multipart/form-data" class="registrate">
                        <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata">
                            <xsl:with-param name="tab" select="'#tab02'"/>
                        </xsl:apply-templates>
                        <xsl:apply-templates select="document('udata://users/registrate/')/udata" />
                        <div class="clear"></div>
                        <div class="line line_last">
                            <xsl:apply-templates select="document('udata://system/captcha')/udata[url]" mode="cart"/>
                        </div>
                        <div class="clear"></div><br />
                        <input type="checkbox" class="accept" /> Я ознакомлен (на) и принимаю п.6.2 "<a href="/yuridicheskaya_informaciya/" target="_blank">Публичной оферты</a>", размещенной на сайте.<br /><br />
                        <input type="submit" class="sendz hidden" value="&registration;" />
                    </form>
                </div>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template name="login_logged">
		<div class="text">
			&user-welcome;
		</div>
        <div class="system_buttons_list">
			<a href="/users/settings/" class="all_system_buttons">&my_settings;</a>
            <a href="/users/logout/" class="all_system_buttons last_system_button">&log-out;</a>
        </div>
    </xsl:template>
    
    <xsl:template name="login_admin">
        <div class="text">
            <p>&admin-welcome;</p>
        </div>
        <div>
            <a href="/users/logout/" class="all_system_buttons">&log-out;</a>
        </div>
    </xsl:template>

</xsl:stylesheet>