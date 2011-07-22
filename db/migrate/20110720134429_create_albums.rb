class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string   "title",                                                      :null => false
      t.string   "link",                                                   :null => false
      t.text     "link",                                                       :null => false
      t.text     "link_html",                                                  :null => false
      t.boolean  "active",                  :default => true,                  :null => false
      t.integer  "approved_comments_count", :default => 0,                     :null => false
      t.string   "cached_tag_list"
      t.datetime "published_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "edited_at",                                                  :null => false
    end
    
      add_index "albums", ["published_at"], :name => "index_albums_on_published_at"
  end
  

  def self.down
    drop_table :albums
  end
end
