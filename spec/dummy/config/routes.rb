Rails.application.routes.draw do
  root to: "demos#show"
  mount TVC::Engine => "/tvc"
end
