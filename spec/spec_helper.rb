$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hip_chat'

parent_folder = Pathname.new(__FILE__).parent.to_s
Dir[File.join(parent_folder, "support", "helpers", "*.rb")].each { |path| require(path) }

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation

  config.include WebmockHelpers
end
