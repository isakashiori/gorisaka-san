class Memo < ApplicationRecord
  belongs_to :user

  validates :borrower_name, presence: true, length: { maximum: 30 }
  validates :money_amount, presence: true, numericality: {only_integer: true}, length: { maximum: 100 }
  validates :repayment_day, presence: true
  validates :lended_day, presence: true
  validates :notes, presence: false
end
