class CreateTargetships < ActiveRecord::Migration
  def change
    create_table :targetships do |t|
      t.integer :user_id
      t.integer :target_id

      t.timestamps
    end
  end
end
