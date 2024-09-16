class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :city
      t.text :description

      t.timestamps
    end
  end
end
