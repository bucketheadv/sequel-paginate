module Sequel 
  module Paginate
    module ViewsHelper 
      def self.included(base)
        base.extend(self)
      end
      def paginate(models, *args, &block)
        args = [{}] if args.nil? || args.empty?
        page_no = (params[:page] || 1).to_i
        left   = args[0][:left]    || 3
        right  = args[0][:right]   || 3
        middle = args[0][:middle]  || 3
        html_class = args[0][:class] || "paginate"
        class_name = models.first.class
        path = request.path
        page_count = (1..(class_name.count.to_f / class_name.paginate_per).ceil).to_a
        page_to_show = []
        if page_count.count > left + right + middle
          page_count.each do |p|
            if page_no > left && page_no < page_count[-right]
              if p > page_no + middle || p < page_no - middle
                page_to_show << -1
              else
                page_to_show << p
              end
            else
              page_to_show << p
            end
          end
        else
          page_to_show = page_count
        end
        page_to_show.flatten!.uniq!
        #if page_count.count > left + right + middle
        #  page_to_show = page_count[0..left-1]
        #  if page_no - middle > left && page_no + middle < right
        #    page_to_show << ((page_no - middle)..page_no).to_a
        #    page_to_show << -1
        #  end
        #  page_to_show << page_count[-right..-1]
        #  page_to_show.flatten!
        #else
        #  page_to_show = page_count
        #end

        html = "<ul class='#{html_class}'>"
        if page_no <= 1
          html += "<li><a>Prev</a></li>"
        else
          html += "<li><a href='#{path}?page=#{page_no-1}'>Prev</a></li>"
        end
        page_to_show.each do |page|
          if page == -1
            html += "<li><a>...</a></li>"
          else
            if page == page_no
              html += "<li><a>#{page}</a></li>"
            else
              html += "<li><a href='#{path}?page=#{page}'>#{page}</a></li>"
            end
          end
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
