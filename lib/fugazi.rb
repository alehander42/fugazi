module Fugazi
  def self.included(receiver)
    receiver.send :include, InstanceMethods
    receiver.extend ClassMethods
  end

  module ClassMethods
    def defaults(**kwargs)
      @defaults = kwargs
    end

    def fields(*args)
      @fields = args
    end

    def keywords(*args, **kwargs)
      @keywords = args
      @default_keywords = kwargs
    end

    def default_args
      @defaults || {}
    end

    def field_args
      @fields || []
    end

    def keyword_args
      @keywords || []
    end

    def default_keyword_args
      @default_keywords || {}
    end
  end

  module InstanceMethods
    def initialize(*args, **kwargs)
      e = args.length - self.class.field_args.length - 1
      labels = self.class.field_args + (self.class.default_args.to_a[0..e] || []).map { |n, _| n }
      labels.zip(args).each do |label, arg|
        instance_variable_set "@#{label}", arg
        self.class.send :attr_reader, label
      end

      (self.class.default_args.to_a[e + 1..-1] || []).each do |default, value|
        instance_variable_set "@#{default}", value
        self.class.send :attr_reader, default
      end

      kwargs.each do |key, arg|
        instance_variable_set "@#{key}", arg
        self.class.send :attr_reader, key
      end

      self.class.default_keyword_args.each do |key, default|
        unless kwargs.key? key
          instance_variable_set "@#{key}", default
          self.class.send :attr_reader, key
        end
      end
    end
  end
end

# class A
#   include Fugazi
#   fields :z
#   defaults y: 2
# end

# a = A.new 2
# puts a.z, a.y