$(document).on 'ready page:load', () ->
  loggedIn = ($('body').attr('data-logged-in') != undefined)
  stickRoadmapScrollPos = 1050
  stickRoadmapScrollPos = 1180 if window.mobilecheck()
  signupScrollPos = 2750
  signupScrollPos = 3500 if window.mobilecheck()
  if $('.landing').size() > 0
    $('[data-collapse]').each (index, element)->
      target = $(element).attr('data-collapse')
      target = $(target)
      $(element).click ()->
        target.toggleClass('in')
        $(element).toggleClass('in')
        if target.hasClass('in')
          target.get(0).style.height = target.get(0).scrollHeight.toString() + "px"
        else
          target.get(0).style.height = 0

    scrollLink = (linkItem, targetItem)->
      $(linkItem).click ()->
        target = $(targetItem)
        $('.parallax-container').animate({
          scrollTop: target.position().top - 40
        }, 500);



    scrollLink('.header__arrow-down', '#roadmap')
    scrollLink('.roadmap__points_item-1', '#video')
    scrollLink('.roadmap__points_item-2', '#learn-more')
    scrollLink('.roadmap__points_item-3', '#signup')


    $('.header__bgvid').get()[0].playbackRate = 0.4
    $('.parallax-container').on 'scroll', (e) ->
      if $('.header__logo').offset().top > 0
        $('body').addClass('hide-header')
      else
        $('body').removeClass('hide-header')

      if $('.roadmap .roadmap__points').offset().top < 90
        $('body').addClass('stick-roadmap')
      else
        $('body').removeClass('stick-roadmap')

      if this.scrollTop > 1600 and this.scrollTop < 2250
        offset = this.scrollTop - 1600
        subnavi = $('.learn-more__subnavi')
        subnavi.css('margin-top', offset + 'px')

      if this.scrollTop < 1800
        $('.learn-more__subnavi *').removeClass('learn-more__subnavi_selected')
        $('.learn-more__subnavi_1').addClass('learn-more__subnavi_selected')

      if this.scrollTop > 1900
        $('.learn-more__subnavi *').removeClass('learn-more__subnavi_selected')
        $('.learn-more__subnavi_2').addClass('learn-more__subnavi_selected')

      if this.scrollTop > 2200
        $('.learn-more__subnavi *').removeClass('learn-more__subnavi_selected')
        $('.learn-more__subnavi_3').addClass('learn-more__subnavi_selected')

      if this.scrollTop > 1650
        $('.submenu .roadmap__points_item-1').addClass('roadmap__points_item-check')
        $('.submenu .roadmap__points_item-2').addClass('roadmap__points_item-selected')
      else
        $('.submenu .roadmap__points_item-1').removeClass('roadmap__points_item-check')
        $('.submenu .roadmap__points_item-2').removeClass('roadmap__points_item-selected')


      if $('#signup').offset().top < 500
        $('.submenu .roadmap__points_item-2').addClass('roadmap__points_item-check')
        $('.submenu .roadmap__points_item-3').addClass('roadmap__points_item-selected')
      else
        $('.submenu .roadmap__points_item-2').removeClass('roadmap__points_item-check')
        $('.submenu .roadmap__points_item-3').removeClass('roadmap__points_item-selected')

      if loggedIn
        $('.roadmap__points *').addClass('roadmap__points_item-check')

    $('.landing__signup__groups').slick {
      adaptiveHeight: true,
      slidesToShow: 4,
      arrows: false,
      dots: false,
      autoplay: true
    }
