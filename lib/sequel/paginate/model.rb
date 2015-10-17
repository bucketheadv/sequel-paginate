module Sequel
  module Paginate 
    module Model 
      def self.included(base)
        base.extend(self)
      end
      def self.extended(base)
        base.class_eval do
          dataset_module do
            def page(page_no = 1)
              where.extension(:pagination).paginate(page_no, paginate_per)
            end
          end
        end

        class << base
          def paginate_per(count = 20)
            @paginate_per ||= count
          end
        end
      end
    end
  end
end
