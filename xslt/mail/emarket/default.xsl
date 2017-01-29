<!--DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file"-->

<xsl:stylesheet	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/TR/xlink"
	xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:output encoding="utf-8" method="html" indent="yes" />

	<xsl:template match="status_notification">
        <xsl:choose>
            <xsl:when test="eticket = 1">
                <xsl:call-template name="status_notification_eticket" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="status_notification_common" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--Шаблон для всех способов оплаты-->
    <xsl:template name="status_notification_common">
        <div align="center">
            <img src="/templates/ice/images/logo_icet.jpg" border="0" />
            <h2>Уважаемый клиент!</h2>
        </div>
        <br />

        <div align="center">
            <h2 style="color:#ff0000">Ваш заказ №<xsl:value-of select="order_number" /></h2>
            <p style="color:#ff0000;font-size: 1.2em;">Дата заказа: <xsl:value-of select="document('udata://custom/dateru/0/(.)')/udata/atom"/></p>
        </div>
        <br />

        <xsl:apply-templates select="order" mode="user" />
        <xsl:apply-templates select="order" mode="cart" />
        <xsl:apply-templates select="order" mode="summary">
            <xsl:with-param name="delivery" select="delivery_type"/>
            <xsl:with-param name="payment" select="payment_price"/>
        </xsl:apply-templates>

        <p style="font-size:1.5em">Ваш заказ действителен  в течение 3-х рабочих дней.</p>
        <p style="color:#ff0000;">Внимание! Если Вы заказали билеты менее чем за 4-ре дня до мероприятия, Ваш заказ будет аннулирован автоматически за сутки до начала мероприятия!</p>
        <p style="font-size:1.5em">Вы выбрали следующий способ оплаты:</p>
        <p align="center" style="font-size:1.5em;color:#ff0000"><xsl:value-of select="payment_type"/></p>
        <xsl:if test="delivery_type != ''">
            <p>Способ доставки: <xsl:value-of select="delivery_type"/></p>
            <xsl:if test="payment_price != ''">
                <h2><strong>Стоимость доставки: <xsl:value-of select="payment_price" />руб.</strong></h2>
            </xsl:if>
        </xsl:if>

        <p style="font-size:1.5em">Для удобства приобретения билетов, информируем Вас о всех  доступных  способах оплаты:</p>
        <p>1.	<span style="color:#ff0000">Самовыкуп наличными или банковскими картами в центральной кассе в г. Москве</span> по адресу: г.Москва, улица Бутырский вал, д.68, офис 403. Время работы: понедельник-пятница с 10.00 до 18.00 часов. Для прохода в здание при себе иметь документ, удостоверяющий личность.<br />
        <span style="color:#ff0000">Самовыкуп наличными в центральной кассе в г.Сочи</span> по адресу: г.Сочи, Курортный проспект, д.50, гостиница «Магнолия». Касса расположена в помещении сервисной кассы по продаже авиа и железнодорожных билетов и находится слева от главного входа в отель. Режим работы: ежедневно с 9.00 до 18.00 часов, перерыв с 13.00 до 14.00 часов.
        </p>
        <p>2.	Оплата наличными в кассах партнера в г.Москве.<br />Адрес: м.Пушкинская, вестибюль, выход в город со станции «Пушкинская» или станции «Тверская» к «Известиям». При выходе с эскалатора со станции «Пушкинская» касса расположена справа в начале торгового ряда. Билеты продаются с услугой бронирования 10% к номинальной стоимости билета.</p>
        <p>3.	Оплата наличными курьеру.</p>
        <p>4.	Оплата юридическими лицами. Для координации действий для выставления счета просьба связаться по телефону: 8 (499) 973-00-94</p>
        <p>5.	Оплата банковской картой.</p>
        <p align="center"><strong><xsl:text>Посмотреть историю заказов вы можете в своем </xsl:text><a href="http://{domain}/personal/"><xsl:text>личном кабинете</xsl:text></a>.<br />(данная опция доступна для зарегистрированных пользователей нашего сайта).</strong></p>
        <p style="color:#ff0000;font-size:1em" align="center">Спасибо, что воспользовались услугами нашего интернет-магазина!</p>
    </xsl:template>

    <!--Шаблон для способа оплаты электронных билетов-->
    <xsl:template name="status_notification_eticket">
        <div align="center">
            <img src="/templates/ice/images/logo_icet.jpg" border="0" />
            <h2>Уважаемый клиент!</h2>
        </div>
        <br />
        
        <xsl:apply-templates select="order" mode="cart">
            <xsl:with-param name="eticket" select="eticket" />
        </xsl:apply-templates>
        
        <div align="center">
            <h2 style="color:#ff0000">Ваш заказ №<xsl:value-of select="order_number" /></h2>
            <p style="color:#ff0000;font-size: 1.2em;">Дата заказа: <xsl:value-of select="document('udata://custom/dateru/0/(.)')/udata/atom"/></p>
        </div>
        <br />
        
        <xsl:apply-templates select="order" mode="summary">
            <xsl:with-param name="delivery" select="delivery_type"/>
            <xsl:with-param name="payment" select="payment_price"/>
        </xsl:apply-templates>
        <div style="font-size:19px">* При оплате заказа с помощью банковской карты взимается комиссия в размере 10% за банковские услуги.</div>
        
