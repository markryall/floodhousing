class Seeker 
  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Translation
  include ActiveModel::Validations
  
  validates_presence_of :name,:phone
  validates :phone, :backup_phone, :phone => true
  validates :email, :email => true
  
  def initialize(params = {})
    @name = params[:name] || ''
    @phone = params[:phone] || ''
    @backup_phone = params[:backup_phone] || ''
    @email = params[:email] || ''
    @contact_method = params[:contact_method] || ''
    @number_of_beds = params[:number_of_beds] || ''
    @allergies = params[:allergies] || ''
    @special_requirements = params[:special_requirements] || ''
    @pets =  params[:pets] || ''
    @personal_message = params[:personal_message] || ''
  end
  
  attr_accessor :name, :phone, :backup_phone, :email, :contact_method, :number_of_beds, :allergies, :special_requirements, :pets, :personal_message
  
  def persisted?
    false
  end
end