class ConvertToObject
  def self.instance_to_object(instance)
    response = {}
    properties = instance.instance_variables
    properties.each do |property|
      value = instance.instance_variable_get(property)

      if value.is_a?(Genre) || value.is_a?(Author) || value.is_a?(Label)
        str_property = property.to_s.delete_prefix('@')
        if str_property != "id" && str_property != "items" 
          response[str_property] = instance_to_object(value)
        end
      else
        str_property = property.to_s.delete_prefix('@')
        response[str_property] = value
      end
    end
    response
  end
end
