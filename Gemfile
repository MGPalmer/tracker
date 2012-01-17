source 'http://rubygems.org'

gem 'rails', '3.1.3'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'therubyracer'
gem 'acts_as_archive', :git => "git://github.com/stipple/acts_as_archive.git"
gem 'also_migrate', '0.3.6' # fix for migration names, see http://stackoverflow.com/questions/7798837/rails-3-1-migrations-drops-timestamp-in-migration-filenames
gem 'rake'
gem 'haml-rails'
gem 'jquery-rails'

gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre' #as suggested by http://activeadmin.info/documentation.html

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# To use debugger
group :development do 
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
