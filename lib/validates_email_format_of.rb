module SimplesIdeias
  module ValidatesEmailFormatOf
    LocalPartSpecialChars = Regexp.escape('!#$%&\'*-/=?+-^_`{|}~')
    LocalPartUnquoted = '(([[:alnum:]' + LocalPartSpecialChars + ']+[\.\+]+))*[[:alnum:]' + LocalPartSpecialChars + '+]+'
    LocalPartQuoted = '\"(([[:alnum:]' + LocalPartSpecialChars + '\.\+]*|(\\\\[\x00-\xFF]))*)\"'
    EmailRegex = Regexp.new('^((' + LocalPartUnquoted + ')|(' + LocalPartQuoted + ')+)@(((\w+\-+[^_])|(\w+\.[^_]))*([a-z0-9-]{1,63})\.[a-z]{2,6}$)', Regexp::EXTENDED | Regexp::IGNORECASE)

    def validates_email_format_of(*attr_names)
      options = {
        :on => :save,
        :allow_nil => false,
        :allow_blank => false
      }

      options.update(attr_names.pop) if attr_names.last.kind_of?(Hash)

      validates_each(attr_names, options) do |record, attr_name, value|
        message = I18n.translate("activerecord.errors.messages.invalid_email", :default => "is not a valid e-mail address")
        record.errors.add(attr_name, message) unless value.to_s =~ EmailRegex
      end
    end
  end
end
