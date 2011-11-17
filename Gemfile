# EXAMPLE Gemfile for a spree application, your Gemfile will be different
source 'http://rubygems.org'

# Generic gem dependencies first
gem 'rails', '3.0.9'
gem 'aws-s3', :require => 'aws/s3'
gem 'dynamic_form'
gem 'heroku'
gem 'memcache-client'
#gem 'rake', '0.9.2'

# Followed by spree itself first, all spree-specific extensions second
gem 'spree', '0.60.1'
gem 'spree_wishlist', :git => 'git://raw.github.com/spree/spree_wishlist.git', :ref => '5172de86dd46905e6d60288584b567155055675e'

#gem 'spree_store_credits', :git => 'git://raw.github.com/spree/spree_store_credits.git', :branch => '0-60-x' 
#gem 'spree_editor', :git => 'git://raw.github.com/spree/spree_editor.git', :ref => 'da5c7fcb980d39a2e0f71a7f132463c28ef8c665'
#gem 'spree_recently_viewed', :git => 'git://raw.github.com/spree/spree_recently_viewed.git', :branch => '0-60-stable' 
#gem 'spree_static_content', :git => 'git://raw.github.com/spree/spree_static_content.git', :tag => 'v0.60.2'
#gem 'multi_currencies', :git => "git://github.com/pronix/spree-multi-currency.git"
#gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
#gem 'spree_wholesale', :git => 'git://raw.github.com/citrus/spree_wholesale.git', :branch => '0.60.x'
#gem 'spree_product_translations', :git => 'git://raw.github.com/jeroenj/spree-product_translations.git'
#gem "spree_locales_dropdown", :git => 'git://github.com/greendog/spree_locales_dropdown.git'
#gem 'spree_related_products', :git => 'git://raw.github.com/spree/spree_related_products.git', :ref => 'bee2e61193a713f8e993d250611a44a962ec7a2b' 
#gem 'spree_volume_pricing', :git => 'git://github.com/spree/spree_volume_pricing.git', :ref => 'd7cd09f4ff7ce7f33857'
#gem 'spree_comments', :git => 'git://raw.github.com/spree/spree_comments.git', :branch => '0-60-x'

# Dev/Test gems
group :development, :test do
 gem 'sqlite3'
 gem 'webrat'
 gem 'cucumber-rails'
 gem 'rspec-rails'
end

group :production do
 gem 'mysql2', '<0.3'
# gem 'rack-ssl', :require => 'rack/ssl'
end

gem 'capistrano'

# EOF
