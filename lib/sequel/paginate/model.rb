module Sequel
  module Paginate 
    module Model 
      def self.included(base)
        base.extend(self)
      end
      def self.extended(base)
        class << base
          def paginate_per(count = 20)
            @@paginate_per ||= count
          end
        end

        base.class_eval do
          dataset_module do
            define_method(:page) do |*args, &block|
              p base
              page_no = args.first
              where.extension(:pagination).paginate(page_no, base.paginate_per)
            end
          end
        end
      end
    end
  end
end
