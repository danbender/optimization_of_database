class RenameTotalKarmaColumn < ActiveRecord::Migration
  def change
    rename_column :users, :total_karma, :karma_sum
  end
end
