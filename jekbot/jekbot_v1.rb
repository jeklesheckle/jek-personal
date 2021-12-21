# This is the script for J.E.K.

require 'discordrb'

jekbot = Discordrb::Bot.new token: ######### redacted api token and personal ID ###########

jekbot.message(with_text: '*they\'re') do |event|
	event.respond 'INCORRECT USE OF "THEIR" DETECTED'
end

jekbot.message(with_text: /.*((furion)|(natures prophet)|(nature\'s prophet)).*/) do |event|
	event.respond 'shit hero detected ;_;'
end

jekbot.run
