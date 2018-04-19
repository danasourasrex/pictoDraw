class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
    	t.column "word", :string,  :limit => 30, :null => false
      	t.timestamps
    end
  end
end
