local litcord = require('litcord')
local client = litcord('NTIyMjg3MzU1NTA0MzYxNDcz.DvKkNw.d5HLnw1okApixqKbbiXmJfOjlpg')

client:on(
	'messageCreate',
	function(message)
		local author = message.author
		print(author.username..': '..message.clean)
	end
)

litcord:run()