class FlatsController < ApplicationController
  def index
    @query = params[:query]
    @flats = Flat.order(updated_at: :DESC)
    if @query
      @flats = Flat.where("name LIKE '%#{@query}%'").order(updated_at: :DESC)
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path, alert: "Flat was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    if @flat.save
      redirect_to flat_path(@flat), alert: "Flat was successfully edited."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    redirect_to flats_path, alert: "Flat was successfully removed."
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :picture_url, :price_per_night, :number_of_guests)
  end

  # def search_params
  #   raise
  #   params.require(:search).permit(:term)
  # end
end
