require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module Floodapp
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.i18n.load_path += Dir[
      Rails.root.join('config', 'locales', '**', '*.{rb,yml}')
    ]
    config.active_record.raise_in_transactional_callbacks = true
  end
end
