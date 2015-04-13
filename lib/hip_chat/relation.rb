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

    def find(hash)
      method_missing("find", hash)
    end

    def method_missing(method_name, *args)
      @list_class.send(method_name, @token, *args)
    end
  end
end