<br /><br />
        <xsl:apply-templates select="order" mode="user" />
<br /><br />        
        
        
        <p><strong>Дополнительная информация:</strong></p>
        <p>Обращаем Ваше внимание, что для посещения мероприятия Вам необходимо забрать билеты:</p>
        <p>1. При выборе билетов с услугой «Электронный билет» для посещения мероприятия Вам необходимо распечатать «Электронный билет» по ссылке!<br />
        Берегите Ваши билеты от копирования! Вход на мероприятие по билету возможен только один раз и только для одного человека. Использование электронного билета подразумевает  Ваше принятие договора публичной оферы.</p>
        <p>2. При выборе билетов, где отсутствует услуга «Электронный билет» Вам необходимо забрать билеты в центральным офисе, в соответствии с условиями договора оферты, по адресу: г.Москва, Бутырский вал, д.68, офис 403.</p>

        
        <p style="color:#ff0000;font-size:1em" align="center">Спасибо, что воспользовались услугами нашего интернет-магазина!</p>
    </xsl:template>

    <xsl:template match="neworder_notification">
        <p>Дата заказа: <xsl:value-of select="document('udata://custom/dateru/0/(.)')/udata/atom"/></p>

        <div align="center">
            <h1>Поступил новый заказ #
            	<xsl:value-of select="order_number" />
            </h1>
            <p>Дата заказа: <xsl:value-of select="document('udata://custom/dateru/0/(.)')/udata/atom"/></p>
        </div>

        <p>Способ оплаты: <xsl:value-of select="payment_type"/></p>
        <xsl:if test="delivery_type != ''">
            <p>Способ доставки: <xsl:value-of select="delivery_type"/></p>
            <xsl:if test="payment_price != ''">
                <h2><strong>Стоимость доставки: <xsl:value-of select="payment_price" />руб.</strong></h2>
            </xsl:if>
        </xsl:if>

        <h2>Информация о клиенте</h2>

        <xsl:apply-templates select="order" mode="user" />
        <xsl:apply-templates select="order" mode="cart" />
        <xsl:apply-templates select="order" mode="summary">
            <xsl:with-param name="delivery" select="delivery_type"/>
        </xsl:apply-templates>
	</xsl:template>

    <xsl:template match="order" mode= "user">
        <table border="0" cellspacing="0" cellpadding="10">
            <tr>
                <td><strong>ФИО:</strong></td>
                <td width="35%">
                    <xsl:value-of select="customer//property[@name = 'lname']/value"/>&#160;
                    <xsl:value-of select="customer//property[@name = 'fname']/value"/>&#160;
                    <xsl:value-of select="customer//property[@name = 'father_name']/value"/>
                </td>
            </tr>
            <tr>
                <td><strong>Адрес доставки:</strong></td>
                <td><xsl:value-of select="address"/></td>
            </tr>
            <tr>
                <td><strong>E-mail:</strong></td>
                <td><xsl:value-of select="customer//property[@name = 'email' or @name = 'e-mail']/value"/></td>
            </tr>
            <tr>
                <td><strong>Телефон:</strong></td>
                <td><xsl:value-of select="customer//property[@name = 'phone']/value"/></td>
            </tr>
            <tr>
                <td><strong>Дополнительная информация:</strong></td>
                <td colspan="3"><xsl:value-of select="info"/></td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="order" mode="cart">
        <xsl:param name="eticket" select="'0'" />

        <table width="100%" border="1" cellspacing="0" cellpadding="10">
            <tr>
                <td width="2%"><strong>№</strong></td>
                <td width="35%"><strong>Наименование</strong></td>
                <td width="15%"><strong>Площадка</strong></td>
                
                <td width="12%" align="center"><strong>Дата</strong></td>
                <td width="12%" align="center"><strong>Места</strong></td>
                <td width="12%" align="center"><strong>Сумма</strong></td>
                <xsl:if test="$eticket = 1">
                    <td width="12%" align="center"><strong>Комиссионный сбор</strong></td>
                    <td width="12%" align="center"><strong>Итого</strong></td>
                    <td width="12%" align="center"><strong>Тип билета</strong></td>
                </xsl:if>
            </tr>
            
            <xsl:apply-templates select="cart/items/item" mode="lin">
                <xsl:with-param name="eticket" select="$eticket" />
            </xsl:apply-templates>
        </table>
    </xsl:template>

    <xsl:template match="order" mode="summary">
        <xsl:param name="delivery"/>
        <xsl:param name="payment"/>

        <h2>Всего товаров: <xsl:value-of select="cart/summary/amount" /> шт.
            <xsl:variable name="total">
                <xsl:choose>
                    <xsl:when test="$payment != ''">
                        <xsl:value-of select="$payment + cart/summary/price"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="cart/summary/price"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <br /><strong>Сумма оплаты: <xsl:value-of select="$total" />руб.</strong>
        </h2>
    </xsl:template>

    <xsl:template match="item" mode="lin">
        <xsl:param name="eticket" select="'0'" />

        <xsl:variable name="date" select="document(concat('udata://custom/dateru/', @date))/udata"/>
        <tr>
            <td class="num">
                <xsl:value-of select="position()"/>
            </td>
            <td style="width:270px;">
                <strong class="name">
                    <xsl:value-of select="@action"/>
                </strong>
            </td>
            <td>
                <address><xsl:value-of select="@venue"/></address>
            </td>
            <td>
                <em class="date">
                    <xsl:value-of select="$date/d" disable-output-escaping="yes"/>
                </em><br />
                <span class="week-day">
                    <xsl:value-of select="$date/t"/>
                </span>
            </td>
            <td>
                <span class="book-place"><xsl:value-of select="@sector"/>, Ряд <xsl:value-of select="@row"/>,
                    <br/>Место
                    <xsl:value-of select="@seat"/>
                </span>
            </td>
            <td>
                <strong class="price">
                    <xsl:value-of select="@price"/> руб.
                </strong>
            </td>
            <xsl:if test="@link">
                <td>
                    <strong class="price">
                        <xsl:value-of select="@price_percent"/> руб.
                    </strong>
                </td>
                <td>
                    <strong class="price">
                        <xsl:value-of select="@price_total"/> руб.
                    </strong>
                </td>
            </xsl:if>
            
                <xsl:if test="@link"><td><br /><a href="{@link}">Скачать электронный билет</a></td></xsl:if>
                <xsl:if test="not(@link) and $eticket > 0"><td><br />"Электронный билет" недоступен! Получить оплаченный билет Вы может в нашем центральном офисе (см. п.2)</td></xsl:if>
            
        </tr>
    </xsl:template>

</xsl:stylesheet>