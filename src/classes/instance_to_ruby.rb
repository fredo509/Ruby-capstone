
class ConvertToObject
  def self.instance_to_ruby_object(instance)
    response = {}
    properties = instance.instance_variables
    properties.each do |property|
     if instance.instance_variable_defined?(property)
       response[property] = instance.instance_variable_get(property)
     end
    end
    return response
  end
end