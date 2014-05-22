## Seed the advisors table with our sample data ##

advisors = {
  "John Ferguson" => "john.ferguson@alphasights.com",
  "Damon Aw" => "damon.aw@alphasights.com",
  "Linda Li" => "linda.li@alphasights.com",
  "Larry Page" => "larry.p@google.com",
  "Sergey Brin" => "s.brin@google.com",
  "Steve Jobs" => "s.j@apple.com"
}

advisors.each do |full_name, email|
	Advisor.create!(email: email, full_name: full_name)
end

samples = {
	"Peter Wong" => "alphasights.com",
	"Craig Silverstein" => "google.com",
	"Steve Wozniak" => "apple.com",
	"Barack Obama" => "whitehouse.gov"
}

samples.each do |full_name, domain|
	Advisor.create!(domain: domain, full_name: full_name, is_prediction: true)
end
