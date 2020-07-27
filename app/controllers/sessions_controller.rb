class SessionsController < ApplicationController


    get '/login' do #working!!!
        erb :'sessions/new'
    end

    post '/login' do  #working!!!
      @user = User.find_by_username(params[:user][:username])
         if @user && @user.authenticate(params[:user][:password])
           session[:user_id] = @user.id 
           redirect '/recipes'
         else
           erb :'sessions/new'
      end
    end
    
    get '/logout' do #working!!!
        session.clear
        redirect '/'
    end
end

#working!!!###working!!!#working!!!