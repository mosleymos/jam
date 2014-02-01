class AddCriteriasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :orientation, :string
    add_column :users, :cheveux, :string
    add_column :users, :yeux, :string
    add_column :users, :taille, :integer
    add_column :users, :bodytype, :string
    add_column :users, :profession, :string
    add_column :users, :religion, :string
    add_column :users, :astral, :string
  end
end
