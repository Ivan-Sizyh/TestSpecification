class CreateInterestUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :interest_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :interest, null: false, foreign_key: true
      t.timestamps
    end

    add_index :interest_users, [ :user_id, :interest_id ], unique: true
  end
end
