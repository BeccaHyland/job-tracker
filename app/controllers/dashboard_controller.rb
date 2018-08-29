class DashboardController < ApplicationController
  def index
    @five_stars = 1
    @four_stars = 1
    @three_stars = 1
    @two_stars = 1
    @one_stars = 1
  end
end