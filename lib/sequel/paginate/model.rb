module Sequel
  module Paginate 
    module Model 
      def self.extended(base)
        class << base
          dataset_module do
            def page(page_no = 1)
              where.extension(:pagination).paginate(page_no, 10)
            end
          end
        end
      end
    end
  end
end
