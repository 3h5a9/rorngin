# frozen_string_literal: true

#   Template Name: Rails Ngin
#   Author: Sayed Mohammad Ehsan
#   Author URI: https://nginit.com
#   Thanks : Chris Oliver & Andy Leverenz
#   Made with LOVE from BANGLADESH

def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

def add_gems
  gem 'devise'
  gem 'devise-bootstrap-views', '~> 1.0'
end

def generator
  generate 'devise:install'

  environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }",
              env: 'development'

  generate :controller, 'pages index --no-helper --no-assets --no-controller-specs --no-view-specs --no-test-framework'
  route "root 'pages#index'"

  generate :controller, 'admin/dashboard index --no-helper --no-assets --no-controller-specs --no-view-specs --no-test-framework'

  generate :devise, 'User'

  # Devise Bootstrap
  generate 'devise:views:bootstrap_templates'
end

def add_bootstrap
  run 'yarn add bootstrap jquery popper.js'

  content = <<-JS
  const webpack = require('webpack')
  environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Rails: '@rails/ujs'
  }))
  JS

  insert_into_file 'config/webpack/environment.js', content + "\n", before: 'module.exports = environment'

  run 'yarn add @fortawesome/fontawesome-free'
end

def copy_template
  directory 'app', force: true
end

def add_foreman
  copy_file 'Procfile'
end

# Main Setup
source_paths

add_gems

after_bundle do
  generator
  copy_template
  add_bootstrap
  add_foreman

  rails_command 'db:create'
  rails_command 'db:migrate'

  say
  say 'railsngin app successfully created! 👍 ☕', :green
end
