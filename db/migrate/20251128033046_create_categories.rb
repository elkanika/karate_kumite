class CreateCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :categories do |t|
      t.references :tournament, null: false, foreign_key: true
      t.string :name
      t.integer :modality

      t.timestamps
    end
  end
end
