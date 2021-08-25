require 'telegram_bot'
token = '1968855714:AAGnUzAVyRhbu8uJEVJ6F48D37gCXGbfv5A'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /hello/i
      reply.text = "Hello, #{message.from.first_name}. Hope you fine today ☀️."
    when /start/i
      reply.text = "All I can do is say hello. Try the /hello command."
    when /getid/i
      reply.text = "This is your telegram id: #{message.from.id}"
    when 'Thank you' || 'makasih' || 'terima kasih' || 'Terima kasih'
      reply.text = "You're welcome, #{message.from.first_name} 😁. Hope you always fine today!"
    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
