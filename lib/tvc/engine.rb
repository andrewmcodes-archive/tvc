module TVC
  class Engine < ::Rails::Engine
    isolate_namespace TVC

    config.generators do |g|
      g.test_framework :rspec
    end

    config.app_middleware.use(
      Rack::Static,
      urls: ["/tvc-packs"], root: "tvc/public"
    )

    initializer "webpacker.proxy" do |app|
      insert_middleware = begin
                          TVC.webpacker.config.dev_server.present?
                          rescue
                            nil
                        end
      next unless insert_middleware

      app.middleware.insert_before(
        0, Webpacker::DevServerProxy, # "Webpacker::DevServerProxy" if Rails version < 5
        ssl_verify_none: true,
        webpacker: TVC.webpacker
      )
    end
  end
end

Dir[TVC::Engine.root.join("app", "helpers", "*.rb")].each { |f| require f }
