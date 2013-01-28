require 'machinist/active_record'

Accommodation.blueprint do
  number_of_beds { 1 }
  area { 'area2' }
  email { "user#{sn}@example.com" }
  suburb { 'brisbane' }
  postcode { 4000 }
end