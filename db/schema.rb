# encoding: UTF-8

ActiveRecord::Schema.define(:version => 20120628194941) do

  create_table "admins", :force => true do |t|
    t.string "token"
  end

  create_table "bloco_georefs", :force => true do |t|
    t.integer "bloco_id"
    t.integer "georef_id"
  end

  create_table "blocos", :force => true do |t|
    t.integer  "episodio_id"
    t.string   "video_url"
    t.string   "titulo"
    t.string   "urlized"
    t.text     "info"
    t.integer  "hiper_in"
    t.integer  "hiper_out"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocos_tags", :id => false, :force => true do |t|
    t.integer "bloco_id"
    t.integer "tag_id"
  end

  create_table "ensaio_georefs", :force => true do |t|
    t.integer "ensaio_id"
    t.integer "georef_id"
  end

  create_table "episodios", :force => true do |t|
    t.string   "titulo"
    t.text   "sinopse"
    t.string   "urlized"
    t.string   "capa_file_name"
    t.string   "capa_content_type"
    t.integer  "capa_file_size"
    t.datetime "capa_updated_at"    
    t.datetime "created_at"
    t.datetime "updated_at"
  end  
  add_index :episodios, :urlized

  create_table "ensaios_tags", :id => false, :force => true do |t|
    t.integer "ensaio_id"
    t.integer "tag_id"
  end

  create_table "marcadores", :force => true do |t|
    t.belongs_to   "bloco"
    t.belongs_to   "georef"
  end

  create_table "georefs", :force => true do |t|
    t.string   "lat"
    t.string   "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hiperbalons", :force => true do |t|
    t.integer  "bloco_id"
    t.integer  "in"
    t.integer  "out"
    t.string   "titulo"
    t.string   "url"
    t.string   "image_name"
    t.string   "image_type"
    t.integer  "image_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tags", :force => true do |t|
    t.string "name"
    t.string "urlized"
  end

end
