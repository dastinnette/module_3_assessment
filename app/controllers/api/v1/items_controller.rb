class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  private

  def item_params
    params.permit(:id,
                  :name,
                  :description,
                  :created_at,
                  :updated_at)
  end

end
