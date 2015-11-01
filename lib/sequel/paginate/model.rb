module Sequel
  class Model
    def self.inherited(base)
      base.class_eval do
        base.send :include, ::Sequel::Paginate::Realization
        def paginate_per(count = 20)
          @paginate_per ||= count
        end
      end
    end
  end
  module Paginate 
    module Realization
      def self.included(base)
        base.extend(self)
      end

      def self.extended(base)
        # return unless base.ancestors.include?(Sequel::Model)
        base.class_eval do
          dataset_module do
            define_method(:page) do |*args, &block|
              begin
                page_per = args[1][:page_per]
              rescue
                page_per = nil
              end
              page_no = args[0].to_i
              page_no = page_no > 0 ? page_no : 1
              where.extension(:pagination).paginate(page_no.to_i, page_per || base.paginate_per)
            end
          end
        end
      end
    end
  end
end

