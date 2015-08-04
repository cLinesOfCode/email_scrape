namespace :scrape do
	task :mail => :environment do 
		agent = Mechanize.new
		agent.user_agent_alias = 'Linux Mozilla'
		page = agent.get 'https://calnet.berkeley.edu/directory/search.pl'
		form = page.forms[1]
		form.field_with(:name => "search-base").value = 'students'
		form.field_with(:name => "search-term").value = 'a'

		page = agent.submit(form, form.buttons.first)

		emails = []

		page.links.each do |link|
			if (link.text =~ /@berkeley.edu/i)
				emails << link.text
			end
		end

		emails.each do |e|
			puts e
		end
	end
end
