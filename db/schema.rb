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

ActiveRecord::Schema.define(:version => 20110119133004) do

  create_table "accommodations", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "suburb"
    t.string   "name"
    t.string   "phone_mobile"
    t.string   "phone_home"
    t.string   "other_phone"
    t.string   "email"
    t.string   "number_of_beds"
    t.boolean  "takes_pets"
    t.boolean  "takes_children"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.boolean  "over_eighteen"
    t.boolean  "takes_smokers"
    t.boolean  "available",                     :default => true
    t.string   "takes_pets_comment"
    t.boolean  "takes_disabled"
    t.boolean  "takes_storage"
    t.string   "takes_storage_comment"
    t.string   "postcode"
    t.string   "area"
    t.boolean  "terms_and_conditions_accepted"
    t.boolean  "enabled",                       :default => true
    t.text     "comments"
    t.integer  "contact_count",                 :default => 0
  end

end
