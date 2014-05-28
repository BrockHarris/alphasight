require 'spec_helper'

describe Advisor do

  describe "with email john.ferguson@alphasights.com" do
    before { @advisor = Advisor.create(full_name: "John Ferguson", email: "john.ferguson@alphasights.com") }
    it "should have a type 4 email pattern" do	
  		@advisor.pattern.should == 4
  	end

  	it "should have the first name John" do	
  		@advisor.first_name.should == "John"
  	end

  	it "should have the last name Ferguson" do
  		@advisor.last_name.should == "Ferguson"
  	end

  	it "should have the domain alphasights.com" do
  		@advisor.domain.should == "alphasights.com"
  	end
  end

  describe "with email larry.p@google.com" do
    before { @advisor = Advisor.create(full_name: "Larry Page", email: "larry.p@google.com") }
    it "should have a type 3 email pattern" do	
  		@advisor.pattern.should == 3
  	end

  	it "should have the first name Larry" do	
  		@advisor.first_name.should == "Larry"
  	end

  	it "should have the last name Page" do
  		@advisor.last_name.should == "Page"
  	end

  	it "should have the domain google.com" do
  		@advisor.domain.should == "google.com"
  	end
  end

  describe "with email s.brin@google.com" do
    before { @advisor = Advisor.create(full_name: "Sergey Brin", email: "s.brin@google.com") }
    it "should have a type 2 email pattern" do	
  		@advisor.pattern.should == 2
  	end

  	it "should have the first name Sergey" do	
  		@advisor.first_name.should == "Sergey"
  	end

  	it "should have the last name Brin" do
  		@advisor.last_name.should == "Brin"
  	end

  	it "should have the domain google.com" do
  		@advisor.domain.should == "google.com"
  	end
  end

  describe "with email s.j@apple.com" do
    before { @advisor = Advisor.create(full_name: "Steve Jobs", email: "s.j@apple.com") }
    it "should have a type 1 email pattern" do	
  		@advisor.pattern.should == 1
  	end

  	it "should have the first name Steve" do	
  		@advisor.first_name.should == "Steve"
  	end

  	it "should have the last name Jobs" do
  		@advisor.last_name.should == "Jobs"
  	end

  	it "should have the domain apple.com" do
  		@advisor.domain.should == "apple.com"
  	end
  end
end
