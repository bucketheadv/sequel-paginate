module Sequel 
  module Paginate
    module ViewsHelper 
      def paginate(models, *args, &block)
        page_no = params[:page] || 1
        left = args.left || 3
        right = args.right || 3
        path = "/models"
        page_count = 1..(models.first.class.count / models.first.class.paginate_per).to_a
        html = ""
        if page_no <= 1
          html += "<a>Prev</a>"
        else
          html += "<a href='#{path}?page=#{page_no-1}'>Prev</a>"
        end
        pages_show = page_count.select { |idx|
          idx < left || idx < page_count[-right]
        }
        pages_show.each do |page|
          html += "<a href='#{path}?page=#{page}'>#{page}</a>"
        end
        if page_no >= page_count
          html += "<a>Next</a>"
        else
          html += "<a href='#{path}?page=#{page_no+1}'>Next</a>"
        end
        html
      end
    end
  end
end
