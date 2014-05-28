require 'spec_helper'

describe Prediction do

	before do
    advisors = {
		  "John Ferguson" => "john.ferguson@alphasights.com",
		  "Damon Aw" => "damon.aw@alphasights.com",
		  "Linda Li" => "linda.li@alphasights.com",
		  "Larry Page" => "larry.p@google.com",
		  "Sergey Brin" => "s.brin@google.com",
		  "Steve Jobs" => "s.j@apple.com"
		}

		advisors.each do |full_name, email|
			Advisor.create(email: email, full_name: full_name)
		end 
  end

  describe "for advisor with the domain alphasights.com" do
    before { @advisor = Advisor.create(full_name: "Peter Wong", domain: "alphasights.com", is_prediction: true) }
    it "should have email Peter.Wong@alphasights.com" do	
  		@advisor.predictions.first.output.should == "Peter.Wong@alphasights.com"
  	end
  end

  describe "for advisor with the domain google.com" do
    before { @advisor = Advisor.create(full_name: "Craig Silverstein", domain: "google.com", is_prediction: true) }
    it "should have emails C.Silverstein@google.com or Craig.S@google.com" do	
  		@advisor.predictions.first.output.should == "C.Silverstein@google.com"
  		@advisor.predictions.last.output.should == "Craig.S@google.com"
  	end
  end

  describe "for advisor with the domain apple.com" do
    before { @advisor = Advisor.create(full_name: "Steve Wozniak", domain: "apple.com", is_prediction: true) }
    it "should have email S.W@apple.com" do	
  		@advisor.predictions.first.output.should == "S.W@apple.com"
  	end
  end

  describe "for advisor with the domain whitehouse.gov" do
    before { @advisor = Advisor.create(full_name: "Barack Obama", domain: "whitehouse.gov", is_prediction: true) }
    it "should not be predictable" do	
  		@advisor.predictions.first.output.should == "Prediction couldn't be made."
  	end
  end
end
