class AccommodationSearchQuery
  
  def initialize(query_params)
    @query_params = query_params
    @where_query = []
    @where_params = []
  end
  
  def to_sql_conditions
    add_suburb_query()
    add_number_of_people_query()
    
    #TODO: sprinkle some meta magic over this
    add_pets()
    add_smokers()
    add_children()
    ([] << @where_query.join(' and ')).concat @where_params
    
  end
  
  def add_suburb_query
    return unless @query_params[:suburb] && @query_params[:suburb] != '' && @query_params[:suburb] != 'All'
    @where_query << 'suburb like ?'
    @where_params << "%#{@query_params[:suburb]}%"
  end
  
  def add_number_of_people_query
    return unless @query_params[:number_of_people] &&  @query_params[:number_of_people] != ''
    @where_query << 'number_of_people >= ?'
    @where_params << @query_params[:number_of_people]
  end

  #For anyone unfamiliar with metaprogramming, this will take the following boolean params and define 'add_XXX' methods for them 
  [:pets, :children, :smokers].each do |next_query|
      method_name = ("add_" + next_query.to_s).to_sym
      send :define_method, method_name do
        
        return unless @query_params[next_query] && @query_params[next_query] = 'yes'
        @where_query << "takes_#{next_query} = ?"
        @where_params << true    
        
      end
    end
  
end