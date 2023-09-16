

document.querySelectorAll(".pagination div").forEach(function (p, index) {
    p.addEventListener("click", function () {
        $("header img").css("display", "none")
        $(".slide-text h1").css("animation-name", "")
        $(".slide-text p").css("animation-name", "")
        document.querySelectorAll(".pagination div").forEach(function (a) {
            a.classList.remove("pag-active")
        })
        document.querySelectorAll(".pagination div span").forEach(function (b) {
            b.classList.remove("span-active")
        })
        i = index
        $("header img").attr("src", `./image/${baza[i]}`)
        $("header .slide-text h1").text(text[i])
        p.classList.add("pag-active")
        $("header img").fadeIn(300)
        $(".slide-text h1").css("animation-name", "slideH1")
        $(".slide-text p").css("animation-name", "slideP")
    })
})

$(window).scroll(function () {
    if (this.scrollY>=47) {
       
        $("nav").css("position","fixed")
    }else{
        $("nav").css("position","")
       
    }
})




  document.querySelector("nav .bar-icon").addEventListener("click",function () {
    document.querySelector("nav .menu").style.display="block"
  })
  document.querySelector("nav .menu .fa-xmark").addEventListener("click",function () {
    document.querySelector("nav .menu").style.display="none"
  })


$("nav .navbar .search").click(function () {
    $(".search-item").show()
    $("body").css("overflow","hidden")

})

$(".search-item .fa-xmark").click(function () {
    $(".search-item").hide()
    $("body").css("overflow","auto")

})




///slider

$().ready(function(){
  $('.slick-carousel').slick({
    arrows: true,
    centerPadding: "0px",
    dots: true,
    slidesToShow: 1,
    infinite: false
  });
});


//wishlist///

$('.icon-wishlist').on('click', function(){
  $(this).toggleClass('in-wishlist');
});

///tab

$(document).ready(function(){ 
  $('.tab-a').click(function(e){  
   e.preventDefault();
    $(".tab").removeClass('tab-active');
    $(".tab[data-id='"+$(this).attr('data-id')+"']").addClass("tab-active");
    $(".tab-a").removeClass('active-a');
    $(this).parent().find(".tab-a").addClass('active-a');
   });
});



// prodct details slider active
$('.product-large-slider').slick({
  fade: true,
  arrows: false,
  asNavFor: '.pro-nav'
});


// product details slider nav active
$('.pro-nav').slick({
  slidesToShow: 4,
  asNavFor: '.product-large-slider',
  arrows: false,
  focusOnSelect: true
});

// image zoom effect
$('.img-zoom').zoom();






$(".minicart-btn").on('click', function(){
  $("body").addClass('fix');
  $(".minicart-inner").addClass('show')
})

$(".offcanvas-close, .minicart-close,.offcanvas-overlay").on('click', function(){
  $("body").removeClass('fix');
  $(".offcanvas-search-inner, .minicart-inner").removeClass('show')
})