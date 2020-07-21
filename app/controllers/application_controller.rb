require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, 'kodak_pageant_rules'
  end

  get "/" do
    if logged_in?
      redirect "/films"
    else  
    erb :welcome
    end
  end
  
  helpers do 
    
    def current_user
    @current_user ||= User.find_by_id(session[:user_id]) 
    end
  
    def logged_in?
    !!current_user
    end

    def set_film
      @film = current_user.films.find_by_id(params[:id])
    end
    
  end

end
