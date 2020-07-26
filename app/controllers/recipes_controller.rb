class RecipesController < ApplicationController

    get '/recipes' do
        @recipes = current_user.recipes
        erb :'recipes/index'
    end

    get '/recipes/new' do
        @recipe = Recipe.new
        erb :'recipes/new'
    end

    post '/recipes' do
        set_recipes
        @recipe = current_user.recipes.build(params[:recipe])
        if @recipe.save
                redirect '/recipes'
      else
             erb :'recipes/new'
        end 
    end

    get '/recipes/:id' do
      set_recipes
      if @recipe
            erb :'recipes/show'
       else
            redirect '/recipes'
       end 
    end

    get '/recipes/:id/edit' do
        set_recipes
        erb :'recipes/edit'
    end

    patch '/recipes/:id' do
        set_recipes
     if @recipe.update(params[:recipe])
            redirect "/recipes/#{@recipe.id}"
        else
            erb :'recipes/edit'
       end
    end

    delete '/recipes/:id' do
      set_recipes
        @recipe.destroy
        redirect '/recipes'
    end
  
    def set_recipes
        @recipe = Recipe.find_by_id(params[:id])
    end
end