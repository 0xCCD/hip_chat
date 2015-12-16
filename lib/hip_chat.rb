require "hip_chat/version"

module HipChat
end

parent_folder = Pathname.new(__FILE__).parent.to_path
Dir[File.join(parent_folder, "hip_chat", "*.rb")].each { |path| require(path) }
