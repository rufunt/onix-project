class CashDesksController < ApplicationController
  before_action :set_cash_desk, only: %i[ show edit update destroy]
  def index
    @cash_desks = CashDesk.all
  end

  def edit; end

  def new
    @cash_desk = CashDesk.new
  end

  def show
    @cash_desk = CashDesk.find(params[:id])
  end

  def create
    @cash_desk = CashDesk.new(cash_desk_params)
    if @cash_desk.save
      redirect_to cash_desk_url(@cash_desk)
    else
      render 'new'
    end
  end

  def update
    if @cash_desk.update(cash_desk_params)
      redirect_to cash_desk_url(@cash_desk), notice: "Cash Desk was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cash_desk.destroy
    redirect_to cash_desks_url, notice: "CashDesk was successfully destroyed."
  end
end

private
  def set_cash_desk
    @cash_desk = CashDesk.find(params[:id])
  end

  def cash_desk_params
    params.require(:cash_desk).permit(:all_balance, :cook_balance )
  end