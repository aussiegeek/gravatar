require File.dirname(__FILE__) + '/../spec_helper'

describe Avatar do
  it "should be valid" do
    Avatar.make.should be_valid
  end

  it "should save md5 of email" do
    @avatar = Avatar.make(:email => 'alan@aussiegeek.net')
    @avatar.md5.should == '35a7461d2e4e8540e554e225625ece2c'
  end
end
