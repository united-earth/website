$(document).on 'ready page:load', () ->
  if $('.actions__content-un-intro').size() > 0
    $('.parallax-container').on 'scroll', (e) ->
      if this.scrollTop > 50
        $('.actions__un_background').addClass('transparent')
      else
        $('.actions__un_background').removeClass('transparent')


  if $('.actions__ue-festival').size() > 0
    $('.parallax-container').on 'scroll', (e) ->
      if this.scrollTop > 100
        $('body').addClass('hide-header')
      else
        $('body').removeClass('hide-header')