class CreateGits < ActiveRecord::Migration[8.1]
  def change
    create_table :gits do |t|
      t.string :status

      t.timestamps
    end
  end
end
