class AddArchiveToPost < ActiveRecord::Migration
  def change
    add_column :posts, :archive, :boolean
  end
end
