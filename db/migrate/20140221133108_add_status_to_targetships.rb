class AddStatusToTargetships < ActiveRecord::Migration
  def change
  	add_column(:targetships, :status, :string)
  end
end
