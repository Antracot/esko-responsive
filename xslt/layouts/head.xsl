<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="head">
        <head>
            <meta http-equiv="expires" content="0"/>
            <meta http-equiv="cache-control" content="no-cache, no-store"/>
            <meta http-equiv="pragma" content="no-cache"/>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
            <meta name="viewport" content="width=device-width, height=device-height, user-scalable=no, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0"/>
            <!-- <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"> -->
            <meta name="description" content="{result/meta/description}"/>
            <meta name="keywords" content="{result/meta/keywords}"/>
            <meta name="author" content=""/>

            <title>
                <xsl:value-of select="/result/@title"/>
            </title>

            <link rel="shortcut icon" type="image/x-icon" href="{$template-resources}favicon.ico"/>
            <link rel="stylesheet" type="text/css" href="{$template-resources}css/style.css"/>
            <link rel="stylesheet" type="text/css" href="{$template-resources}css/bootstrap.min.css"/>
            <link rel="stylesheet" type="text/css" href="{$template-resources}css/media.css"/>
            <link rel="stylesheet" type="text/css" href="{$template-resources}font/black/styles.css"/>
            <link rel="stylesheet" type="text/css" href="{$template-resources}font/regular/styles.css"/>
            <link rel="stylesheet" type="text/css" href="{$template-resources}font/medium/styles.css"/>
            <link rel="stylesheet" type="text/css" href="{$template-resources}css/jquery.fancybox.css" media="screen" />

            <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" /> -->
            <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" /> -->
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js" />

          
            <script src=""></script>

          
            <script type="text/javascript">
                var rrPartnerId = "5644a8a71e9947340c34c320";
                var rrApi = {};
                var rrApiOnReady = rrApiOnReady || [];
                rrApi.addToBasket = rrApi.order = rrApi.categoryView = rrApi.view =
                rrApi.recomMouseDown = rrApi.recomAddToCart = function() {};
                (function(d) {
                    var ref = d.getElementsByTagName('script')[0];
                    var apiJs, apiJsId = 'rrApi-jssdk';
                    if (d.getElementById(apiJsId)) return;
                    apiJs = d.createElement('script');
                    apiJs.id = apiJsId;
                    apiJs.async = true;
                    apiJs.src = "//cdn.retailrocket.ru/content/javascript/api.js";
                    ref.parentNode.insertBefore(apiJs, ref);
                }(document));
            </script>          
            <script type="text/javascript" src="{$template-resources}js/custom.js"/>
            <script type="text/javascript" src="{$template-resources}js/bootstrap.min.js"/>
            <script type="text/javascript" src="{$template-resources}js/support_script.js"/>
            <script type="text/javascript" src="{$template-resources}js/"/>
            <script type="text/javascript" src="{$template-resources}js/jquery.fancybox.pack.js"/>
            <script type="text/javascript" src="{$template-resources}js/jquery.iosslider.js" />
            <script type="text/javascript" src="/js/client/formsRestore.js"/>
            <script type="text/javascript"
                    src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"/>
            <script type="text/javascript"
                    src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/localization/messages_ru.js"/>
            <script type="text/javascript" src="{$template-resources}js/map.js"/>
            <script type="text/javascript" src="{$template-resources}js/jquery.fancybox.pack.js"/>
            <script type="text/javascript" src="{$template-resources}js/jquery.mousewheel.pack.js"/>

            <script src=""></script>



            <script type="text/javascript" src="{$template-resources}js/fancy_main.js"/>

            <xsl:if test="$module = 'catalog' and $method = 'category'">
                <script type="text/javascript" src="{$template-resources}js/push1.js"/>
            </xsl:if>
            <xsl:if test="$module = 'catalog' and $method = 'object'">
                <script type="text/javascript" src="{$template-resources}js/push2.js"/>
            </xsl:if>
        <meta name="google-site-verification" content="0dr3T3phxuN_G5MTD9er88-RLpKDbI42xxqAHUlMRXU" />
        </head>
    </xsl:template>

</xsl:stylesheet>