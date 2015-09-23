class Gather < ApplicationMailer
	def self.test_mail
		emails = Email.where(sent: nil)

		client = SendGrid::Client.new do |c|
			c.api_user = "app41652662@heroku.com".to_s
	        c.api_key = "8hpkh36i0216".to_s
		end

		emails.each_with_index do |e, i|
			if i == 1000
				return
			end

			sleep 6
			puts e.email
			mail = SendGrid::Mail.new do |m|
				m.to = e.email
				m.subject = "Experience on campus"
				m.from = 'Chris Lin <chris@associatedstudents.org>'
				m.from_name = 'Chris Lin'
				m.text = 'We at Associated Students for Change (ASoC) want to share with you a project we are supporting in an effort to bring people back together. Below is a snippet from our post.. 

	"In an age where pre-dominant communication is digital (friends/family/dating) and because of technologies like fb, twitter, instagram, and snapchat life has become more of a spectator sport than a participatory environment with deep connecting human interaction.
	With this lack of physical connection comes a lack of satisfaction and is considered to be one of the leading causes of depression (http://www.theguardian.com/commentisfree/2014/aug/16/depression-disease-loneliness-friends).  We often to seek to cure our loss with things (consumerism) and that is merely a fleeting cure." Continue reading (http://associatedstudents.org/2015/09/21/is-being-more-digitally-connected-making-our-lives-better/)

	Should you choose not to read any further the project we are supporting is Gather (https://bit.ly/1KpOTFi) - a minimal mobile app with the sole intention of using technology to actually spend time with your friends. Download it and invite your friends to hang out. Stop being a voyeur and have an experience! 

	With Love, 

	ASoC'
				m.html = 'We at Associated Students for Change (ASoC) want to share with you a project we are supporting in an effort to bring people back together. Below is a snippet from our post.. 
	<br><br>
	"In an age where pre-dominant communication is digital (friends/family/dating) and because of technologies like fb, twitter, instagram, and snapchat life has become more of a spectator sport than a participatory environment with deep connecting human interaction.
	With this lack of physical connection comes a lack of satisfaction and is considered to be one of the <a href="https://www.theguardian.com/commentisfree/2014/aug/16/depression-disease-loneliness-friends">leading causes of depression</a>.  We often to seek to cure our loss with things (consumerism) and that is merely a fleeting cure." <a href="http://associatedstudents.org/2015/09/21/is-being-more-digitally-connected-making-our-lives-better/">Continue reading</a> 
	<br><br>
	Should you choose not to read any further the project we are supporting is <a href="https://bit.ly/1KpOTFi">Gather</a> - a minimal mobile app with the sole intention of using technology to actually spend time with your friends. Download it and invite your friends to hang out. Stop being a voyeur and have an experience! 
	<br><br>
	With Love, 
	<br><br>
	ASoC
	<br><br><br>
	==============================================<br>
	You are receiving this e-mail because you are a student at the University of California.
	<br>
	<br>
	Unsubscibe from this list by replying to this email with the subject line "Unsubscribe"'
			end
			client.send(mail)
			e.sent = true
			e.save
		end
	end
end
