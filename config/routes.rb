Rails.application.routes.draw do
  get 'sentences/sampler'

  namespace :sentences do
    get :sampler
  end
end
