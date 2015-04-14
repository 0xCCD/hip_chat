module HipChat
  class Relation < Array
    def initialize(token, list, list_class)
      super(list)

      @token = token
      @list_class = list_class

      self.map! do |element|
        list_class.new(@token, element)
      end
    end

    %w{
      find
      create
      create!
    }.each do |method_name|
      define_method method_name do |*args|
        @list_class.public_send(method_name, @token, *args)
      end
    end
  end
end
