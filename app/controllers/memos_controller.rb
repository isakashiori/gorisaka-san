class MemosController < ApplicationController
  def new 
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      rediect_to memos_path
    else
      render :new
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:borrower_name, :money_amount, :repayment_day, :lended_day, :notes)
  end
end
