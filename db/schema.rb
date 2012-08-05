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

ActiveRecord::Schema.define(:version => 20120804235834) do

  create_table "bloco_marcadores", :force => true do |t|
    t.integer "bloco_id"
    t.integer "marcador_id"
  end

  create_table "bloco_marcadors", :id => false, :force => true do |t|
    t.integer "bloco_id"
    t.integer "marcador_id"
  end

  create_table "blocos", :force => true do |t|
    t.integer  "episodio_id"
    t.string   "video_url"
    t.string   "titulo"
    t.string   "urlized"
    t.text     "sinopse"
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

  create_table "ensaios_tags", :id => false, :force => true do |t|
    t.integer "ensaio_id"
    t.integer "tag_id"
  end

  create_table "episodios", :force => true do |t|
    t.string   "titulo"
    t.string   "urlized"
    t.text     "sinopse"
    t.string   "capa_file_name"
    t.string   "capa_content_type"
    t.integer  "capa_file_size"
    t.datetime "capa_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "hiperbalons", :force => true do |t|
    t.integer  "bloco_id"
    t.integer  "marcador_id"
    t.integer  "in"
    t.integer  "out"
    t.string   "url"
    t.string   "image_file_name"
    t.string   "image_type"
    t.integer  "image_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "marcador_tags", :id => false, :force => true do |t|
    t.integer "marcador_id"
    t.integer "tag_id"
  end

  create_table "marcadors", :force => true do |t|
    t.integer  "bloco_id"
    t.string   "titulo"
    t.string   "long"
    t.string   "lat"
    t.string   "autor"
    t.string   "autor_url"
    t.string   "image_file_name"
    t.string   "image_type"
    t.integer  "image_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "info"
  end

  create_table "marcadors_tags", :id => false, :force => true do |t|
    t.integer "marcador_id"
    t.integer "tag_id"
  end

  create_table "tags", :force => true do |t|
    t.string "name"
    t.string "urlized"
  end

end
