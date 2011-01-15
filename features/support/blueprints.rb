require 'machinist/active_record'

Sham.email { Faker::Internet.email }

Accommodation.blueprint do
  address1 {'1/509 Factory'}
  address2 {'Street'}
  suburb  {'FactoryVille'}
  number_of_beds {1}
  email {"foo@bar.com"}
  over_eighteen {true}
  terms_and_conditions_accepted {true}
  postcode {"3184"}
  state {"VIC"}
end

Login.blueprint do
  email { Sham.email }
  password { 'password' }
  password_confirmation { 'password' }
end