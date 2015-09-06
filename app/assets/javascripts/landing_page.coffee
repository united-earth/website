$(document).ready ()->
  $('.parallax-container').on 'scroll', (e) ->
    if this.scrollTop < 600
      $('body').addClass('hide-header')
    else
      $('body').removeClass('hide-header')

    if this.scrollTop > 910
      $('body').addClass('stick-roadmap')
    else
      $('body').removeClass('stick-roadmap')
