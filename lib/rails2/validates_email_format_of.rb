module SimplesIdeias
  module ValidatesEmailFormatOf
    def validates_email_format_of(*attr_names)
      options = {
        :on => :save,
        :allow_nil => false,
        :allow_blank => false
      }

      options.update(attr_names.pop) if attr_names.last.kind_of?(Hash)

      validates_each(attr_names, options) do |record, attr_name, value|
        message = ::I18n.translate(options[:message], :default => [:"activerecord.errors.messages.invalid_email", "is not a valid address"])
        record.errors.add(attr_name, message) unless value.to_s =~ EMAIL_FORMAT
      end
    end
  end
end

class ActiveRecord::Base
  extend SimplesIdeias::ValidatesEmailFormatOf
end
