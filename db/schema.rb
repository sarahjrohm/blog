# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110722144358) do

  create_table "albums", :force => true do |t|
    t.string   "title",                                     :null => false
    t.string   "link",                                      :null => false
    t.text     "link_html",                                 :null => false
    t.boolean  "active",                  :default => true, :null => false
    t.integer  "approved_comments_count", :default => 0,    :null => false
    t.string   "cached_tag_list"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "edited_at",                                 :null => false
  end

  add_index "albums", ["published_at"], :name => "index_albums_on_published_at"

  create_table "ckeditor_assets", :force => true do |t|
    t.string    "data_file_name",                                 :null => false
    t.string    "data_content_type"
    t.integer   "data_file_size"
    t.integer   "assetable_id"
    t.string    "assetable_type",    :limit => 30
    t.string    "type",              :limit => 25
    t.string    "guid",              :limit => 10
    t.integer   "locale",                          :default => 0
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "comments", :force => true do |t|
    t.integer   "post_id",      :null => false
    t.string    "author",       :null => false
    t.string    "author_url",   :null => false
    t.string    "author_email", :null => false
    t.text      "body",         :null => false
    t.text      "body_html",    :null => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "comments", ["created_at"], :name => "index_comments_on_created_at"
  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "maps", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "pages", :force => true do |t|
    t.string    "title",        :null => false
    t.string    "slug",         :null => false
    t.text      "body",         :null => false
    t.text      "body_html",    :null => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.datetime  "published_at"
  end

  add_index "pages", ["created_at"], :name => "index_pages_on_created_at"
  add_index "pages", ["title"], :name => "index_pages_on_title"

  create_table "posts", :force => true do |t|
    t.string    "title",                                     :null => false
    t.string    "slug",                                      :null => false
    t.text      "body",                                      :null => false
    t.text      "body_html",                                 :null => false
    t.boolean   "active",                  :default => true, :null => false
    t.integer   "approved_comments_count", :default => 0,    :null => false
    t.string    "cached_tag_list"
    t.timestamp "published_at"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "edited_at",                                 :null => false
    t.string    "image"
  end

  add_index "posts", ["published_at"], :name => "index_posts_on_published_at"

  create_table "sessions", :force => true do |t|
    t.string    "session_id", :null => false
    t.text      "data"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taggings", :force => true do |t|
    t.integer   "tag_id"
    t.integer   "taggable_id"
    t.timestamp "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0, :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "undo_items", :force => true do |t|
    t.string    "type",       :null => false
    t.timestamp "created_at", :null => false
    t.text      "data"
  end

  add_index "undo_items", ["created_at"], :name => "index_undo_items_on_created_at"

end
