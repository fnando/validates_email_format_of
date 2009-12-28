require File.dirname(__FILE__) + "/spec_helper"

describe "validates email format of" do
  class User < ActiveRecord::Base
    validates_email_format_of :email, :corporate_email
  end

  before do
    I18n.locale = :en
  end

  VALID_EMAILS.each do |email|
    it "should accept #{email.inspect} as a valid email" do
      user = User.new(:email => email, :corporate_email => email)
      user.should be_valid
    end
  end

  INVALID_EMAILS.each do |email|
    it "should reject #{email.inspect} as a valid email" do
      user = User.new(:email => "invalid", :corporate_email => "invalid")
      user.should_not be_valid
    end
  end

  it "should use default error message" do
    user = User.new(:email => "invalid")
    user.should_not be_valid
    user.errors.on(:email).should == "is not a valid e-mail address"
  end

  it "should reject nil value" do
    user = User.new(:email => nil)
    user.should_not be_valid
    user.errors.on(:email).should_not be_nil
  end

  it "should reject empty value" do
    user = User.new(:email => "")
    user.should_not be_valid
    user.errors.on(:email).should_not be_nil
  end

  it "should validate multiple attributes" do
    user = User.new(:corporate_email => "invalid")
    user.should_not be_valid
    user.errors.on(:corporate_email).should == "is not a valid e-mail address"
  end

  it "should use I18n string as error message [pt]" do
    I18n.locale = :pt
    user = User.new(:email => "invalid")
    user.should_not be_valid
    user.errors.on(:email).should == "não parece ser um e-mail válido"
  end

  it "should use I18n string as error message [pt-BR]" do
    I18n.locale = :'pt-BR'
    user = User.new(:email => "invalid")
    user.should_not be_valid
    user.errors.on(:email).should == "não parece ser um e-mail válido"
  end

  it "should use I18n string as error message [pt-PT]" do
    I18n.locale = :'pt-PT'
    user = User.new(:email => "invalid")
    user.should_not be_valid
    user.errors.on(:email).should == "não parece ser um e-mail válido"
  end
end
