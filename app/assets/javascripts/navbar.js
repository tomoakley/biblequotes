var ready;

ready = function() {
    $(".dropdown-container .nav-btn").on("click", function(e) {
        e.preventDefault();
        var thisMenu = $(this).parent(".dropdown-container");
        $(".dropdown-container").not(thisMenu).removeClass("is-active");
        if (thisMenu.hasClass("is-active")) {
            thisMenu.removeClass("is-active");
        } else {
            thisMenu.toggleClass("is-active");
        }
    });

    $(".next-btn").on("click", function(e) {
        e.preventDefault();
        $(".main-quote").load("/quotes .main-quote");
    });
    $(".share-btn").on("click", function(e) {
        e.preventDefault();
        $("body").append("<div class='overlay'></div>");
        $(".share-sheet").addClass("is-active");
    });

    $(".cancel-button").on("click", function(e) {
        e.preventDefault();
        $(".overlay").remove();
        $(".share-sheet").removeClass("is-active");
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);
