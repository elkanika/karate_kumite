class CreateCompetitors < ActiveRecord::Migration[8.1]
  def change
    create_table :competitors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :belt
      t.string :dojo

      t.timestamps
    end
  end
end
