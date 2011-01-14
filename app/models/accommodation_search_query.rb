class AccommodationSearchQuery
  
  def initialize(query_params)
    @query_params = query_params
    @where_query = []
    @where_params = []
  end
  
  def to_sql_conditions
    add_suburb_query()
    add_number_of_people_query()
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
  
end