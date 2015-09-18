$(document).on 'ready page:load', () ->
  if $('.landing').size() > 0
    $('.header__bgvid').get()[0].playbackRate = 0.4
    $('.parallax-container').on 'scroll', (e) ->
      if this.scrollTop < 600
        $('body').addClass('hide-header')
      else
        $('body').removeClass('hide-header')

      if this.scrollTop > 940
        $('body').addClass('stick-roadmap')
      else
        $('body').removeClass('stick-roadmap')

      if this.scrollTop > 2000 and this.scrollTop < 2700
        offset = this.scrollTop - 2000
        console.log offset
        subnavi = $('.learn-more__subnavi')
        console.log subnavi
        subnavi.css('margin-top', offset + 'px')

      if this.scrollTop < 2100
        $('.learn-more__subnavi *').removeClass('learn-more__subnavi_selected')
        $('.learn-more__subnavi_1').addClass('learn-more__subnavi_selected')

      if this.scrollTop > 2100
        $('.learn-more__subnavi *').removeClass('learn-more__subnavi_selected')
        $('.learn-more__subnavi_2').addClass('learn-more__subnavi_selected')

      if this.scrollTop > 2500
        $('.learn-more__subnavi *').removeClass('learn-more__subnavi_selected')
        $('.learn-more__subnavi_3').addClass('learn-more__subnavi_selected')

      if this.scrollTop > 1900
        $('.submenu .roadmap__points_item-1').addClass('roadmap__points_item-check')
        $('.submenu .roadmap__points_item-2').addClass('roadmap__points_item-selected')
      else
        $('.submenu .roadmap__points_item-1').removeClass('roadmap__points_item-check')
        $('.submenu .roadmap__points_item-2').removeClass('roadmap__points_item-selected')


      if this.scrollTop > 2750
        $('.submenu .roadmap__points_item-2').addClass('roadmap__points_item-check')
        $('.submenu .roadmap__points_item-3').addClass('roadmap__points_item-selected')
      else
        $('.submenu .roadmap__points_item-2').removeClass('roadmap__points_item-check')
        $('.submenu .roadmap__points_item-3').removeClass('roadmap__points_item-selected')

