require "webpacker/helper"

module TVC
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      TVC.webpacker
    end
  end
end
