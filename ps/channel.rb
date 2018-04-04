module Channel
  @@subscribers = []
  def self.publish(msg)
    @@subscribers.each do |subscriber|
      subscriber.send(:handle, msg)
    end
  end
  def self.build(klass, *args)
    instance = klass.new(*args)
    instance.extend(PubSub)
    @@subscribers << instance
    instance
  end

  module PubSub
    def publish(msg)
      if msg[:action]
        Channel.publish(msg)
      else
        raise ArgumentError
      end
    end
  end
end
