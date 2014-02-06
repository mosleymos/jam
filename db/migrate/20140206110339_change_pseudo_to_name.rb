class ChangePseudoToName < ActiveRecord::Migration
  def change 
  	change_table :users do |t|
  		t.rename :pseudo, :name
  	end
  end
end
