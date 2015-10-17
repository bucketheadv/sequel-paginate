module Sequel 
  module Paginate
    module ViewsHelper 
      def self.included(base)
        base.extend(self)
      end
      def paginate(models, *args, &block)
        page_no = (params[:page] || 1).to_i
        #page_no = 1
        # left = args.first[:left] || 3
        # right = args.first[:right] || 3
        class_name = models.first.class
        path = request.path
        page_count = (1..(class_name.count.to_f / class_name.paginate_per).ceil).to_a

        html = "<ul class='#{"paginate"}'>"
        if page_no <= 1
          html += "<li><a>Prev</a></li>"
        else
          html += "<li><a href='#{path}?page=#{page_no-1}'>Prev</a></li>"
        end
        page_count.each do |page|
          html += "<li><a href='#{path}?page=#{page}'>#{page}</a></li>"
        end
        if page_no >= page_count.count
          html += "<li><a>Next</a></li>"
        else
          html += "<li><a href='#{path}?page=#{page_no+1}'>Next</a></li>"
        end
        html.html_safe
      end
    end
  end
end
