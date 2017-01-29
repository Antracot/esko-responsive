$( document ).ready(function() {

        var my_height = document.body.offsetHeight;

        var logoWidht = $('#logo').outerWidth();
        var sliderWidht = $('#divsl2m_centering').outerWidth();
        var widhtWindow = $(window).width();
        var heightWindow = $(window).height();
        var setMargin = (widhtWindow - logoWidht) / 2;

        if(widhtWindow<520){
            $('.centering_logo').css('left', setMargin);
        }

        //HIDE not using links
        var id_num = 1;
        $(".ust-top1 li").each( function( index, element) {
            // var link_text = $(element).text();
            // console.log(link_text);
            $(element).attr("id", 'element'+id_num);
            id_num++;

        });

        $('#element1').css('display', 'none');
        $('#element4').css('display', 'none');
        $('#element9').css('display', 'none');


        window.onresize = function(event){
            var logoWidht = $('#logo').outerWidth();
            var widhtWindow = $(window).width();
            var setMargin = (widhtWindow - logoWidht) / 2;

            if(widhtWindow<520){
                $('.centering_logo').css('left', setMargin);
            } else if(widhtWindow<600){
                $('#logo').css('left', '0%');
            } else if(widhtWindow<700){
                $('#logo').css('left', '4%');
            } else if(widhtWindow<800){
                $('#logo').css('left', '2%');
            } else if(widhtWindow<1050){
                $('#logo').css('left', '3%');
            } else if(widhtWindow<1200){
                $('#logo').css('left', '0px');

            }


        };


            // HIDE ALL PLUS links
            $('.open_hide_menu').hide();
            $('.hide_menu').hide();
            $('.hide_menu').find('.open_hide_menu').hide();

            var id_each_elem = 0;


            //DETECT WHO HAS CHILDREN AND SHOW PLUS LINK
            $(".main_link").each( function( index, element) {
                // console.log( "id:", $( element).attr( "id"));
                var id_each_elem = $( element).attr("id");
                var children_elem = $('#'+id_each_elem).parent().parent().find('.hide_menu').length;


                // console.log("id: " + id_each_elem + " has " + children_elem + " children");


                if(children_elem>1){
                    $('#link'+id_each_elem).show();
                }

            });
       
            var ugol = 0;

            //FUNC OPEN HIDE MENU
            $('.open_hide_menu').on('click', function(){
                ugol += 45;
                $(this).parent().parent().find('.hide_menu').slideToggle(1000);
                $(this).css('transform', 'rotate('+ ugol+'deg)'); 
                // console.log('click');
            });

            //DETECT IOS DEVICES
            var iOS = !!navigator.platform && /iPad|iPhone|iPod/.test(navigator.platform);
            console.log(iOS);

            //CATCH TOUCH EVENT on IPHONE
            $.fn.touchScrolling = function(){
                var startPos = 0,
                    self = $(this);

                self.bind('touchstart', function(event) {
                    var e = event.originalEvent;
                    startPos = self.scrollTop() + e.touches[0].pageY;
                    e.preventDefault();
                    console.log('touchstart');
                });
                
                // self.bind('touchmove', function(event) {
                //     var e = event.originalEvent;
                //     self.scrollTop(startPos - e.touches[0].pageY);
                //     e.preventDefault();
                //     console.log('touchmove');
                // });

            };


            // var iii = document.body.offsetHeight;
            // var aaa = document.body.scrollTop;
            // $( "body" ).scroll(function() {
            //     console.log(aaa, iii);

            // });


        var $menu = $(".line_menu");

        $("body").scroll(function(){
            if ( $(this).scrollTop() > 60){
                // $menu.removeClass("default").addClass("fixed");
                $menu.css('position', 'absolute');
                console.log("less");

            } else if($(this).scrollTop() <= 60 ) {
                // $menu.removeClass("fixed").addClass("default");
                $menu.css('position', 'fixed');
                console.log('fffff');
            }
        });


});                