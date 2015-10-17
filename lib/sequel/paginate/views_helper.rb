module Sequel 
  module Paginate
    module ViewsHelper 
      def self.included(base)
        base.extend(self)
      end
      def paginate(models, *args, &block)
        page_no = params[:page] || 1
        #page_no = 1
        # left = args.first[:left] || 3
        # right = args.first[:right] || 3
        class_name = models.first.class
        path = request.path
        page_count = (1..(class_name.count.to_f / class_name.paginate_per).ceil).to_a

        html = ""
        if page_no <= 1
          html += "<a>Prev</a>"
        else
          html += "<a href='#{path}?page=#{page_no-1}'>Prev</a>"
        end
        page_count.each do |page|
          html += "<a href='#{path}?page=#{page}'>#{page}</a>"
        end
        if page_no >= page_count.count
          html += "<a>Next</a>"
        else
          html += "<a href='#{path}?page=#{page_no+1}'>Next</a>"
        end
        html.html_safe
      end
    end
  end
end
