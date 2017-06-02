class CreateBodyparts < ActiveRecord::Migration[5.0]
  def change
    create_table :bodyparts do |t|
      t.string :name

      t.timestamps
    end
  end
end
