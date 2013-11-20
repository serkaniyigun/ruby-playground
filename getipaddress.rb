require 'JSON'
require 'open-uri'
require 'net/smtp'



def send_email
	ex_ip = open( 'http://jsonip.com/ ' ){ |s| JSON::parse( s.string())['ip'] }
	puts ex_ip

message = <<MESSAGE_END
From: serkan
To: master
subject: TEST from ruby
Date: #{Time.now.rfc2822}
my ip address #{ex_ip}
MESSAGE_END

	smtp = Net::SMTP.new 'smtp.gmail.com', 587
	smtp.enable_starttls
		smtp.start('gmail.com', 'example@gmail.com', 'password', :login) do |smtp|
		smtp.send_message message, 'example@gmail.com', 'to@gmail.com'
	end

end

result = send_email
puts result