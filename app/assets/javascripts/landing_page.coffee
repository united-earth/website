$(document).ready ()->
  $('.parallax-container').on 'scroll', (e) ->
    if this.scrollTop < 600
      $('body').addClass('hide-header')
    else
      $('body').removeClass('hide-header')
