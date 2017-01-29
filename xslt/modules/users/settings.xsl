<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xlink="http://www.w3.org/TR/xlink">

    <xsl:template match="result[@method = 'settings']">
        <h1>&private_office;</h1>

        <div class="main-holder events-main-holder">
            <div id="content">
                <div class="content-box">
                    <xsl:choose>
                        <xsl:when test="$loged = 'loged'">
                            <xsl:apply-templates select="document('udata://users/settings/')/udata" />
                        </xsl:when>
                        <xsl:otherwise><xsl:call-template name="login_form"/></xsl:otherwise>
                    </xsl:choose>
                </div>
            </div>
        </div>
	</xsl:template>

	<xsl:template match="udata[@method = 'settings']">
		<xsl:variable name="user" select="document(concat('uobject://', $userId))/udata" />

        <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata" />
		<form class="site_form" id="settings" method="post" action="/users/settings_do/">
            <div class="clearfix">
                <div class="col6">
                    <h3 class="special-header">Персональные данные</h3>
                    <ul class="account-info">
                        <xsl:apply-templates select="document(concat('udata://data/getEditForm/', $userId))/udata" />

                        <li>
                            <label for="email">&e-mail;</label>
                            <div class="flds"><input class="inptFz" type="text" value="{$user//group[@name = 'idetntify_data']/property[@name = 'e-mail']/value}" name="email"/></div>
                        </li>
                    </ul>
                </div>

                <!-- begin col6 -->
                <div class="col6 change-password">
                    <h3 class="special-header">&password;</h3>
                    <ul>
                        <li>
                            <label for="street">Новый пароль</label>
                            <input type="password" name="password" />
                        </li>
                        <li>
                            <label for="street">Повторите пароль</label>
                            <input type="password" name="password_confirm" />
                        </li>
                    </ul>
                </div>
                <!-- end col6 -->
            </div>

            <h3 class="special-header">Ваши заказы</h3>
            <xsl:apply-templates select="document('udata://custom/getClientOrders')/udata" />

            <input type="submit" value="&save-changes;" class="sendz" style="margin-left:0px;"/>
            <a href="/users/logout/" class="sendz">Выйти из кабинета</a>
            <a href="/" class="sendz">Купить билеты</a>
		</form>
	</xsl:template>

    <xsl:template match="udata[@module = 'data'][@method = 'getEditForm']">
        <xsl:apply-templates select=".//field" mode="input_filed" />
    </xsl:template>

    <xsl:template match="field" mode="phone_filed">
        <input type="text" name="{@input_name}" value="{.}" class="phone-mask" />
    </xsl:template>

    <xsl:template match="field" mode="input_filed">
        <li>
            <label for="name"><xsl:value-of select="@title"/></label>
            <div class="flds"><input type="text" name="{@input_name}" value="{.}" /></div>
        </li>
    </xsl:template>

    <xsl:template match="udata[@module='custom'][@method='ordersList' or @method = 'getClientOrders']">
        <table class="brdr" border="1" cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <th class="name">№ Заказа</th>
                    <th class="name">Дата</th>
                    <th class="name">Статус</th>
                    <th>Сумма</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="items/item" mode="orders" />
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="item" mode="orders">
        <xsl:variable name="emarket_order" select="document(concat('udata://emarket/order/', @id))/udata" />

        <tr>
            <td class="name">
                <strong><xsl:value-of select="orderId"/></strong>
            </td>
            <td class="name">
                <div><xsl:value-of select="document(concat('udata://system/convertDate/1/(d-m-Y)/', @date))"/></div>
            </td>
            <td class="name">
                <xsl:value-of select="@status"/>
            </td>
            <td colspan="2"> <xsl:value-of select="@price"/> руб</td>
        </tr>
        <xsl:for-each select="$emarket_order/items/item">
            <tr>
                <td colspan="2" class="name"><a href="{page/@link}"><xsl:value-of select="@name"/></a></td>
                <td> <xsl:value-of select="price/actual"/> руб x <xsl:value-of select="amount"/> шт =  <xsl:value-of select="total-price/actual"/> руб</td>
            </tr>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>