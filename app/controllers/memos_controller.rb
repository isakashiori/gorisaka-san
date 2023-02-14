class MemosController < ApplicationController
  before_action :set_memo, only: %i[show edit update destroy]

  def new
    @memo =  Memo.new
  end

  def create
    @memo = current_user.memos.build(memo_params)
    if @memo.save
      redirect_to memos_path
    else
      render :new
    end
  end

  def index
    @memos = current_user.memos.includes(:user).order(created_at: :desc)
  end
  

  def edit; end

  def update
    if @memo.update(memo_params)
      redirect_to memos_path
    else
      render :new
    end
  end

  def destroy
    @memo.destroy!
    redirect_to memos_path
  end

  private

  def memo_params
    params.require(:memo).permit(:borrower_name, :money_amount, :repayment_day, :lended_day, :notes)
  end

  def set_memo
    @memo = current_user.memos.find(params[:id])
  end
end
