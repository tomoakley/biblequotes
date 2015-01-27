var ready;

ready = function() {
    $(".menu-btn").on("click", function(e) {
        e.preventDefault();
        $(".side-menu-container").toggleClass("is-active");
    });

    $(".next-btn").on("click", function(e) {
        e.preventDefault();
        $(".main-quote").load("/quotes .main-quote");
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);
