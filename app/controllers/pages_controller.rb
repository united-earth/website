class PagesController < ApplicationController
  def about
    @at_about = true
  end

  def solutions
    @at_solutions = true
  end

  def donations
    @at_donations = true
  end
end
