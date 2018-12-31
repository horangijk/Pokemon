class PokeballsController < ApplicationController

  def new
    @pokeball = Pokeball.new
  end

  def create
    @pokeball = Pokeball.create(pokeball_params)
    if @pokeball.save
      redirect_to @pokeball.pokemon
    else
      render :new
    end
  end




  private
  def pokeball_params
    params.require(:pokeball).permit(:user_id, :pokemon_id)
  end
end
