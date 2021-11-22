class AdminController < ApplicationController
 

  def is_admin_logged_in?
    if session[:admin].nil?
      return FALSE
    else
      return TRUE
    end
  end
  
  
  def login_admin
    if is_admin_logged_in?
      redirect_to :controller => :admin , :action => :dashboard
    end
    if request.post?
      if params[:adminuser] == "amrit@admin.com" && params[:adminpassword] == "amrit123"
        session[:admin] = "admin"
        redirect_to :action => :dashboard
      else
        flash[:msg] = "Invalid Admin Credentials!"
        render :action => :login_admin
      end
    end
  end

  def logout_admin
    session[:admin] = nil
    flash[:msg] = "You are successfully logout!"
    redirect_to :action => :login_admin
  end

  def dashboard
    if !is_admin_logged_in?
      redirect_to :controller => :admin , :action => :login_admin
     
    end

 
  end
end
