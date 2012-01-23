require 'ostruct'
require 'formtastic/inputs'

module JSONModel::FormtasticCompatibility
  extend ActiveSupport::Concern
  
  def column_for_attribute(attribute)
    OpenStruct.new(type: column_type_conversion(self.class.schema['properties'][attribute.to_s]))
  end
  
  def column_type_conversion(property)
    return 'string_array' if property['type'] == 'array' && property['items']['type'] == 'string'
    property['type']
  end
  
  module ClassMethods
    def content_columns
      @content_columns ||= schema['properties'].keys.reject { |key| key == 'id' }.map do |property|
        OpenStruct.new(name: property)
      end
    end
  end
end

class JSONModel::Base
  include JSONModel::FormtasticCompatibility
end