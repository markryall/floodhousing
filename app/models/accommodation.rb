class Accommodation < ActiveRecord::Base
  validates_acceptance_of :over_eighteen, :message => 'must be over 18'
end