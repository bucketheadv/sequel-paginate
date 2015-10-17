module Sequel 
  module Paginate
    module ViewsHelper 
      def paginate(models, *args, &block)
        # page_no = params[:page] || 1
        page_no = 1
        left = args.first[:left] || 3
        right = args.first[:right] || 3
        path = "/models"
        page_count = (1..(models.first.class.count.to_f / models.first.class.paginate_per).ceil).to_a

        p page_count
        html = ""
        if page_no <= 1
          html += "<a>Prev</a>"
        else
          html += "<a href='#{path}?page=#{page_no-1}'>Prev</a>"
        end
        page_count.each do |page|
          html += "<a href='#{path}?page=#{page}'>Prev</a>"
        end
        if page_no >= page_count.count
          html += "<a>Next</a>"
        else
          html += "<a href='#{path}?page=#{page_no+1}'>Next</a>"
        end
        html
      end
    end
  end
end
