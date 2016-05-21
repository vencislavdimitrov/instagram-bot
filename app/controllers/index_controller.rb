class IndexController < ApplicationController
  def index
  end

  def connect
    redirect Instagram.authorize_url(:redirect_uri => 'localhost:3000/callback')
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect "/nav"
  end
end
