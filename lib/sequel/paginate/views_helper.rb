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
        remote = args[0][:remote]  || false
        html_class = args[0][:class] || "pagination"
        class_name = models.first.class
        path = request.path
        page_count = (1..(class_name.count.to_f / class_name.paginate_per).ceil).to_a
        page_to_show = []
        if page_count.count > left + right + middle
          page_count.each do |p|
            if p > left && p < page_count[-right]
              if (p < page_no + middle && p > page_no - middle)
                page_to_show << p
              else
                page_to_show << -1 unless page_to_show.last == -1
              end
            else
              page_to_show << p
            end
          end
        else
          page_to_show = page_count
        end

        html = "<ul class='#{html_class}'>"
        if page_no <= 1
          html += "<li><a>Prev</a></li>"
        else
          html += "<li class='previous'><a href='#{path}?page=#{page_no-1}' #{remote_tag(remote)}>Prev</a></li>"
        end
        page_to_show.each do |page|
          if page == -1
            html += "<li><a>...</a></li>"
          else
            if page == page_no
              html += "<li class='active'><a>#{page}</a></li>"
            else
              html += "<li><a href='#{path}?page=#{page}' #{remote_tag(remote)}>#{page}</a></li>"
            end
          end
        end
        if page_no >= page_count.count
          html += "<li><a>Next</a></li>"
        else
          html += "<li class='next'><a href='#{path}?page=#{page_no+1}' #{remote_tag(remote)}>Next</a></li>"
        end
        html.html_safe
      end
      private
      def remote_tag(remote)
        "data-remote='true'" if remote
      end
    end
  end
end
