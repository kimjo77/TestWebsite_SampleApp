class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :micropost_id
      t.integer :voter_id

      t.timestamps
    end
    add_index :votes, :micropost_id
    add_index :votes, :voter_id
    add_index :votes, [:micropost_id, :voter_id], unique: true
  end
end
