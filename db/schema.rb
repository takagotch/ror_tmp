ActiveRecord::Schema.define(version: 201801251234) do
  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf-8" do |t|
    t.string "email", default: "", null:false

    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index["email"], name: "index_users_on_email", unique: true
    t.index["name"], name: "index_users_on_name", unique: true
    t.index["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index["unlock_token"], name: "index_users_on_unlock_token", unique: true
end

