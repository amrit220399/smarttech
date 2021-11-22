class HomeController < ApplicationController
  def index
  end

  def mobile_gallery
    @stores = Store.all
  end
  
  def search_results
    keyword="%" + params[:search_keyword].to_s + "%"
    @stores = Store.find_by_sql ["Select * from stores WHERE product_name like ? or product_type like ? or brand like ? or color like ? or description like ?",keyword,keyword,keyword,keyword,keyword]
  end

end
