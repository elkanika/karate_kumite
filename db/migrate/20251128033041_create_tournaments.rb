class CreateTournaments < ActiveRecord::Migration[8.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
