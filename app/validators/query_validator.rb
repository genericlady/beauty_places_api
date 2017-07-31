class QueryValidator
  VALID_TYPES = %q(hair skin nails beauty_salon hair_care)
  attr_reader :query, :errors

  def initialize(query_params)
    @query = query_params
    @errors = []

    errors.push("There must be a :type key") unless query.key?(:type)
    errors.push(invalid_type) unless query_type?
  end

  def valid?
    @errors.empty?
  end

  private
  def invalid_type
    "One of your beauty types are invalid, please include one of #{VALID_TYPES}"
  end

  def types
    query[:type].split(" ")
  end

  def query_type?
    types.all? { |type| VALID_TYPES.include?(type) }
  end

end
