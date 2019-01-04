class PokemonsController < ApplicationController
  before_action :authenticate, only: [:edit, :destroy] #Everytime I edit or delete user, it goes back to sessions/new. Why is that? session[:user_id] is nil.
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

  def update

  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.pokeballs.destroy(pokeball)
    redirect to pokemons_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end

  def authenticate
    redirect_to new_session_path unless logged_in?
  end
end
