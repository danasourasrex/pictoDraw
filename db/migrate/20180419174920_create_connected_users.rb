class CreateConnectedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :connected_users do |t|
    	t.string "username"
    	t.integer "score", :default => 0
        t.timestamps
    end
  end
end
