class AddAnnonceToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :annonce, :text
  end
end
