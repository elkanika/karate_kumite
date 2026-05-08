class CreateMatches < ActiveRecord::Migration[8.1]
  def change
    create_table :matches do |t|
      t.references :category, null: false, foreign_key: true
      t.references :competitor1, null: false, foreign_key: { to_table: :competitors }
      t.references :competitor2, null: false, foreign_key: { to_table: :competitors }
      t.references :winner, foreign_key: { to_table: :competitors }
      t.jsonb :score_data

      t.timestamps
    end
  end
end
