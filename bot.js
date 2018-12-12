const Discord = require('discord.js')
const client = new Discord.Client()

client.on('ready', () => {
    console.log("Connected as " + client.user.tag)
    message.reply("I am alive!")
})

client.on("message", message => {
    if (message.content == "!ping") {
        message.reply("pong");
    }
});

client.login(process.env.BOT_TOKEN);
