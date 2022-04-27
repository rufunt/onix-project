class CashDescsController < ApplicationController
  before_action :set_cash_desk, only: %i[ show destroy ]
  def index; end

  def new
    @cash_desk = CashDesk.new
  end

  def show
    @cash_desk = CashDesk.find(params[:id])
  end

  def create
    @cash_desk = CashDesk.new(cash_desk_params)
    if @cash_desk.save
      redirect_to set_cash_desk_url(@cash_desk)
    else
      render 'new'
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