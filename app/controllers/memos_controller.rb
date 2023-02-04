class MemosController < ApplicationController
  before_action :set_memo, only: %i[show update destroy]

  def index
    @memos = Memo.all.includes(:user).order(created_at: :desc)
  end

  def new
    @memo =  Memo.new(memo_params)
  end
  
  def edit; end

  def show; end

  def update
    if @memo.update(memo_params)
      rediect_to memos_path
    else
      render :new
    end
  end

  def destroy
    @memo.destroy!
    rediect_to memos_path
  end

  private

  def memo_params
    params.require(:memo).permit(:borrower_name, :money_amount, :repayment_day, :lended_day, :notes)
  end

  def set_memo
    @memo = current_user.memos.find(params[:id])
  end
end
