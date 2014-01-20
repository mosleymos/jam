class AddAsVtoUser < ActiveRecord::Migration
  def change
  	add_column(:users, :pseudo, :string)
  	add_column(:users, :age, :integer)
  	add_column(:users, :sexe, :string)
  	add_column(:users, :ville, :string)
  end
end