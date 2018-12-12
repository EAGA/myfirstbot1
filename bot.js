const Discord = require('discord.js')
const client = new Discord.Client()

client.on('ready', () => {
    console.log("Connected as " + client.user.tag)
})

// Get your bot's secret token from:
// https://discordapp.com/developers/applications/
// Click on your application -> Bot -> Token -> "Click to Reveal Token"
bot_secret_token = "NTIyMjg3MzU1NTA0MzYxNDcz.DvIxzw.eMm83SV5BeHaUg1HnmguIQS7PMg"

client.login(process.env.BOT_TOKEN);
