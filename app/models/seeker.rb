class Seeker 
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Translation
  
  def initialize(params = {})
    @name = params[:name] || ''
    @phone = params[:phone] || ''
  end
  
  attr_reader :name, :phone
  
  def persisted?
    false
  end
end