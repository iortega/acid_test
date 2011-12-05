class Message
  @queue = :messages

  def self.perform(msg)
    puts "Received #{msg}"
  end
end