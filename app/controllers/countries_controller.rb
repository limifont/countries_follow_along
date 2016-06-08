class CountriesController < ApplicationController
 before_action :country, except: [:index, :new, :create]
 
  def index
    @countries = Country.all
  end

  def show
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      flash[:success] = 'Country created!'
      redirect_to country_path(@country)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      flash[:success] = 'Country updated!'
      redirect_to country_path
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    flash[:success] = 'Country deleted!'
    redirect_to countries_path
  end

  private
    def country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :population, :age, :language)
    end

end
