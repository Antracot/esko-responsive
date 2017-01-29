<xsl:stylesheet	version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="header">
        <div class="line_menu">
        <div class="phone_mob_size">
            <a class="top_phone" href="tel:+74953747080">+7 (495) 374-70-80</a>
        </div>
            <div class="menu_btn_wrap">
                <div class="container123" onclick="myFunction(this)">
                    <div class="bar1"></div>
                    <div class="bar2"></div>
                    <div class="bar3"></div>
                </div>                
               <a href="#menu_mobile" id="toggle_menu"><span></span></a>
            </div>
        </div>

            <script type="text/javascript">
                <xsl:text>
               
                //OPEN MOBILE MENU
                function myFunction(x) {
                    x.classList.toggle("change");
                    $(".mobile_menu_open").slideToggle(700);
                    $(".mobile_menu_open").css('display', 'block');
                }

                //OPEN MOBILE MENU
                $(".container123").click(function(){
                    });

                </xsl:text>
            </script>
            <!-- style="display: none" -->
        <div class="mobile_menu_open" style="display: none" id="mobile_menu_open">
            <div class="menu_wrap">
                <xsl:apply-templates select="document('udata://menu/draw/mobile')/udata" mode="mobile"/>
                <a class="mail_in_mob_menu" href="mailto:info@esko-industry.ru">Отправить письмо</a>  
            </div>
        </div>

        <xsl:variable name="headerInfo" select="document('upage://2')//page" />
        <div id="header">
                <a class="centering_logo" href="http://{$domain}" id="logo">Эско индустрия</a>
                    <div class="namecomp">
                        <h3>КОТЕЛЬНОЕ ОБОРУДОВАНИЕ ОТ ПРОИЗВОДИТЕЛЯ</h3>
                        СТРОИТЕЛЬСТВО, ПРОЕКТИРОВАНИЕ, ПРОДАЖА, АРЕНДА
                        <h3 class="slogan_down">МЫ РАБОТАЕМ ПО ВСЕЙ РОССИИ И СНГ</h3>
                    </div>

            <xsl:apply-templates select="document('udata://menu/draw/main')/udata" mode="default_main_menu"/>

            <div class="rab-info">
                <div class="comagic_phone"><a class="phone_link" href="tel:+74953747080"><xsl:value-of select="$headerInfo//property[@name = 'phones']/value" /></a></div>
                <div class="email_comp"><xsl:value-of select="$headerInfo//property[@name = 'emails']/value" /></div>
                <div class="timer"><address><xsl:value-of select="$headerInfo//property[@name = 'times']/value" /></address></div>
            </div>

            <!--xsl:apply-templates select="document('udata://system/getLangsList')/udata" /-->

            <xsl:apply-templates select="document('udata://search/insert_form')/udata"/>
        </div>
	</xsl:template>

</xsl:stylesheet>