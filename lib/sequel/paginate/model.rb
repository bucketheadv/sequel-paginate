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
              begin
                page_per = args[1][:page_per]
              rescue
                page_per = nil
              end
              page_no = args.first.to_i > 0 ? args.first : 1
              where.extension(:pagination).paginate(page_no, page_per || base.paginate_per)
            end
          end
        end
      end
    end
  end
end
