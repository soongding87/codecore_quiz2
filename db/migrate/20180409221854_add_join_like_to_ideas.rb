class AddJoinLikeToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :join_count, :integer, default: 0
    add_column :ideas, :like_count, :integer, default: 0
  end
end
