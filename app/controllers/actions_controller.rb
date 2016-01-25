class ActionsController < ApplicationController
  before_filter :set_at_actions
  before_filter :set_submenu

  def index
    @at_actions_index = true
  end

  def uefestival
    @at_uefestival = true
  end

  def gathering
    @at_gathering = true
  end

  def com21
    @at_com21 = true
    url = 'https://united-earth.vision/en/actions/com21'
    image = 'https://united-earth.vision/COM21_cover.jpg'
    set_meta_tags title: 'COM21 - The Conference of the Movements',
                  description: 'A United Earth International Grassroots Event that is designed to catalyze a wave of planetary unity and collaboration towards a whole-systems transformation of human society',
                  keywords: 'United, Earth, conference, movements, com21'

    set_meta_tags og: {
                      title:    'COM21 - The Conference of the Movements',
                      url:      url,
                      image:    image,
                      description: 'A United Earth International Grassroots Event that is designed to catalyze a wave of planetary unity and collaboration towards a whole-systems transformation of human society'
                  }
  end

  def un_solutions_summit
    @at_un = true
  end

  private
    def set_at_actions
      @at_actions = true
    end
end
