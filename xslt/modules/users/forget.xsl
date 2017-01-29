<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@method = 'forget']">
        <h1>&forget;</h1>
        <div class="main-holder">
            <div id="content">
                <xsl:call-template name="forget_form"/>
            </div>
        </div>
	</xsl:template>
	
	<xsl:template name="forget_form">
        <div class="checkout-form">
        <form class="site_form" method="post" action="/users/forget_do/">
            <div class="checkout-form-h">
                <p>Введите свой электронный адрес или логин, указаные при регистрации:</p>
                <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata" />

                <div class="row">
                    <div class="col3">
                        <label for="login">
                            <select id="sel-forget" name="choose_forget">
                                <option value="forget_login" selected="selected">Логин</option>
                                <option value="forget_email">E-mail</option>
                            </select>
                            <span class="mark">*</span>
                        </label>
                        <input id="forget" type="text" class="txt" name="forget_login" value="" required=""/>
                    </div>
                </div>
            </div>
            <div class="btn-row">
                <input type="submit" value="&forget-button;" class="btn-order"/>
            </div>
		</form>
        </div>
    </xsl:template>

	<xsl:template match="result[@method = 'forget_do']">
        <h1>&forget;</h1>

        <div class="main-holder events-main-holder">
            <div id="content">
                <div class="content-box">
                    <p>&forget-do-message;</p>
                </div>
            </div>
        </div>
	</xsl:template>
	
	<xsl:template match="result[@method = 'restore']">
        <h1>&forget;</h1>

        <div class="main-holder events-main-holder">
            <div id="content">
                <div class="content-box">
                    <xsl:apply-templates select="document(concat('udata://users/restore/',$param0,'/'))/udata" />
                </div>
            </div>
        </div>
	</xsl:template>

    <xsl:template match="udata[@module = 'users'][@method = 'restore'][@status = 'success']">
        <p>&restore-message;</p>
    </xsl:template>

    <xsl:template match="udata[@module = 'users'][@method = 'restore'][@status = 'fail']">
        <p>Невозможно восстановить пароль: неверный код активации.</p>
    </xsl:template>
	
</xsl:stylesheet>