validates_email_format_of
=========================

Validates e-mail addresses on ActiveRecord.

Works on Rails 2+ and Ruby 1.8+.

Usage
=====

	script/plugin install git@github.com:fnando/validates_email_format_of.git

	class User < ActiveRecord::Base
	  validates_email_format_of :email
	end

On ActiveRecord 3.0+ you can do

	class User < ActiveRecord::Base
	  validates :email, :email => true
	end

If you want to use I18n, make sure you add the scope `activerecord.errors.messages.invalid_email` or `errors.messages.invalid_email`. The following locales are builtin:

* pt
* pt-BR
* en

Copyright (c) 2009 Nando Vieira, released under the MIT license
