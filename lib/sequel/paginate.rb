require "sequel/paginate/version"
require "sequel/paginate/model"
require "sequel/paginate/views_helper"

module Sequel
  module Paginate
    # Your code goes here...
  end
end

if defined?(Rails)
  require "sequel/paginate/railtie"
end

if defined?(::Padrino)
  ::Padrino::Application.send :include, ::Sequel::Paginate::ViewsHelper
end

