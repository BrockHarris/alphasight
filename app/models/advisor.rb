class Advisor < ActiveRecord::Base
	attr_accessible :pattern, :domain, :email, :full_name, :first_name, :last_name, :is_prediction

	has_many :predictions
	after_create :handle_new_advisor
	scope :known, where(is_prediction: false)
	scope :predicted, where(is_prediction: true)

	def handle_new_advisor
		if self.is_prediction?
			save_and_predict_emails
		else
			save_as_advisor
		end
	end

	def predict_from_pattern(pattern_type)
		name = self.full_name.split(' ')
		self.first_name = name.first
		self.last_name = name.last

		if pattern_type == 0
			result = "Prediction couldn't be made."
		elsif pattern_type == 1
			result = "#{name.first[0]}.#{name.last[0]}@#{self.domain}"
		elsif pattern_type == 2
			result = "#{name.first[0]}.#{name.last}@#{self.domain}"
		elsif pattern_type == 3
			result = "#{name.first}.#{name.last[0]}@#{self.domain}"
		elsif pattern_type == 4
			result = "#{name.first}.#{name.last}@#{self.domain}"
		end
		Prediction.create!(:advisor_id => self.id, :output => result)
		self.save!
	end

	def save_and_predict_emails
		matches = Advisor.where(:domain => self.domain, :is_prediction => false)
		unless matches.empty?
			predict_from_pattern(1) if matches.map(&:pattern).include? 1
			predict_from_pattern(2) if matches.map(&:pattern).include? 2
			predict_from_pattern(3) if matches.map(&:pattern).include? 3
			predict_from_pattern(4) if matches.map(&:pattern).include? 4
		else
			predict_from_pattern(0)
		end
	end

	def pattern_of(email)
		address = email[/[^@]+/]
		name = address.split('.')
		if name.first.length == 1 && name.last.length == 1  # first_initial.last_initial
			pattern = 1		
		elsif name.first.length == 1  # first_initial.last_name
			pattern = 2		
		elsif name.last.length == 1  # first_name.last_initial
			pattern = 3		
		else  # we'll assume first_name.last_name
			pattern = 4		
		end
		return pattern
	end

	def save_as_advisor
		self.domain = self.email[/[^@]+$/]
		name = self.full_name.split(' ')
		self.pattern = pattern_of(self.email)

		self.first_name = name.first
		self.last_name = name.last
		self.save!
	end
end
