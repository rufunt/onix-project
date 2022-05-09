class CooksController < ApplicationController
  before_action :set_cook, only: %i[ show edit update destroy ]
  before_action :authenticate_cook!, only: %i[ show edit update destroy ]

  def index
    @cooks = Cook.all
  end

  def new
    @cook = Cook.new
  end

  def show; end

  def edit; end

  def create
    @cook = Cook.new(cook_params)
    if @cook.save
      flash[:success] = "Welcome to the App!"
      redirect_to cook_url(@cook)
    else
      render 'new'
    end
  end

  def update
    if @cook.update(cook_params)
      redirect_to cook_url(@cook), notice: "Cook was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cook.destroy
    redirect_to cooks_url, notice: "Cook was successfully destroyed."
  end
end

private
  def set_cook
    @cook ||= Cook.find(params.permit(:id)[:id].to_i)
  end

  def cook_params
    params.require(:cook).permit(:first_name,:last_name, :email, :password )
  end