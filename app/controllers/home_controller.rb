class HomeController < ApplicationController
  #before_filter :authenticate_user!
  def index
  	@text = 'welcome to quickfyre'
  end
end
