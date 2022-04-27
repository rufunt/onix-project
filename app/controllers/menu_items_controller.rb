class ManuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[ show edit update destroy ]
  def index; end

  def new
    @menu_item = MenuItem.new
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def edit; end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to menu_item_url(@menu_item)
    else
      render 'new'
    end
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to menu_item_url(@menu_item), notice: "MenuItem was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to managers_url, notice: "MenuItem was successfully destroyed."
  end
end

private
  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:title, :description, :image_url, :price)
  end