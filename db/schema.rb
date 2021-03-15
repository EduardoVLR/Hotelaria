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

ActiveRecord::Schema.define(version: 2021_03_13_224059) do

  create_table "adms", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_adms_on_email", unique: true
    t.index ["reset_password_token"], name: "index_adms_on_reset_password_token", unique: true
  end

  create_table "hospedes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.date "data_nascimento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.integer "numeroQuartos"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.integer "quarto"
    t.date "dataEntrada"
    t.date "dataSaida"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "hotel_id"
    t.integer "hospede_id"
    t.index ["hospede_id"], name: "index_reservas_on_hospede_id"
    t.index ["hotel_id"], name: "index_reservas_on_hotel_id"
  end

  add_foreign_key "reservas", "hospedes"
  add_foreign_key "reservas", "hotels"
end
