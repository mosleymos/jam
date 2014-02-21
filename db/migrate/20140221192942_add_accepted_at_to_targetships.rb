class AddAcceptedAtToTargetships < ActiveRecord::Migration
  def change
  	add_column(:targetships, :accepted_at, :datetime)
  end
end
