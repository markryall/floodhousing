require 'machinist/active_record'

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

