class AddUseridToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :user_id, :int
  end
end
