class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    record.errors[attribute] << ("Phone numbers must be 10 digit numbers eg. 01 2345 6789") unless
            value.blank? || value =~ /[0-9\- \(\)]{6,10}/  
  end
end