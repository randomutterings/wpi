raw_config = File.read(RAILS_ROOT + "/config/app_config.yml")
APP_CONFIG = YAML.load(raw_config)[RAILS_ENV].symbolize_keys
Paperclip.options[:command_path] = APP_CONFIG[:image_magick_path]
ActionMailer::Base.default_url_options[:host] = APP_CONFIG[:domain]