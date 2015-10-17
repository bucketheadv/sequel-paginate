require "sequel/paginate/views_helper"
require "sequel/paginate/version"
require "sequel/paginate/model"

module Sequel 
  module Sinatra 
    class << self
      def load
        ::Padrino::Application.send(:include, Sequel::Paginate::ViewsHelper)
      end
    end
  end
end

Sequel::Sinatra.load
