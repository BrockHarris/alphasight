class AdvisorsController < ApplicationController

	def index
		@advisors = Advisor.known
		@advisor_predictions = Advisor.predicted
	end
end
