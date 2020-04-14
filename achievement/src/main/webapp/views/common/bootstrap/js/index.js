function adjustHeightOfPage(pageNo) {
    var offset = 80;
    var pageContentHeight = 0;
    pageContentHeight = $(".cd-hero-slider li:nth-of-type(" + pageNo + ") .tm-img-gallery-container").height();
    
    if($(window).width() >= 992) { offset = 120; }
    else if($(window).width() < 480) { offset = 40; }
   
    // Get the page height
    var totalPageHeight = $('.cd-slider-nav').height()
                            + pageContentHeight + offset
                            + $('.tm-footer').height();

    // Adjust layout based on page height and window height
    if(totalPageHeight > $(window).height()) 
    {
        $('.cd-hero-slider').addClass('small-screen');
        $('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css("min-height", totalPageHeight + "px");
    }
    else 
    {
        $('.cd-hero-slider').removeClass('small-screen');
        $('.cd-hero-slider li:nth-of-type(' + pageNo + ')').css("min-height", "100%");
    }
}

$(window).load(function(){
    adjustHeightOfPage(1); // Adjust page height
    $('#tmNavbar a').click(function(){
        $('#tmNavbar').collapse('hide');
        adjustHeightOfPage($(this).data("no")); // Adjust page height       
    });

    $( window ).resize(function() {
        setTimeout(function() {
            adjustHeightOfPage(1);
        }, 1000);
    });
    $('body').addClass('loaded');
});