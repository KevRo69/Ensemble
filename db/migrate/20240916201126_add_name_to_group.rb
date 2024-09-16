class AddNameToGroup < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :name, :string
  end
end
