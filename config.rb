require 'slim'
require 'slim/include'

require 'susy'
require 'sass'
require 'yaml'
require 'lib/helpers'

require 'rmagick'

module Sass::Script::Functions
  def greate_masters()
    Sass::Script::List.new(Helpers::MASTERS['items']
      .map{ |item| item["id"] }
      .map{ |s| Sass::Script::String.new(s) }, :space)
  end
  def dominant_color(path)
    img = ::Magick::Image::read("source/images/#{path.value}").first
    pix = img.scale(1, 1)
    Sass::Script::Value::Color.from_hex(pix.to_color(pix.pixel_color(0, 0)))
      .with(:alpha => 0.9)
  end
end

helpers Helpers

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
with_layout :collectives do
  page "/collectives/*"
end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  #activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
