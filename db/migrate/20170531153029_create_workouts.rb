class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.references :user, foreign_key: true
      t.references :exercise, foreign_key: true
      t.integer :reps

      t.timestamps
    end
  end
end
