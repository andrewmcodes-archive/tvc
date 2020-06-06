module TVC
  class Engine < ::Rails::Engine
    isolate_namespace TVC

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end

Dir[TVC::Engine.root.join("app", "helpers", "*.rb")].each { |f| require f }
