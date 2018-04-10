class AddIndexesToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_index :ideas, :title #, unique: true
    add_index :ideas, :description
  end
end
