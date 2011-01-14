class Accommodation < ActiveRecord::Base
  validates_acceptance_of :over_eighteen, :accept=>true, :message => 'must be over 18'
end