class RecipesController < ApplicationController
 use Rack::Flash
 

    get '/recipes' do #working!!!
        @recipes = current_user.recipes
        erb :'recipes/index'
    end

    get '/recipes/new' do ##working!!!
        @recipe = Recipe.new
        erb :'recipes/new'
    end

    post '/recipes' do #working!!!
        set_recipes
        @recipe = current_user.recipes.build(params[:recipe])
        if @recipe.save
                redirect '/recipes'
      else
        flash.now[:error] = @recipe.errors.full_messages
             erb :'recipes/new'
        end 
    end

    get '/recipes/:id' do #working!!! 
      set_recipes
      if @recipe
            erb :'recipes/show'
       else
            redirect '/recipes'
       end 
    end

    get '/recipes/:id/edit' do #working!!!
        set_recipes
        if current_user 
            erb :'recipes/edit'
        else
            redirect '/recipes'
        end    
    end

    patch '/recipes/:id' do #working!!!
        set_recipes
     if @recipe.update(params[:recipe])
            redirect "/recipes/#{@recipe.id}"
        else
            erb :'recipes/edit'
       end
    end

    delete '/recipes/:id' do #working!!!
      set_recipes
        @recipe.destroy
        redirect '/recipes'
      end 
    
    private
  
    def set_recipes #working!!!
        @recipe = Recipe.find_by_id(params[:id])
    end
end


## THIS CONTROLLER WORKS