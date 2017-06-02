class CreateJoinTableBodypartsExercises < ActiveRecord::Migration[5.0]
  def change
    create_join_table :bodyparts, :exercises do |t|
      # t.index [:bodypart_id, :exercise_id]
      # t.index [:exercise_id, :bodypart_id]
    end
  end
end
