require 'rubygems'
require 'httparty'
require 'json'

class Campfire
  include HTTParty

  base_uri   "https://#{ENV['CF_SUBDOMAIN']}.campfirenow.com"
  basic_auth ENV['CF_KEY'], 'x'
  headers    'Content-Type' => 'application/json'

  def self.rooms
    Campfire.get('/rooms.json')['rooms']
  end

  def self.room(room_id)
    Room.new(room_id)
  end

  def self.user(id)
    Campfire.get("/users/#{id}.json")['user']
  end
end

class Room
  attr_reader :room_id

  def initialize(room_id)
    @room_id = room_id
  end

  def join
    post 'join'
  end

  def leave
    post 'leave'
  end

  def lock
    post 'lock'
  end

  def unlock
    post 'unlock'
  end

  def message(message)
    send_message message
  end

  def paste(paste)
    send_message paste, 'PasteMessage'
  end

  def play_sound(sound)
    send_message sound, 'SoundMessage'
  end

  def transcript
    get('transcript')['messages']
  end

  private

  def send_message(message, type = 'Textmessage')
    post 'speak', :body => {:message => {:body => message, :type => type}}.to_json
  end

  def get(action, options = {})
    Campfire.get room_url_for(action), options
  end

  def post(action, options = {})
    Campfire.post room_url_for(action), options
  end

  def room_url_for(action)
    "/room/#{room_id}/#{action}.json"
  end
end

# Usage:
#
# room = Campfire.room(1)
# room.join
# room.lock
# 
# room.message 'This is a top secret'
# room.paste "FROM THE\n\nAP-AYE"
# room.play_sound 'rimshot'
# 
# room.unlock
# room.leave
