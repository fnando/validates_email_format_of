validates_email_format_of
=========================

Validate e-mail addresses against RFC 2822 and RFC 3696.

This plugin is based on <http://github.com/alexdunae/validates_email_format_of> but does not validate MX records.

Usage
=====

	script/plugin install git@github.com:fnando/validates_email_format_of.git

	class User < ActiveRecord::Base
	  validates_email_format_of :email
	end

If you want to use I18n, make sure you add the scope `activerecord.errors.messages.invalid_email` (Rails 2) or `errors.messages.invalid_email` (Rails 3).

Copyright (c) 2009 Nando Vieira, released under the MIT license
