class ActionsController < ApplicationController
  before_filter :set_at_actions
  before_filter :set_submenu

  def gathering
    @at_gathering = true
  end

  def com21
    @at_com21 = true
  end

  def un_solutions_summit
    @at_un = true
  end

  private
    def set_at_actions
      @at_actions = true
    end
end
