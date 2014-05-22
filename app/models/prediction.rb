class Prediction < ActiveRecord::Base
  attr_accessible :advisor_id, :output

  belongs_to :advisor
end
