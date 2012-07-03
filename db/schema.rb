# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120703014916) do

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

  create_table "ensaios", :force => true do |t|
    t.string   "video_url"
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ensaios_tags", :id => false, :force => true do |t|
    t.integer "ensaio_id"
    t.integer "tag_id"
  end

# Could not dump table "episodios" because of following StandardError
#   Unknown type 'strin' for column 'capa_updated_at'

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
    t.string   "image_file_name"
  end

# Could not dump table "marcadors" because of following StandardError
#   Unknown type 'bool' for column 'publico'

  create_table "tags", :force => true do |t|
    t.string "name"
    t.string "urlized"
  end

end
