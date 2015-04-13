$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hip_chat/api'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
