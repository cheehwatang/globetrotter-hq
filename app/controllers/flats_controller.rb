class FlatsController < ApplicationController
  def index
    @flats = Flat.all.order(updated_at: :DESC)
  end

  def show
    @flat = Flat.find(params[:id])
  end
end
