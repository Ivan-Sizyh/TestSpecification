class CreateSkillUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :skill_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.timestamps
    end

    add_index :skill_users, [ :user_id, :skill_id ], unique: true
  end
end
