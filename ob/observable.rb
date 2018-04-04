module Observable
  def add_subscriber(subscriber)
    subscribers << subscriber
  end

  def subscribers
    @subscribers ||= []
  end

  def notify(message = :call, content = nil)
    subscribers.each do |subscriber|
      subscriber.send(message, content)
    end
  end

  def subscribe_to(publisher)
    publisher.add_subscriber(self)
  end
end
