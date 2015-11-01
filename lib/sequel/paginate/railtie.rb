module Sequel
  module Paginate
    class Railtie < ::Rails::Railtie
      initializer 'sequel-paginate' do |_app|
        if defined?(::ActiveSupport)
          ::ActiveSupport.on_load(:action_view) do
            ::ActionView::Base.send :include, ::Sequel::Paginate::ViewsHelper
          end
        end
      end
    end
  end
end
