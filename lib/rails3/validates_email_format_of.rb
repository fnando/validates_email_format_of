module ActiveModel
  module Validations
    class EmailValidator < EachValidator
      def validate_each(record, attribute, value)
        if value.to_s !~ SimplesIdeias::ValidatesEmailFormatOf::EMAIL_FORMAT
          record.errors.add(attribute, :invalid_email, :default => options[:message], :value => value)
        end
      end
    end

    module ClassMethods
      def validates_email_format_of(*attr_names)
        validates_with EmailValidator, _merge_attributes(attr_names)
      end
    end
  end
end
