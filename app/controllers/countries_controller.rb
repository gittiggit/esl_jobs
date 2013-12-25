class CountriesController < ApplicationController
  def index
     @countries= Country.all
  end
  def new
  @title="Add Jobs"
  @country = Country.new
  end

  def create
  @country = Country.new(country_params)
  if @country.save
  redirect_to @country
  else
    render 'new'
  end
  end
    
  def show
  @countries = Country.all
  @country = Country.friendly.find(params[:id])
  @job_posts= @country.job_posts.paginate(:page => params[:page], :per_page => 10,:order => "updated_at DESC")
  end
  
  def edit
  @country = Country.friendly.find(params[:id])
  end
  
  def update
  @country = Country.friendly.find(params[:id])
  if @country.update(country_params)
    redirect_to @country
  else
    render 'edit'
  end
  end

  def destroy
  @country = Country.friendly.find(params[:id])
  @country.destroy
  redirect_to countries_path
  end

  private
  def country_params
  params.require(:country).permit(:countryname)
  end
end
