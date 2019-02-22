# This is the script for J.E.K.

require 'discordrb'

jekbot = Discordrb::Bot.new token: 'NTQ4MzE3NDQ2MjE4NzExMDYw.D1D83Q.H_p5pKVnr0yDfi-OxBPhcH5zU_8', client_id: 548317446218711060

jekbot.message(with_text: '*they\'re') do |event|
	event.respond 'INCORRECT USE OF "THEIR" DETECTED'
end

jekbot.run