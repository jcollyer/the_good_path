class AddImageToLesson < ActiveRecord::Migration
  def self.up
    add_attachment :lessons, :image
  end

  def self.down
    remove_attachment :lessons, :image
  end
end
