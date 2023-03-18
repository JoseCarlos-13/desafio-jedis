# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_17_062955) do

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.string "public_place"
    t.string "complement"
    t.string "city"
    t.string "uf"
    t.string "ibge_code"
    t.integer "municipe_id", null: false
    t.string "neighborhood"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["municipe_id"], name: "index_addresses_on_municipe_id"
  end

  create_table "municipes", force: :cascade do |t|
    t.string "full_name"
    t.string "cpf"
    t.string "cns"
    t.string "email"
    t.date "birth_date"
    t.string "phone_number"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "municipes"
end
