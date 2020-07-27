class UserController < ApplicationController
  

    get '/signup' do  #WORKING
        erb :'users/new'
    end

    post '/signup' do #WORKING
        @user = User.new(params[:user])
        if @user.save
          session[:user_id] = @user.id
          redirect '/recipes'
        else
           erb :'recipes/new'
        end
    end
end 