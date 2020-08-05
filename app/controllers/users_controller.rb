class UserController < ApplicationController
    use Rack::Flash
   

    get '/signup' do  #WORKING
        erb :'users/new'
    end

    post '/signup' do #WORKING
      @user = User.new(params[:user])
        if @user.save
          session[:user_id] = @user.id
          redirect '/recipes'
        else
            flash.now[:error] = @user.errors.full_messages
           erb :'users/new'
        end
    end
end 