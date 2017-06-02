class CreateGameConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :game_configs do |t|
      t.decimal :level_rate
      t.string :level_method
      t.decimal :decay_per_day

      t.timestamps
    end
  end
end
