require 'machinist/active_record'

Sham.email { Faker::Internet.email }

Accommodation.blueprint do
  name {'John D.'}
  phone_mobile {'01 2345 6780'}
  phone_home {'01 2345 6781'}
  other_phone {'01 2345 6782'}
  address1 {'1/509 Factory'}
  address2 {'Street'}
  suburb  {'FactoryVille'}
  area  {'Ipswich'}
  number_of_beds {"1"}
  email {"foo@bar.com"}
  over_eighteen {true}
  terms_and_conditions_accepted {true}
  postcode {"3184"}  
end




Login.blueprint do
  email { Sham.email }
  password { 'password' }
  password_confirmation { 'password' }
end
