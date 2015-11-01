module Sequel
  module Paginate
    class Railtie < ::Rails::Railtie
      initialize 'sequel-paginate' do |_app|
        if defined?(::ActionSupport)
          ::ActionSupport.on_load(:action_view) do
            ::ActionView::Base.send :include, ::Sequel::Paginate::ViewsHelper
          end
        end
      end
    end
  end
end
