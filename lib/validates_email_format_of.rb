module SimplesIdeias
  module ValidatesEmailFormatOf
    LOCAL_PART_SPECIAL_CHARS = Regexp.escape('!#$%&\'*-/=?+-^_`{|}~')
    LOCAL_PART_UNQUOTED = '(([[:alnum:]' + LOCAL_PART_SPECIAL_CHARS + ']+[\.\+]+))*[[:alnum:]' + LOCAL_PART_SPECIAL_CHARS + '+]+'
    LOCAL_PART_QUOTED = '\"(([[:alnum:]' + LOCAL_PART_SPECIAL_CHARS + '\.\+]*|(\\\\[\x00-\xFF]))*)\"'
    EMAIL_FORMAT = Regexp.new('^((' + LOCAL_PART_UNQUOTED + ')|(' + LOCAL_PART_QUOTED + ')+)@(((\w+\-+[^_])|(\w+\.[^_]))*([a-z0-9-]{1,63})\.[a-z]{2,6}$)', Regexp::EXTENDED | Regexp::IGNORECASE)
  end
end

if ActiveRecord::VERSION::STRING >= "3.0"
  require "rails3/validates_email_format_of"
else
  require "rails2/validates_email_format_of"
end
