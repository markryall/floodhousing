class Accommodation < ActiveRecord::Base
  validates_acceptance_of :over_18, :message => 'must be over 18'
end