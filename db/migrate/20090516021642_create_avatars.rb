class CreateAvatars < ActiveRecord::Migration
  def self.up
    create_table :avatars do |t|
      t.string :email, :avatar_file_name, :avatar_content_type, :avatar_file_size, :md5
      t.datetime :avatar_updated_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :avatars
  end
end
