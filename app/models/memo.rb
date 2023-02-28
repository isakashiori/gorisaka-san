
class Memo < ApplicationRecord
  belongs_to :user

  validates :borrower_name, presence: true, length: { maximum: 30 }
  validates :money_amount, presence: true
  validates :repayment_day, presence: true
  validates :lended_day, presence: true
  validates :notes, presence: false

  def self.ransackable_attributes(auth_object = nil)
    ["borrower_name", "created_at", "id", "lended_day", "money_amount", "notes", "repayment_day", "updated_at", "user_id"]
  end
end
