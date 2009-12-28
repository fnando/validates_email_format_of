require "validates_email_format_of"

class ActiveRecord::Base
  extend SimplesIdeias::ValidatesEmailFormatOf
end

I18n.load_path += Dir[File.dirname(__FILE__) + "/config/locales/*.yml"]
