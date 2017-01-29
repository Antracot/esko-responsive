/**
 * Created by 1 on 24.08.14.
 */
$(document).ready(function(){
    if (document.forms['reg']) restoreFormData(document.forms['reg']);
    if (document.forms['ord']) restoreFormData(document.forms['ord']);

    if ($('select.relation').length) optionedRelation();

    var olId = 0;
    $('.tbs').each(function(index){
        var trigger = $(this).parent().find('input[name="trigger"]');

        olId = index == 0 ? this.id : olId;

        if (trigger.val() == 'active') olId = this.id;
    });
    if (olId && olId != undefined) {
        $('.tabset a').each(function(){
            $(this).removeClass('opener');
            if (olId == this.hash) $(this).addClass('opener');
        });
    }

    var tabContainers = $('div.tab');
    tabContainers.hide().filter('.opener').show();
    $('.tabset a').click(function () {
        tabContainers.hide();
        tabContainers.filter(this.hash).show();
        $('.tabset a').parent().removeClass('active');
        $(this).parent().addClass('active');
        return false;
    }).filter('.opener').click();

    $(".validateform").validate({
        submitHandler: function(form) {
            if (form.pageId) {
                try { rrApi.addToBasket(form.pageId.value) } catch(e) {}
                rrApiOnReady.push(function() {
                    try {
                        rrApi.order({
                            transaction: Math.random(),
                            items: [
                                { id: form.pageId.value, qnt: 1,  price: 0},
                            ]
                        });
                    } catch(e) {}
                });
                if (form.email) rrApiOnReady.push(function() { rrApi.setEmail(form.email.value); });
            } else {
                saveFormData(form);
            }
            form.submit();
        }
    });
    $(".registrate").validate({
        submitHandler: function(form) {
            form.elements["trigger"].value = 'active';
            saveFormData(form);
            form.submit();
        }
    });
    $(".login").validate();

    $(".relation").change(optionedRelation);

    function optionedRelation() {
        var elementId = $('.object').attr("umi:element-id");
        var selected = $('select.relation').find("option:selected");
        var selectedName = $('select.relation').attr('name');
        var selectedValue = selected.val();
        $.fancybox.showLoading();
        $.getJSON('/udata/custom/getRelationParams/'+elementId+'/'+selectedName+'/(146,147)/'+selectedValue+'/.json', {},
            function(data){
                if (!data.min_work_pressure) {
                    $('.prices .totalBlock, .rampBlock').hide();
                    $.fancybox.hideLoading();
                    return false;
                }
                $(".min_work_pressure").html(data.min_work_pressure[0]);
                $(".max_work_pressure").html(data.max_work_pressure[0]);
                $.getJSON('/udata/custom/getOptionedPrice/'+elementId+'/'+selectedValue+'/'+data.max_work_pressure[0]+'/.json', {},
                    function(response){
                        if (response.result) {
                            $('.prices .totalBlock, .rampBlock').show();
                            var $result = response.result;
                            if ($result.discount > 0){
                                $('.prices .totalPrice').next('em').html($result.total)
                                    .next('span').html($result.total_dis);
                                $('.prices .burnerPrice').next('em').html($result.burner)
                                    .next('span').html($result.burner_dis);
                                $('.prices .rampPrice').next('em').html($result.ramp)
                                    .next('span').html($result.ramp_dis);
                            } else {
                                $('.prices .totalPrice').next('span').html($result.total);
                                $('.prices .burnerPrice').next('span').html($result.burner);
                                $('.prices .rampPrice').next('span').html($result.ramp)
                            }

                        }
                    }
                );
                $.fancybox.hideLoading();
            }
        );
    }

    //Формируем кнокпи навигации
    $(".slider").each(function () {
        var slide = $(this).find(".slide").length;
        var $slideSelectors = $(this).parent().parent().find('.slideSelectors');
        if ($(this).parent().hasClass("iosslider")) {
            $slideSelectors = $(".newstitlem").find('.slideSelectors');
        }
        for (var i = 0; i < slide; i++) {
            $slideSelectors.append("<div class = 'item'></div>");
        }
        $slideSelectors.find(".item:first-child").addClass("selected");
    });

    $('input[name*="_mvt"], input[name*="_gcal"], input[name*="_m2"]').bind("change, keyup", function() {
        var $this = $(this);
        var value = $this.val().replace(',', '.').replace(' ', '');
        var inputs = $this.parent().find('input');

        if (inputs.length > 1) {
            inputs.each(function(){
                var name = this.name;
                var v = this.value;
                if (name.match(/_mvt/gi) && v != value) {
                    if ($this.attr('name').match(/_gcal/gi)) v = value * 1.163;
                    if ($this.attr('name').match(/_m2/gi)) v = value * 0.0001;
                }
                if (name.match(/_gcal/gi) && v != value) {
                    if ($this.attr('name').match(/_mvt/gi)) v = value * 0.859845228;
                    if ($this.attr('name').match(/_m2/gi)) v = value * 0.000085985;
                }
                if (name.match(/_m2/gi) && v != value) {
                    if ($this.attr('name').match(/_mvt/gi)) v = value * 10000;
                    if ($this.attr('name').match(/_gcal/gi)) v = value * 11630;
                }
                $(this).val(v);
            });
        }
    });

    setTimeout(function () {
        $('.iosslider').iosSlider({
            desktopClickDrag: true,
            snapToChildren: true,
            infiniteSlider: true,
            snapSlideCenter: true,
            navSlideSelector: '.sliderContainer .slideSelectors .item',
            onSlideChange: slideChange
        });

        $('.iosslider2').iosSlider({
            desktopClickDrag: true,
            snapToChildren: true,
            navSlideSelector: '.sliderContainer2 .slideSelectors .item',
            onSlideChange: slideChange2
        });

        $('.iosslider3').iosSlider({
            desktopClickDrag: true,
            snapToChildren: true,
            navSlideSelector: '.sliderContainer3 .slideSelectors .item',
            onSlideChange: slideChange3
        });

        function slideChange2(args) {
            $('.sliderContainer2 .slideSelectors .item').removeClass('selected');
            $('.sliderContainer2 .slideSelectors .item:eq(' + (args.currentSlideNumber - 1) + ')').addClass('selected');
        }

        function slideChange(args) {
            $('.sliderContainer .slideSelectors .item').removeClass('selected');
            $('.sliderContainer .slideSelectors .item:eq(' + (args.currentSlideNumber - 1) + ')').addClass('selected');
        }

        function slideChange3(args) {
            $('.sliderContainer3 .slideSelectors .item').removeClass('selected');
            $('.sliderContainer3 .slideSelectors .item:eq(' + (args.currentSlideNumber - 1) + ')').addClass('selected');
        }
    }, 200);
	
	
	$(".maps-box-menu .left-side-b a").click(function(){
		$(".maps-box-menu .left-side-b a").removeClass("active");
		$(this).addClass("active");
		var ind = $(".maps-box-menu .left-side-b a").index(this);
		$(".tabs").hide();
		$(".right-side-b  .tabs").eq(ind).fadeIn();
		return false;
	});

    $(".zformonlinet").click(function(){
        var cl = this.hash.replace('#', '');
        $("." + cl).toggle();
        return false;
    });

    $(".cliashtrs a").click(function(){
        //$(".tabscat").hide();
        var idboxca = $(this).attr("attt-box");
        $(idboxca).toggle();
        if($(this).hasClass("active")){
            $(this).removeClass("active");
        }else{
            $(this).addClass("active");
        }
        return false;
    });

    if (location.search.match(/fields_filter/)) $(".bodyFilter").show();

    $(".filtertitlre h3, .arrbottom").click(function(){
        $(".bodyFilter").toggle();
        return false;
    });

    $(".box1FilterB span").each(function(){
        var tabFilter = $(this).attr("attt-box");
        if ($(this).hasClass("active")) $(tabFilter).show();
    });

    $('.iosslider233').iosSlider({
        desktopClickDrag: true,
        navPrevSelector: '.nextSlidersT',
        navNextSelector: '.prevSlidersT'
    });
});