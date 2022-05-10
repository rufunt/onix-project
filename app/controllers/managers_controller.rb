class ManagersController < ApplicationController
  before_action :set_manager, only: %i[ show edit update destroy ]
  before_action :authenticate_manager!, only: %i[ show edit update destroy ]

  def index
    @managers = Manager.all
  end

  def new
    @manager = Manager.new
  end

  def show
    @manager = Manager.find(params[:id])
  end

  def edit; end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      flash[:success] = "Welcome to the App!"
      redirect_to manager_url(@manager)
    else
      render 'new'
    end
  end

  def update
    if @manager.update(manager_params)
      redirect_to manager_url(@manager), notice: "Manager was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @manager.destroy
    redirect_to managers_url, notice: "Manager was successfully destroyed."
  end
end

private
  def set_manager
    @manager ||= Manager.find(params.permit(:id)[:id].to_i)
  end

  def manager_params
    params.require(:manager).permit(:first_name,:last_name, :email, :password )
  end