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
          p base
          dataset_module do
            p base
            def page(page_no = 1)
              p base
              where.extension(:pagination).paginate(page_no, base.paginate_per)
            end
          end
        end
      end
    end
  end
end
