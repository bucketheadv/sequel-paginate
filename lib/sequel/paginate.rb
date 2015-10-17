require "sequel/paginate/version"
require "sequel/paginate/model"
require "sequel/paginate/views_helper"

if defined?(Padrino::Application)
  Padrino::Application.instance_eval {
    include Sequel::Paginate::ViewsHelper
  }
end

module Sequel
  module Paginate
    # Your code goes here...
  end
end
