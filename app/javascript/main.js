$(function(){
  // slick
  $('.slider').slick({
        autoplay: true,
        autoplaySpeed: 4000,
        speed: 700,
        dots: true
  })

  // drawer
  headerIcon = $('.header__icon');
  drawerOverlay = $('.drawer__overlay');
  drawerInner = $('.drawer__inner');

  headerIcon.click(
      function () {
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
})
