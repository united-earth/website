$(document).on 'ready page:load', () ->
  $('.menu__menu').click ()->
    $('.menu').toggleClass('expand')