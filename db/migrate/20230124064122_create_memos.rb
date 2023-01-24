class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.string :borrower_name
      t.integer :money_amount
      t.string :repayment_day
      t.string :lended_day
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
