class CreateUserStats < ActiveRecord::Migration[5.0]
  def change
    create_table :user_stats do |t|
      t.references :user, foreign_key: true
      t.references :bodypart, foreign_key: true
      t.integer :base_points
      t.decimal :level_points

      t.timestamps
    end
  end
end
