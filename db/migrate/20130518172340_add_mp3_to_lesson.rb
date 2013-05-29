class AddMp3ToLesson < ActiveRecord::Migration
  def self.up
    add_attachment :lessons, :mp3
  end

  def self.down
    remove_attachment :lessons, :mp3
  end
end
