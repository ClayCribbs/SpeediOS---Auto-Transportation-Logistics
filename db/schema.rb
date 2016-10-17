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

ActiveRecord::Schema.define(version: 20161017191502) do

  create_table "delivery_trucks", force: :cascade do |t|
    t.string   "name"
    t.float    "minimumPossibleWeight"
    t.float    "maximumPossibleWeight"
    t.string   "vinNumber"
    t.string   "origin"
    t.string   "destination"
    t.integer  "yearManufactured"
    t.string   "make"
    t.string   "model"
    t.float    "payloadEmptyWeight"
    t.string   "originLocation"
    t.string   "currentLocation"
    t.string   "destinationLocation"
    t.string   "weightCapacity"
    t.integer  "yearAquired"
    t.text     "carFax"
    t.text     "maintenanceHistory"
    t.text     "nextMaintenance"
    t.float    "highwayMPG"
    t.float    "cityMPG"
    t.float    "avgMPG"
    t.string   "scheduledDepartureTime"
    t.string   "estimatedArrivalTime"
    t.string   "requestedArrivalTime"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "currentWeight"
    t.string   "image"
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "driver_name"
    t.string   "driver_id"
    t.string   "driver_dob"
    t.text     "driver_address"
    t.string   "email"
    t.integer  "phone_number"
    t.integer  "trailer_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.string   "make"
    t.string   "model"
    t.integer  "yearManufactured"
    t.string   "origin"
    t.string   "destination"
    t.string   "vinNumber"
    t.float    "minimumPossibleWeight"
    t.float    "maximumPossibleWeight"
    t.float    "actualWeight"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "origin_latitude"
    t.float    "origin_longitude"
    t.float    "destination_latitude"
    t.float    "destination_longitude"
    t.float    "distance"
    t.string   "truckId"
    t.string   "image"
  end

end
