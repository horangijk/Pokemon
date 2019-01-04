class PokeballsController < ApplicationController

  def new
    @pokeball = Pokeball.new
    @pokemons = Pokemon.all
  end

  def create
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.user_id = session[:user_id]

    if @pokeball.save
      redirect_to @pokeball.pokemon
    else
      render :new
    end
  end

  def destroy
    @pokeball = Pokeball.find(params[:id])
    @user = @pokeball.user
    @pokeball.destroy
    redirect_to user_path(@user)
  end


  private
  def pokeball_params
    params.require(:pokeball).permit(:pokemon_id)
  end
end
