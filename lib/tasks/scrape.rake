namespace :scrape do
	task :mail => :environment do 
		alpha = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'y', 'x', 'z']
		emails = []

		agent = Mechanize.new
		agent.user_agent_alias = 'Linux Mozilla'
		page = agent.get 'https://calnet.berkeley.edu/directory/search.pl'

		alpha.each do |a|
			form = page.forms[1]
			form.field_with(:name => "search-type").value = 'first'
			form.field_with(:name => "search-base").value = 'students'
			form.field_with(:name => "search-term").value = a
			page = agent.submit(form, form.buttons.first)

			page.links.each do |link|
				if link.text =~ /@berkeley.edu/i
					email = Email.new
					email.email = link.text
					email.save
					emails << link.text
				end
			end
		end

		alpha.each do |a|
			alpha.each do |b|
				alpha.each do |c|
					form = page.forms[1]
					form.field_with(:name => "search-type").value = 'first'
					form.field_with(:name => "search-base").value = 'students'
					form.field_with(:name => "search-term").value = a+b+c
					page = agent.submit(form, form.buttons.first)

					page.links.each do |link|
						if link.text =~ /@berkeley.edu/i
							email = Email.new
							email.email = link.text
							email.save
							emails << link.text
						end
					end
				end
			end
		end

		alpha.each do |a|
			alpha.each do |b|
				alpha.each do |c|
					alpha.each do |d|
						form = page.forms[1]
						form.field_with(:name => "search-type").value = 'first'
						form.field_with(:name => "search-base").value = 'students'
						form.field_with(:name => "search-term").value = a+b+c+d
						page = agent.submit(form, form.buttons.first)

						page.links.each do |link|
							if link.text =~ /@berkeley.edu/i
								email = Email.new
								email.email = link.text
								email.save
								emails << link.text
							end
						end
					end
				end
			end
		end

		alpha.each do |a|
			form = page.forms[1]
			form.field_with(:name => "search-type").value = 'last'
			form.field_with(:name => "search-base").value = 'students'
			form.field_with(:name => "search-term").value = a
			page = agent.submit(form, form.buttons.first)

			page.links.each do |link|
				if link.text =~ /@berkeley.edu/i
					email = Email.new
					email.email = link.text
					email.save
					emails << link.text
				end
			end
		end

		alpha.each do |a|
			alpha.each do |b|
				alpha.each do |c|
					form = page.forms[1]
					form.field_with(:name => "search-type").value = 'last'
					form.field_with(:name => "search-base").value = 'students'
					form.field_with(:name => "search-term").value = a+b+c
					page = agent.submit(form, form.buttons.first)

					page.links.each do |link|
						if link.text =~ /@berkeley.edu/i
							email = Email.new
							email.email = link.text
							email.save
							emails << link.text
						end
					end
				end
			end
		end

		alpha.each do |a|
			alpha.each do |b|
				alpha.each do |c|
					alpha.each do |d|
						form = page.forms[1]
						form.field_with(:name => "search-type").value = 'last'
						form.field_with(:name => "search-base").value = 'students'
						form.field_with(:name => "search-term").value = a+b+c+d
						page = agent.submit(form, form.buttons.first)

						page.links.each do |link|
							if link.text =~ /@berkeley.edu/i
								email = Email.new
								email.email = link.text
								email.save
								emails << link.text
							end
						end
					end
				end
			end
		end

		emails.each do |e|
			puts e
		end
	end
end
