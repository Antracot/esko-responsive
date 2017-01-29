<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/entities.dtd">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

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
               
<script type="text/javascript" src="{$template-resources}js/visability.js"/>
<!--div class="overlay" style="background-color: #fff; display: block; height: 100%; left: 0px; opacity: 0.7; position: absolute; top: 0px; width: 100%; z-index: 10000;" onclick="hid_element('promo')">  </div>
               
               <div class="pr" style="z-index: 10000; display: block; overflow: no; cursor:pointer; left: 50%; top: 50%; margin-left: -313px; top: 260px; position:absolute;  box-shadow: 0 0 30px rgba(0,0,0,0.5); height:235px" id="promo">
<span onclick="hid_element('promo')"><a href="#"><img src="/i/space.gif" width="25" height="25" border="0" /></a></span>
<a href="/o_kompanii/publishing/s_nastupayuwim_novym_2016_godom/"><img src="/images/promo/ny2016.jpg" /></a></div-->

                <div class="conteiner">
                    <!-- Header -->
                    <xsl:call-template name="header"/>

                    <div class="wht1060 slider-t">
                        <div class="divsl2m" id="divsl2m_centering">
                            <div class="iosslider2">
                                <div class = 'slider'>
                                    <xsl:apply-templates select="document('udata://custom/insert/(upper)/0/true')/udata/items/item" mode="scroller"/>
                                </div>
                            </div>
                            <div class="sliderContainer2">
                                <div class = 'slideSelectors'></div>
                            </div>
                        </div>
                        <xsl:apply-templates select="document('udata://menu/draw/upper_main')/udata" mode="upper_main_menu"/>
                    </div>

                    <div class="wht1060 slider-t">
                        <xsl:apply-templates select="document('udata://menu/draw/down_main')/udata" mode="down_main_menu"/>
                        <div class="divsl3m">
                            <div class="iosslider3">
                                <div class='slider'>
                                    <xsl:apply-templates select="document('udata://custom/insert/(down)/0/true')/udata/items/item" mode="scroller"/>
                                </div>
                            </div>
                            <div class="sliderContainer3">
                                <div class='slideSelectors'></div>
                            </div>
                        </div>
                    </div>
                    <div class="newstitlem">
                        <h3>Новости</h3>

                        <div class="sliderContainer">
                            <div class='slideSelectors'></div>
                        </div>
                    </div>

                    <div class="iosslider">
                        <xsl:apply-templates select="document('usel://getData//news/rubric/')/udata" mode="news_index"/>
                    </div>

                    <div class="wht1060 botrght">
                        <ul class="right-fot-m-main">
                            <li>
                                <a href="/onlajn_zayavka/zapros_na_stroitelstvo_kotelnoj/" class="tmtt1">заявка на строительство объекта</a>
                            </li>
                            <li>
                                <a href="/onlajn_zayavka/raschet_modulnoj_kotelnoj/" class="tmtt2">расчет блочно-модульной котельной</a>
                            </li>
                            <li>
                                <a href="/onlajn_zayavka/selection/" class="tmtt3">подбор котла и горелки</a>
                            </li>
                            <li>
                                <a href="/o_kompanii/pismo_direktoru/" class="tmtt4">написать письмо директору</a>
                            </li>
                        </ul>
                        <img src="{$template-resources}images/xmain-fot-img12.jpg" alt="" title="" />
                    </div>


                    <div class="wht1060" >

                        <!-- YANDEX MAP -->
                        <!-- MAP HIDE WHEN VIEWPORT LESS 1200 PX --> 
                        <div class="maps-box-menu">

                        <div class="map_buttons">
                            <xsl:apply-templates select="document('udata://menu/draw/left')/udata" mode="left_menu"/>
                        </div> 
                        <div class="map_yan">
                            <div class="right-side-b">
                                <div class="tabs"><script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=xdGZuuIkSg6W9UCu9HnbCZriOH1QQnQg&amp;width=866&amp;height=262"></script></div>
                                <div class="tabs"><script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=QQhpyQY2iu0W-LWvmeBP3fJuaZ5UG0_W&amp;width=866&amp;height=262"></script></div>
                                <div class="tabs"><script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=2PtHlc5Xcb6bUJ1Qc6RlTLX9zAUPZExZ&amp;width=866&amp;height=262"></script></div>
                            </div>
                        </div>   
        
                        <!-- <xsl:template match="udata[@module = 'webforms'][@method = 'add'][@form_id = 142]" mode="forms"> -->
                        <!-- CALLBACK FORM SHOW WHEN VIEWPORT LESS 1200 PX -->
                        </div>
                        
                        <div class="callback_main_page">
                            
                        <form method="post" action="/webforms/send/" class="listoform mynewfr">
                             <input type="hidden" name="system_form_id" value="{@form_id}"/>
                             <input type="hidden" name="system_email_to" value="{.//item[@selected='selected']/@id}"/>
                             <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{@form_id}"/>

                                <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata"/>
                                <h3 class="nofountdsds"><br/><br/>Напишите нам:
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
                           <!-- </xsl:template> -->
                        </div>    
                        


                    </div>


                    <div class="end_content"></div>
                </div>

                <xsl:call-template name="footer"/>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>