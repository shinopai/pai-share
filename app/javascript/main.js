$(function(){
  // slick
  $('.slider').slick({
        autoplay: true,
        autoplaySpeed: 4000,
        speed: 700,
        dots: true
  })

  // drawer
  var headerIcon = $('.header__icon');
  var drawerOverlay = $('.drawer__overlay');
  var drawerInner = $('.drawer__inner');

  headerIcon.click(
      function (e) {
        e.preventDefault();
        if($(this).hasClass('close')){
          drawerInner.animate({'left':'-252px'},500);
          drawerOverlay.css({
            'display': 'none'
          })
          $(this).attr('src', '/assets/ico_menu.gif').removeClass('close');
        }else{
          drawerInner.animate({'left':'0'},500);
          drawerOverlay.css({
            'display': 'block'
          })
          $(this).attr('src', '/assets/ico_close.gif').addClass('close');
        }
      }
  )

  // search form
  var searchForm = $('.search-form');

  $('.header__item--second').click(function(){
    if(searchForm.hasClass('active')){
      searchForm.animate({'top':'0'},500);
      searchForm.removeClass('active');
    }else{
      searchForm.addClass('active');
      searchForm.animate({'top':'80px'},500);
    }
  })
  $('.search-form__text').click(function(){
      searchForm.animate({'top':'0'},500);
      searchForm.removeClass('active');
  })

  // review & favorite
})
