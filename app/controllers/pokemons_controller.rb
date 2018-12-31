class PokemonsController < ApplicationController
  before_action :authenticate, only: [:edit, :destroy]
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    redirect_to @pokemon
  end

  def edit
    
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end

  def authenticate
    redirect_to new_session_path unless logged_in?
end
end
