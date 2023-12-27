class CreatePins < ActiveRecord::Migration[7.1]
  def change
    create_table :pins do |t|
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
