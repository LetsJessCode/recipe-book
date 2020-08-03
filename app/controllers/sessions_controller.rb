class SessionsController < ApplicationController
  use Rack::Flash

    get '/login' do #working!!!
        erb :'sessions/new'
    end

    post '/login' do  #working!!!
      @user = User.find_by_username(params[:user][:username])
         if @user && @user.authenticate(params[:user][:password])
           session[:user_id] = @user.id 
           redirect '/recipes'
         else
          flash.now[:error] = ["Username or password didn't match"]
           erb :'sessions/new'
      end
    end
    
    get '/logout' do #working!!!
        session.clear
        flash[:notice] = "Logout Successful"
        redirect '/'
    end
end

#working!!!###working!!!#working!!!