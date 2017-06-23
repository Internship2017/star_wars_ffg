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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170623204626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "free_ranks"
    t.integer "source_page"
    t.string "source_book"
    t.string "career_skills", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_weapons", force: :cascade do |t|
    t.bigint "weapon_id"
    t.bigint "character_id"
    t.integer "damage"
    t.integer "crit"
    t.text "special"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_weapons_on_character_id"
    t.index ["weapon_id"], name: "index_character_weapons_on_weapon_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "force_rating"
    t.bigint "user_id"
    t.string "emotional_strength"
    t.string "emotional_weakness"
    t.integer "conflict"
    t.integer "morality"
    t.string "gender"
    t.integer "age"
    t.string "height"
    t.string "build"
    t.string "hair"
    t.string "eyes"
    t.text "notable_features"
    t.integer "total_xp"
    t.integer "available_xp"
    t.integer "soak_value"
    t.integer "threshold_wounds"
    t.integer "current_wounds"
    t.integer "threshold_strain"
    t.integer "current_strain"
    t.integer "ranged_defense"
    t.integer "melee_defense"
    t.integer "brawn"
    t.integer "agility"
    t.integer "intellect"
    t.integer "cunning"
    t.integer "will_power"
    t.integer "presence"
    t.integer "credits"
    t.text "motivations"
    t.string "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id"
    t.bigint "career_id"
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
    t.index ["career_id"], name: "index_characters_on_career_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "difficulty"
    t.string "characteristic"
    t.string "type_of_skill"
    t.bigint "character_id"
    t.integer "rank", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_skills_on_character_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "source_page"
    t.string "source_book"
    t.integer "brawn"
    t.integer "agility"
    t.integer "intellect"
    t.integer "cunning"
    t.integer "willpower"
    t.integer "presence"
    t.integer "wound_threshold"
    t.integer "strain_threshold"
    t.integer "experience"
    t.string "skill_name"
    t.integer "skill_start_rank"
    t.integer "skill_limit_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.string "skill"
    t.text "range"
    t.integer "encum"
    t.integer "hp"
    t.integer "price"
    t.integer "rarity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_weapons", "characters"
  add_foreign_key "character_weapons", "weapons"
  add_foreign_key "characters", "campaigns"
  add_foreign_key "characters", "careers"
  add_foreign_key "characters", "users"
  add_foreign_key "skills", "characters"
end
