module Sequel 
  module Paginate
    module ViewsHelper 
      def self.included(base)
        base.extend(self)
      end
      def paginate(models, *args, &block)
        args = [{}] if args.nil?
        page_no = (params[:page] || 1).to_i
        left   = args[0][:left]    || 3
        right  = args[0][:right]   || 3
        middle = args[0][:middle]  || 3
        class_name = models.first.class
        path = request.path
        page_count = (1..(class_name.count.to_f / class_name.paginate_per).ceil).to_a
        if page_count.count > left + right + middle
          page_to_show = page_count[0..left-1]
          page_to_show << page_count[-right..-1]
        end

        html = "<ul class='#{"paginate"}'>"
        if page_no <= 1
          html += "<li><a>Prev</a></li>"
        else
          html += "<li><a href='#{path}?page=#{page_no-1}'>Prev</a></li>"
        end
        page_to_show.each do |page|
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
