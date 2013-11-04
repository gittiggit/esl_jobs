class CountriesController < ApplicationController
  def index
  end
  def new
  @title="Add Jobs"
  end

  def create
  @country = Country.new(country_params)
  @country.save
  redirect_to @country
  end
    
  def show
  @country = Country.find(params[:id])
  end

  private
  def country_params
  params.require(:country).permit(:countryname)
  end
end
