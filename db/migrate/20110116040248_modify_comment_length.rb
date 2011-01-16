class ModifyCommentLength < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :comments_new, :text
    execute %{UPDATE accommodations SET comments_new=comments}
    remove_column :accommodations, :comments
    rename_column :accommodations, :comments_new, :comments
  end

  def self.down
    add_column :accommodations, :comments_new, :string
    execute %{UPDATE accommodations SET comments_new=comments}
    remove_column :accommodations, :comments
    rename_column :accommodations, :comments_new, :comments
  end
end
