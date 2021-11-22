class HomeController < ApplicationController
  def index
  end

  def mobile_gallery
    @stores = Store.all
  end
  
end
