class CreateWeights < ActiveRecord::Migration[5.0]
  def change
    create_table :weights do |t|
      t.references :user, foreign_key: true
      t.decimal :weight

      t.timestamps
    end
  end
end
