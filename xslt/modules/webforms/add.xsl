<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="udata[@module = 'webforms'][@method = 'add']" mode="feedback">
        <form method="post" action="/webforms/send/">
            <input type="hidden" name="system_form_id" value="{@form_id}"/>
            <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

            <div class="questin">
                <div class="feedback">
                    <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

                    <table border="0" cellspacing="0" cellpadding="0">
                        <xsl:apply-templates select=".//field[@type = 'string']" mode="form-fields"/>
                        <xsl:apply-templates select=".//field[@type = 'relation']" mode="form-fields"/>
                    </table>

                    <xsl:apply-templates select=".//field[@type = 'text']" mode="form-fields"/>
                    <br/>
                    <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                    <div class="clear"></div>
                    <input type="submit" value="Отправить" class="button"/>
                </div>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 110]" mode="forms">
        <form method="post" action="/webforms/send/" class="formtdp">
            <input type="hidden" name="system_form_id" value="{@form_id}"/>
            <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

            <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>
            <div class="ofvbix">
                <xsl:apply-templates select="groups/group[@name = 'contacts']" mode="form-fields-110"/>
                <xsl:apply-templates select="groups/group[@name = 'info']" mode="form-fields-110"/>

                <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                <div class="greybortline">
                    <p>Поля отмеченные *- звездочкой, обязательны для заполнения</p>
                    <input type="submit" class="sendzpod" value="отправить заявку"/>
                </div>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id != 110]" mode="forms">
        <form method="post" action="/webforms/send/" class="formtdp">
            <input type="hidden" name="system_form_id" value="{@form_id}"/>
            <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

            <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

            <xsl:apply-templates select="groups/group[not(contains(@name, 'podbor'))]" mode="form-fields"/>
            <div class="dblformt">
                <xsl:apply-templates select="groups/group[contains(@name, 'podbor')]" mode="form-fields"/>
            </div>

            <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
            <xsl:apply-templates select=".//field[@type = 'text']" mode="form-fields"/>

            <div class="greybortline">
                <p>Поля отмеченные *- звездочкой, обязательны для заполнения</p>
                <input type="submit" class="sendzpod" value="отправить заявку"/>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 141]" mode="forms">
        <xsl:variable name="page" select="document(concat('upage://', $page-id))"/>
        <div class="formBOxw23">
            <div class="ofvhDjs">
                <form method="post" action="/webforms/send/" class="fzakonline validateform">
                    <input type="hidden" name="system_form_id" value="{@form_id}"/>
                    <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
                    <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

                    <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

                    <div class="ovfBoxrtleft">
                        <div>представьтесь, пожалуйста
                            <input type="text" name="data[new][predstavtes_pozhalujsta]" class="wdth190px" required=""/>
                        </div>
                        <div>компания
                            <input type="text" name="data[new][kompaniya]" class="wdth190px"/>
                        </div>
                    </div>
                    <div class="ovfBoxrtright">
                        <div>номер телефона
                            <input type="text" name="data[new][nomer_telefona]" class="wdth190px" required=""/>
                        </div>
                        <div>e-mail
                            <input type="text" name="data[new][email]" id="email" class="wdth190px" required=""/>
                        </div>
                    </div>

                    <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                    <xsl:apply-templates select=".//field[@type = 'text']" mode="form-fields"/>

                    <input type="hidden" name="data[new][goods_name]" value="{$page//property[@name = 'h1']/value}"/>
                    <input type="hidden" name="pageId" value="{$page-id}"/>
                    <input type="submit" class="submtryf" value="Заказать"/>
                </form>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 151]" mode="forms">
        <xsl:variable name="page" select="document(concat('upage://', $page-id))"/>
        <div class="formBOxw23 lease">
            <div class="ofvhDjs">
                <form method="post" action="/webforms/send/" id="ord" class="fzakonline">
                    <input type="hidden" name="system_form_id" value="{@form_id}"/>
                    <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
                    <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

                    <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

                    <div class="ovfBoxrtleft">
                        <div>представьтесь, пожалуйста
                            <input type="text" name="data[new][predstavtes_pozhalujsta]" class="wdth190px" required="required"/>
                        </div>
                        <div>компания
                            <input type="text" name="data[new][kompaniya]" class="wdth190px"/>
                        </div>
                        <div>месяцев аренды
                            <input type="text" name="data[new][mesyacev_arendy]" class="wdth190px"/>
                        </div>
                    </div>
                    <div class="ovfBoxrtright">
                        <div>номер телефона
                            <input type="text" name="data[new][nomer_telefona]" class="wdth190px" required="required"/>
                        </div>
                        <div>e-mail
                            <input type="text" name="data[new][email]" id="email" class="wdth190px" required="required"/>
                        </div>
                        <div>Кол-во МВт
                            <input type="text" name="data[new][kolvo_mvt]" class="wdth190px" required="required"/>
                        </div>
                    </div>

                    <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                    <xsl:apply-templates select=".//field[@type = 'text']" mode="form-fields"/>

                    <input type="hidden" name="data[new][goods_name]" value="{$page//property[@name = 'h1']/value}"/>
                    <input type="hidden" name="pageId" value="{$page-id}"/>
                    <input type="submit" class="submtryf" value="Заказать"/>
                </form>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 152]" mode="forms">
        <xsl:variable name="page" select="document(concat('upage://', $page-id))"/>
        <div class="formBOxw23 sell">
            <div class="ofvhDjs">
                <form method="post" action="/webforms/send/" id="reg" class="fzakonline">
                    <input type="hidden" name="system_form_id" value="{@form_id}"/>
                    <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
                    <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

                    <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

                    <div class="ovfBoxrtleft">
                        <div>представьтесь, пожалуйста
                            <input type="text" name="data[new][predstavtes_pozhalujsta]" class="wdth190px" required="required"/>
                        </div>
                        <div>компания
                            <input type="text" name="data[new][kompaniya]" class="wdth190px"/>
                        </div>
                        <div>Кол-во МВт
                            <input type="text" name="data[new][kolvo_mvt]" class="wdth190px" required="required"/>
                        </div>
                    </div>
                    <div class="ovfBoxrtright">
                        <div>номер телефона
                            <input type="text" name="data[new][nomer_telefona]" class="wdth190px" required="required"/>
                        </div>
                        <div>e-mail
                            <input type="text" name="data[new][email]" id="email" class="wdth190px" required="required"/>
                        </div>
                    </div>

                    <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                    <xsl:apply-templates select=".//field[@type = 'text']" mode="form-fields"/>

                    <input type="hidden" name="data[new][goods_name]" value="{$page//property[@name = 'h1']/value}"/>
                    <input type="hidden" name="pageId" value="{$page-id}"/>
                    <input type="submit" class="submtryf" value="Заказать"/>
                </form>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 127]" mode="forms">
        <form method="post" action="/webforms/send/" class="formtdp">
            <input type="hidden" name="system_form_id" value="{@form_id}"/>
            <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

            <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

            <xsl:apply-templates select="groups/group[@name = 'user_info']" mode="form-fields"/>

            <table class="tbls" cellspacing="0" cellpadding="5" border="0" width="100%">
                <tr>
                    <th>Название</th>
                    <th>Мощность, МВт</th>
                    <th>Отапливаемая площадь, кв.м</th>
                    <th>Тип топлива</th>
                    <th>Наличие на базе</th>
                    <th>Необходимо котельных, ед.</th>
                </tr>
                <tr>
                    <td>Аннушка</td>
                    <td>0,30</td>
                    <td>3 000</td>
                    <td>дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][annushka]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Каролина</td>
                    <td>0,50</td>
                    <td>5 000</td>
                    <td>дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][karolina]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Драгун</td>
                    <td>0,75</td>
                    <td>7 500</td>
                    <td>дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][dragun]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Витязь</td>
                    <td>1,00</td>
                    <td>10 000</td>
                    <td>дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][vityaz]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Герцог</td>
                    <td>1,00</td>
                    <td>10 000</td>
                    <td>дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][gercog]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Иван да Марья</td>
                    <td>1,00</td>
                    <td>10 000</td>
                    <td>газ / дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][ivan_da_marya]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Сенатор</td>
                    <td>1,50</td>
                    <td>15 000</td>
                    <td>дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][senator]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Цезарь</td>
                    <td>2,00</td>
                    <td>20 000</td>
                    <td>дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][cezar]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Иван Грозный</td>
                    <td>3,00</td>
                    <td>30 000</td>
                    <td>дизель</td>
                    <td align="center">√</td>
                    <td>
                        <input type="text" name="data[new][ivan_groznyj]" class="wdth190px"/>
                    </td>
                </tr>
            </table>

            <div class="greybortline">
                <p>Поля отмеченные *- звездочкой, обязательны для заполнения</p>
                <input type="submit" class="sendzpod" value="отправить заявку"/>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 128]" mode="forms">
        <form method="post" action="/webforms/send/" class="formtdp">
            <input type="hidden" name="system_form_id" value="{@form_id}"/>
            <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

            <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

            <xsl:apply-templates select="groups/group[@name = 'user_info']" mode="form-fields"/>

            <table class="tbls" cellspacing="0" cellpadding="5" border="0" width="100%">
                <tr>
                    <th>Название</th>
                    <th>Мощность, МВт</th>
                    <th>Отапливаемая площадь, кв.м</th>
                    <th>Тип топлива</th>
                    <th>Расход топлива, кг/сутки</th>
                    <th>Минимальный срок аренды, мес.</th>
                    <th>Наличие на базе</th>
                    <th>Необходимо котельных, ед.</th>
                    <th>Кол-во месяцев аренды, ед.</th>
                </tr>
                <tr>
                    <td>Аннушка</td>
                    <td>0,30</td>
                    <td>3 000</td>
                    <td>дизель</td>
                    <td>285</td>
                    <td>2</td>
                    <td>√</td>
                    <td>
                        <input type="text" name="data[new][annushka_edinic]" class="wdth190px"/>
                    </td>
                    <td>
                        <input type="text" name="data[new][annushka_mesyacev]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Каролина</td>
                    <td>0,50</td>
                    <td>5 000</td>
                    <td>дизель</td>
                    <td>465</td>
                    <td>2</td>
                    <td>√</td>
                    <td>
                        <input type="text" name="data[new][karolina_edinic]" class="wdth190px"/>
                    </td>
                    <td>
                        <input type="text" name="data[new][karolina_mesyacev]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Драгун</td>
                    <td>0,75</td>
                    <td>7 500</td>
                    <td>дизель</td>
                    <td>700</td>
                    <td>2</td>
                    <td>√</td>
                    <td>
                        <input type="text" name="data[new][dragun_edinic]" class="wdth190px"/>
                    </td>
                    <td>
                        <input type="text" name="data[new][dragun_mesyacev]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Витязь</td>
                    <td>1,00</td>
                    <td>10 000</td>
                    <td>дизель</td>
                    <td>910</td>
                    <td>2</td>
                    <td>√</td>
                    <td>
                        <input type="text" name="data[new][vityaz_edinic]" class="wdth190px"/>
                    </td>
                    <td>
                        <input type="text" name="data[new][vityaz_mesyacev]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Герцог</td>
                    <td>1,00</td>
                    <td>10 000</td>
                    <td>дизель</td>
                    <td>850</td>
                    <td>2</td>
                    <td>√</td>
                    <td>
                        <input type="text" name="data[new][gercog_edinic]" class="wdth190px"/>
                    </td>
                    <td>
                        <input type="text" name="data[new][gercog_mesyacev]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Сенатор</td>
                    <td>1,50</td>
                    <td>15 000</td>
                    <td>дизель</td>
                    <td>1 620</td>
                    <td>2</td>
                    <td>√</td>
                    <td>
                        <input type="text" name="data[new][senator_edinic]" class="wdth190px"/>
                    </td>
                    <td>
                        <input type="text" name="data[new][senator_mesyacev]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Цезарь</td>
                    <td>2,00</td>
                    <td>20 000</td>
                    <td>дизель</td>
                    <td>1 945</td>
                    <td>2</td>
                    <td>√</td>
                    <td>
                        <input type="text" name="data[new][cezar_edinic]" class="wdth190px"/>
                    </td>
                    <td>
                        <input type="text" name="data[new][cezar_mesyacev]" class="wdth190px"/>
                    </td>
                </tr>
                <tr>
                    <td>Иван Грозный</td>
                    <td>3,00</td>
                    <td>30 000</td>
                    <td>дизель</td>
                    <td>н/д</td>
                    <td>2</td>
                    <td>√</td>
                    <td>
                        <input type="text" name="data[new][ivan_groznyj_edinic]" class="wdth190px"/>
                    </td>
                    <td>
                        <input type="text" name="data[new][ivan_groznyj_mesyacev]" class="wdth190px"/>
                    </td>
                </tr>
            </table>


            <div class="greybortline">
                <p>Поля отмеченные *- звездочкой, обязательны для заполнения</p>
                <input type="submit" class="sendzpod" value="отправить заявку"/>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 111]" mode="forms">
        <form method="post" action="/webforms/send/" class="formtdp">
            <input type="hidden" name="system_form_id" value="{@form_id}"/>
            <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

            <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

            <xsl:apply-templates select="groups/group[@name = 'user_info']" mode="form-fields"/>
            <xsl:apply-templates select="groups/group[@name = 'work_type_list']" mode="form-fields"/>
            <div class="dblformt">
                <div class="leftbdlf">
                    <h3>Назначение котельной
                        <br/>
                        и планируемое распределение тепловой нагрузки:
                    </h3>
                    <div class="titleformleft" >
                        <span class="titleftr">отопление</span>
                        <input type="text" name="data[new][otoplenie_mvt]" class="wdth80px"/>
                        <span class="noupper">МВт</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][otoplenie_gcal]" class="wdth80px"/>
                        <span class="noupper">Гкал/час</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">горячее<br/>водоснабжение
                        </span>
                        <input type="text" name="data[new][vodosnabzhenie_mvt]" class="wdth80px"/>
                        <span class="noupper">МВт</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][vodosnabzhenie_gcal]" class="wdth80px"/>
                        <span class="noupper">Гкал/час</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">вентиляция</span>
                        <input type="text" name="data[new][ventilyaciya_mvt]" class="wdth80px"/>
                        <span class="noupper">МВт</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][ventilyaciya_gcal]" class="wdth80px"/>
                        <span class="noupper">Гкал/час</span>
                    </div>

                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>

                    <xsl:apply-templates select="field[not(contains(@name, '_ft'))]" mode="form-fields-small">
                        <xsl:with-param name="class" select="'wdth308px'"/>
                    </xsl:apply-templates>
                    <div class="titleformleft">
                        <span class="titleftr">ВИД ТОПЛИВА</span>
                        <xsl:apply-templates select=".//field[contains(@name, '_ft')]" mode="form-fields-small"/>
                    </div>

                    <xsl:apply-templates select=".//field[@name = 'fuel_tank']" mode="form-fields-text"/>
                </div>
                <div class="rightbdlf">
                    <h3>температурный график систем:</h3>

                    <br/>

                    <div class="titleformleft">
                        <span class="titleftr">отопление</span>
                        <input type="text" name="data[new][otoplenie_system_mv]" class="wdth80px"/>
                        <span class="mlr10 noupper">-</span>
                        <input type="text" name="data[new][otoplenie_system_gcal_mvt]" class="wdth80px"/>
                        <span class="noupper">C°</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">горячее<br/>водоснабжение
                        </span>
                        <input type="text" name="data[new][vodosnabzhenie_system]" class="wdth80px"/>
                        <span class="mlr10 noupper">-</span>
                        <input type="text" name="data[new][vodosnabzhenie_system_gcal]" class="wdth80px"/>
                        <span class="noupper">C°</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">вентиляция</span>
                        <input type="text" name="data[new][ventilyaciya_system]" class="wdth80px"/>
                        <span class="mlr10 noupper">-</span>
                        <input type="text" name="data[new][ventilyaciya_system_gcal]" class="wdth80px"/>
                        <span class="noupper">C°</span>
                    </div>

                    <div class="tempin">
                        <xsl:apply-templates select=".//field[contains(@name, 'pressure')]" mode="form-fields">
                            <xsl:with-param name="class" select="'wdth80px'"/>
                            <xsl:with-param name="title" select="'titleftr titleftrbig'"/>
                        </xsl:apply-templates>
                    </div>

                    <br/>
                    <br/>
                    <div class="titleformleft">
                        <span class="titleftr">Система теплоснабжения</span>
                        <xsl:apply-templates select=".//field[@name = 'thermal_system_small']"
                                             mode="form-fields-small"/>
                        <xsl:apply-templates select=".//field[@name = 'thermal_system_2_small']"
                                             mode="form-fields-small"/>
                    </div>

                    <div class="titleformleft">
                        <span class="titleftr">&nbsp;&nbsp;&nbsp;</span>
                        <input type="checkbox" name="data[new][nalichie_itp]"/>
                        - НАЛИЧИЕ ИТП
                    </div>
                </div>
            </div>

            <div class="dblformt">
                <div class="leftbdlf">
                    <h3>Подключаемая теплосеть:</h3>
                    <div class="titleformleft">
                        <span class="titleftr">&nbsp;&nbsp;&nbsp;</span>
                        <span class="box308pxtc">отопление</span>
                        <span class="box308pxtc">гвс</span>
                        <span class="box308pxtc">вентиляция</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">Давление в прямой</span>
                        <input type="text" name="data[new][davlenie_v_pryamoj_otoplenie]" class="wdth75px"/>
                        <input type="text" name="data[new][davlenie_v_pryamoj_gvs]" class="wdth75px"/>
                        <input type="text" name="data[new][davlenie_v_pryamoj_vent]" class="wdth75px"/>
                        <span class="noupper">кгс/см2</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">Давление в обратной</span>
                        <input type="text" name="data[new][davlenie_v_obratnoj_otoplenie]" class="wdth75px"/>
                        <input type="text" name="data[new][davlenie_v_obratnoj_gvs]" class="wdth75px"/>
                        <input type="text" name="data[new][davlenie_v_obratnoj_vent]" class="wdth75px"/>
                        <span class="noupper">кгс/см2</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">Гидравлическое сопротивление</span>
                        <input type="text" name="data[new][gidravlicheskoe_soprotivlenie_otoplenie]" class="wdth75px"/>
                        <input type="text" name="data[new][gidravlicheskoe_soprotivlenie_gvs]" class="wdth75px"/>
                        <input type="text" name="data[new][gidravlicheskoe_soprotivlenie_vent]" class="wdth75px"/>
                        <span class="noupper">МПа</span>
                    </div>

                    <div class="titleformleft">
                        <span class="titleftr">дымовая труба:</span>
                        <span class="mlr10 noupper">диаметр</span>
                        <input type="text" name="data[new][tube_diametr]" class="wdth60px"/>
                        ММ
                        <span class="mlr10 noupper">высота</span>
                        <input type="text" name="data[new][tube_height]" class="wdth60px"/>
                        ММ
                    </div>
                    <br/>

                    <xsl:apply-templates select="field[not(contains(@name, '_ak'))]" mode="form-fields-small">
                        <xsl:with-param name="class" select="'wdth308px'"/>
                    </xsl:apply-templates>
                    <div class="titleformleft" style="margin-bottom:40px;">
                        <span class="titleftr">АВТОМАТИЗАЦИЯ КОТЕЛЬНОЙ</span>
                        <xsl:apply-templates select=".//field[contains(@name, '_ak')]" mode="form-fields-small"/>
                    </div>

                    <xsl:apply-templates select="field[not(contains(@name, '_dll'))]" mode="form-fields-small">
                        <xsl:with-param name="class" select="'wdth308px'"/>
                    </xsl:apply-templates>
                    <div class="titleformleft year2">
                        <span class="titleftr bigsrty262">ДОСТАВКУ МОДУЛЬНОЙ КОТЕЛЬНОЙ ДО ПЛОЩАДКИ ОСУЩЕСТВЛЯЕТ</span>
                        <xsl:apply-templates select=".//field[contains(@name, '_dll')]" mode="form-fields-small"/>
                    </div>

                    <xsl:apply-templates select="field[not(contains(@name, '_sl'))]" mode="form-fields-small">
                        <xsl:with-param name="class" select="'wdth308px'"/>
                    </xsl:apply-templates>
                    <div class="titleformleft year2">
                        <span class="titleftr bigsrty262">НЕОБХОДИМО ЛИ СЕРВИСНОЕ ОБСЛУЖИВАНИЕ</span>
                        <xsl:apply-templates select=".//field[contains(@name, '_sl')]" mode="form-fields-small"/>
                    </div>

                </div>
                <div class="rightbdlf">
                    <xsl:apply-templates select="groups/group[contains(@name, 'checkbox')]" mode="form-fields"/>
                </div>
            </div>

            <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
            <xsl:apply-templates select=".//field[@name = 'pozhelaniya_po_oborudovaniyu_kotelnoj']" mode="form-fields"/>

            <div class="greybortline">
                <p>Поля отмеченные *- звездочкой, обязательны для заполнения</p>
                <input type="submit" class="sendzpod" value="отправить заявку"/>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 113]" mode="forms">
        <form method="post" action="/webforms/send/" class="formtdp">
            <input type="hidden" name="system_form_id" value="{@form_id}"/>
            <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

            <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

            <xsl:apply-templates select="groups/group[@name = 'user_info']" mode="form-fields"/>
            <xsl:apply-templates select="groups/group[@name = 'work_type_list']" mode="form-fields"/>
            <div class="dblformt">
                <div class="leftbdlf" style="width:800px; height: 160px;">
                    <h3>Мощность/площадь отапливаемого помещения:</h3>
                    <div class="titleformleft">
                        <span class="titleftr">отопление</span>
                        <input type="text" name="data[new][otoplenie_mvt]" class="wdth80px"/>
                        <span class="noupper mlr10">МВт</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][otoplenie_gcal]" class="wdth80px"/>
                        <span class="noupper mlr10">Гкал/час</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][otoplenie_m2]" class="wdth80px"/>
                        <span class="noupper mlr10">м2</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">горячее водоснабжение</span>
                        <input type="text" name="data[new][goryachee_vodosnabzhenie_mvt]" class="wdth80px"/>
                        <span class="noupper mlr10">МВт</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][goryachee_vodosnabzhenie_gcal]" class="wdth80px"/>
                        <span class="noupper mlr10">Гкал/час</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][goryachee_vodosnabzhenie_m2]" class="wdth80px"/>
                        <span class="noupper mlr10">м2</span>
                    </div>
                    <div class="titleformleft">
                        <span class="titleftr">вентиляция</span>
                        <input type="text" name="data[new][ventilyaciya_mvt]" class="wdth80px"/>
                        <span class="noupper mlr10">МВт</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][ventilyaciya_gkalchas_gcal]" class="wdth80px"/>
                        <span class="noupper mlr10">Гкал/час</span>
                        <span class="mlr10 noupper">или</span>
                        <input type="text" name="data[new][ventilyaciya_m2]" class="wdth80px"/>
                        <span class="noupper mlr10">м2</span>
                    </div>

                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>

                    <xsl:apply-templates select=".//field[@name = 'fuel_type']" mode="form-fields">
                        <xsl:with-param name="class" select="'wdth308px'"/>
                    </xsl:apply-templates>
                    <xsl:apply-templates select=".//field[@name = 'fuel_tank']" mode="form-fields-text"/>
                </div>
                <div class="leftbdlf">
                    <xsl:apply-templates select="groups/group[@name = 'naimenovanie_interesuyuwej_uslugi_podbor']"
                                         mode="form-fields"/>
                </div>
                <div class="rightbdlf">
                    <xsl:apply-templates select="groups/group[@name = 'tip_topliva_podbor']" mode="form-fields"/>
                </div>
            </div>

            <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
            <xsl:apply-templates select=".//field[@name = 'pozhelaniya_po_oborudovaniyu_kotelnoj']" mode="form-fields"/>

            <div class="greybortline">
                <p>Поля отмеченные *- звездочкой, обязательны для заполнения</p>
                <input type="submit" class="sendzpod" value="отправить заявку"/>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 142]" mode="forms">
        <form method="post" action="/webforms/send/" class="listoform mynewfr">
            <input type="hidden" name="system_form_id" value="{@form_id}"/>
            <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

            <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>

            <h3 class="nofountdsds">не нашли ничего подходящего?<br/>напишите нам
            </h3>
            <div class="ofvbix">
                <div class="imgbox-dir">
                    <div>
                        <input type="text" class="indbl" name="data[new][familiya_imya]" placeholder="фамилия имя"/>
                    </div>
                    <div>
                        <input type="text" class="indbl" name="data[new][email]" placeholder="e-mail"/>
                    </div>
                    <div>
                        <input type="text" class="indbl" name="data[new][nomer_telefona]" placeholder="номер телефона"/>
                    </div>
                </div>
                <div class="opis-dir-box">
                    <div>
                        <input type="text" class="indbl" name="data[new][tema_pisma]" placeholder="тема письма"/>
                    </div>
                    <textarea class="indbl" name="data[new][vvedite_vashe_soobwenie]"
                              placeholder="Введите ваше сообщение"></textarea>
                </div>
            </div>
            <div class="flrightbottom">
                <input type="submit" value="отправить" class="sentdfrd"/>
            </div>
        </form>
    </xsl:template>

    <xsl:template match="group" mode="form-fields">
        <xsl:variable name="class">
            <xsl:if test="position() = 1">leftbdlf</xsl:if>
            <xsl:if test="position() > 1">rightbdlf</xsl:if>
        </xsl:variable>
        <div class="{$class}">
            <h3><xsl:value-of select="@title"/>:
            </h3>
            <xsl:apply-templates select="field" mode="form-fields"/>
        </div>
    </xsl:template>

    <xsl:template match="group[@name = 'system_options' or contains(@name, 'compare')]" mode="form-fields">
        <div class="mtb30px">
            <xsl:value-of select="@title"/>:
            <xsl:apply-templates select="field" mode="form-fields-small"/>
        </div>
    </xsl:template>

    <xsl:template match="group[contains(@name, 'list')]" mode="form-fields">
        <div class="mtb30px">
            <xsl:apply-templates
                    select="field[not(contains(@name, '_mvt') or contains(@name, '_gcal') or contains(@name, '_size') or contains(@name, '_vr1') or contains(@name, '_vr2') or contains(@name, '_small'))]"
                    mode="form-fields">
                <xsl:with-param name="class" select="'wdth308px'"/>
            </xsl:apply-templates>
            <div class="titleformleft">
                <span class="titleftr">ВИД РАБОТ</span>
                <xsl:apply-templates select="field[contains(@name, '_vr1')]" mode="form-fields-small"/>
            </div>
            <div class="titleformleft">
                <span class="titleftr">ТИП КОТЕЛЬНОЙ</span>
                <xsl:apply-templates select="field[contains(@name, '_vr2')]" mode="form-fields-small"/>
            </div>
            <div class="titleformleft">
                <span class="titleftr">ЖЕЛАЕМЫЕ РАЗМЕРЫ</span>
                <input type="text" name="data[new][zhelaemye_razmery_dlina_size]" class="wdth80px"/>
                <span class="mlr10 noupper">x</span>
                <input type="text" name="data[new][zhelaemye_razmery_shirina_size]" class="wdth80px"/>
                <span class="mlr10 noupper">x</span>
                <input type="text" name="data[new][zhelaemye_razmery_vysota_size]" class="wdth80px"/>
                <span class="mlr10 noupper">М</span>
            </div>
            <div class="titleformleft year">
                <span class="titleftr">ПЛАНИРУЕМЫЙ СРОК ВВОДА В ЭКСПЛУАТАЦИЮ</span>
                <xsl:apply-templates select="field[contains(@name, '_small')]" mode="form-fields-small"/>
            </div>
            <div class="titleformleft">
                <span class="titleftr">Общая производительность котельной
                    <span class="red">*</span>
                </span>
                <input type="text" name="data[new][cpacity_mvt]" class="wdth80px"/>
                <span class="noupper">МВт</span>
                <span class="mlr10 noupper">или</span>
                <input type="text" name="data[new][capacity_gcal]" class="wdth80px"/>
                <span class="noupper">Гкал/час</span>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="group[contains(@name, 'checkbox')]" mode="form-fields">
        <h3><xsl:value-of select="@title"/>:
        </h3>
        <xsl:for-each select="field[position() mod 2 = 1]">
            <div class="dblch">
                <xsl:apply-templates select=".|following-sibling::field[position() &lt; 2]" mode="form-fields"/>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="group[@name = 'user_info']" mode="form-fields">
        <div class="hrbold">
            <xsl:apply-templates select="field[not(@name = 'dop_info')]" mode="form-fields">
                <xsl:with-param name="class" select="'wdth308px'"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>

    <xsl:template match="group[@name = 'contacts']" mode="form-fields-110">
        <div class="imgbox-dir">
            <xsl:apply-templates select="field" mode="form-fields-110"/>
        </div>
    </xsl:template>

    <xsl:template match="group[@name = 'info']" mode="form-fields-110">
        <div class="opis-dir-box">
            <xsl:apply-templates select="field" mode="form-fields-110"/>
        </div>
    </xsl:template>

    <xsl:template match="field[@type = 'string' or @type = 'float' or @type = 'int']" mode="form-fields-small">
        <xsl:if test="position() > 1">
            <span class="mlr10 noupper">или</span>
        </xsl:if>
        <xsl:if test="@required = 'required'">
            <span class="red">*</span>
        </xsl:if>
        <input name="{@input_name}" type="text" class="wdth85px mlr10"/>
        <xsl:if test="contains(@input_name, '_mwt')">
            <span class="noupper">МВт</span>
        </xsl:if>
        <xsl:if test="contains(@input_name, '_gcal')">
            <span class="noupper">Гкал/час</span>
        </xsl:if>
    </xsl:template>

    <xsl:template match="field[@type = 'string' or @type = 'float' or @type = 'int']" mode="form-fields">
        <xsl:param name="class" select="'wdth275px'"/>
        <xsl:param name="title" select="'titleftr'"/>
        <div class="titleformleft">
            <span class="{$title}">
                <xsl:value-of select="@title"/>
                <xsl:if test="@required = 'required'">
                    <span class="red">*</span>
                </xsl:if>
            </span>
            <input name="{@input_name}" type="text" class="{$class}"/>
            <xsl:if test="contains(@input_name, 'power_')">
                <span class="noupper">МВт</span>
            </xsl:if>
            <xsl:if test="contains(@input_name, '_mpa')">
                <span class="noupper">МПа</span>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="field[@type = 'relation']" mode="form-fields">
        <tr>
            <td class="feed">
                <xsl:value-of select="@title"/>
                <xsl:if test="@required = 'required'">
                    <xsl:text>*</xsl:text>
                </xsl:if>
                :&#160;
            </td>
            <td class="feed">
                <select name="{@input_name}">
                    <xsl:for-each select="values/item">
                        <option value="{.}">
                            <xsl:value-of select="."/>
                        </option>
                    </xsl:for-each>
                </select>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="field[@type = 'relation']" mode="form-fields-small">
        <tr>
            <td class="feed">
                <select name="{@input_name}">
                    <xsl:if test="not(contains(@input_name, 'year')) and not(contains(@input_name, 'month'))">
                        <option>Выбрать</option>
                    </xsl:if>
                    <xsl:if test="contains(@input_name, 'year')">
                        <option value="">год</option>
                    </xsl:if>
                    <xsl:if test="contains(@input_name, 'month')">
                        <option value="">месяц</option>
                    </xsl:if>
                    <xsl:for-each select="values/item">
                        <option value="{.}">
                            <xsl:value-of select="."/>
                        </option>
                    </xsl:for-each>
                </select>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="field[@type = 'text']" mode="form-fields">
        <xsl:param name="class" select="'indbl'"/>
        <h3>
            <xsl:value-of select="@title"/>
            <xsl:if test="@required = 'required'">
                <xsl:text>*</xsl:text>
            </xsl:if>
            :
        </h3>
        <textarea name="{@input_name}" class="{$class}"></textarea>
    </xsl:template>

    <xsl:template match="field[@type = 'boolean']" mode="form-fields">
        <div>
            <input name="{@input_name}" type="checkbox"/>
            -
            <xsl:value-of select="@title"/>
            <xsl:if test="@required = 'required'">
                <xsl:text>*</xsl:text>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="field[@type = 'text']" mode="form-fields-text">
        <xsl:param name="class" select="'twdth308px'"/>
        <div class="titleformleft">
            <span class="titleftr">
                <xsl:value-of select="@title"/>
                <xsl:if test="@required = 'required'">
                    <span class="red">*</span>
                </xsl:if>
            </span>
            <textarea name="{@input_name}" class="{$class}"></textarea>
        </div>
    </xsl:template>

    <xsl:template match="field[@type = 'string' or @type = 'float' or @type = 'int']" mode="form-fields-110">
        <div>
            <xsl:if test="@required = 'required'">
                <span class="red">*</span>
            </xsl:if>
            <input name="{@input_name}" type="text" class="indbl" placeholder="{@title}"/>
        </div>
    </xsl:template>

    <xsl:template match="field[@type = 'text']" mode="form-fields-110">
        <div>
            <xsl:if test="@required = 'required'">
                <xsl:text>*</xsl:text>
            </xsl:if>
            <textarea name="{@input_name}" class="indbl" placeholder="{@title}"></textarea>
        </div>
    </xsl:template>

    <!--xsl:template match="udata[@method='captcha']">
        <div class="titleformleft">
            <span class="titleftr">Защитный код:</span>
            <img src="{url}{@random_string}"/>
            <input type="text" name="captcha" class="wdth275px"/>
        </div>
    </xsl:template-->

    <xsl:template match="udata[@module = 'system' and @method = 'listErrorMessages']/items">
        <xsl:param name="tab"/>

        <ul class="tbs" id="{$tab}">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="udata[@module = 'system' and @method = 'listErrorMessages']/items/item">
        <li style="color: red; font-weight: bold;">
            <xsl:value-of select="."/>
        </li>
    </xsl:template>

</xsl:stylesheet>