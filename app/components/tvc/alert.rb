class TVC::Alert < ViewComponent::Base
  def initialize(message:)
    @message = message
  end

  private

  attr_reader :message
end
