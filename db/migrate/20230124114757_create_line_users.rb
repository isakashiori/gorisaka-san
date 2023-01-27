class CreateLineUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :line_users do |t|

      t.timestamps
    end
  end
end
