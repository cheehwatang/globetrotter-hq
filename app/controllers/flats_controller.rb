class FlatsController < ApplicationController
  def index
    @flats = Flat.all.order(updated_at: :DESC)
  end
end
