class CountriesController < ApplicationController
  def index
  end
  
  def new
  @title="Add countries"
  end

  def create
  @countries = Countries.new(countries_params)
  @countries.save
  redirect_to @countries
  end
    
  def show
  @countries = Countries.find(params[:id])
  end

  private
  def countries_params
  params.require(:countries).permit(:countryname)
  end
  
end
