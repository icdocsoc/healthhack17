(function($) {
    "use strict";

    $('body').scrollspy({
        target: '.fixed-top',
        offset: 60
    });

    $('a.page-scroll').bind('click', function(event) {
        var $ele = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($ele.attr('href')).offset().top - 60)
        }, 1450, 'easeInOutExpo');

        $(".nav-item").find(".active").removeClass("active");
        $ele.addClass("active");
        event.preventDefault();
    });

    $('#navbarNavAltMarkup a').click(function() {
        /* always close responsive nav after click */
        $('.navbar-toggler:visible').click();
    });

})(jQuery);
