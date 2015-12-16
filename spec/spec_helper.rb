$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hip_chat'

Dir[File.join("./spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.formatter = :progress
  config.order = :random

  # include helpers:
  config.include WebmockHelpers, {webmock: true}
end
