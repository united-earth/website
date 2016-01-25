class ActionsController < ApplicationController
  before_filter :set_at_actions
  before_filter :set_submenu

  def index
    @at_actions_index = true
  end

  def uefestival
    @at_uefestival = true
    url = 'https://united-earth.vision/en/actions/uefestival'
    image = 'https://united-earth.vision/EUF16_FBpost_1200x900.jpg'
    set_meta_tags title: 'United Earth Festival 2016',
                  description: 'The United Earth Festival 2016 is a pilot project to effectively showcase and gather the existing abundance of practical and grassroots solutions, blueprints, technical guidance, social architectures and whole­systems transition strategies on o​ne integral co­creative platform. By gathering all solutions and intentionally aligned groups in one place, we can make them more visible to the world. Thus, everyone with an Internet connection will be able to access and contribute to a community­based global solutions library a​nd get a synergistic overview of real­time global and local collaboration and resource sharing possibilities.',
                  keywords: 'United, Earth, festival, movements, grassroots'

    set_meta_tags og: {
                      title:    'United Earth Festival 2016',
                      url:      url,
                      image:    image,
                      description: 'The United Earth Festival 2016 is a pilot project to effectively showcase and gather the existing abundance of practical and grassroots solutions, blueprints, technical guidance, social architectures and whole­systems transition strategies on o​ne integral co­creative platform. By gathering all solutions and intentionally aligned groups in one place, we can make them more visible to the world. Thus, everyone with an Internet connection will be able to access and contribute to a community­based global solutions library a​nd get a synergistic overview of real­time global and local collaboration and resource sharing possibilities.'
                  }
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
