module ApplicationHelper
	def ipfilter(ip)
		arr = ip.split(".")
		arr[2] = "xxx"
		return arr.join(".")
	end
	
	
	
  def navigation_tag(options = {}, &block)
    b = NavigationBuilder.new(self, options)
    yield b
    concat(b.to_html) unless b.empty?
    nil
  end
  
  class NavigationBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::CaptureHelper
    
    def initialize(template, options = {})
      @template = template
      @items = []
      @container_id = options.delete(:id)
      @container_class = options.delete(:class)
      @spacer = options.delete(:spacer) || "\n"
    end
    
    def empty?
      @items.empty?
    end
    
    def item(caption, path, options = {})
      anchor_option = options.delete(:anchor_option) || {}
      if options[:icon].present?
        caption = "<i class=\"#{options.delete(:icon)}#{ ' icon-white' if options[:current] }\"></i> #{caption}".html_safe
      end

      if options[:count].present?
				if caption = "sony/minolta"
					cc = Camera.where(company: "sony").count + Camera.where(company: "minolta").count					
	        caption = "#{caption} <span class=\"num_badge\">(#{cc})</span>".html_safe
				else
	        caption = "#{caption} <span class=\"num_badge\">(#{Camera.where(company: caption).count})</span>".html_safe
				end
      end      
      @items << [@template.link_to(caption, path, anchor_option), options]
      nil
    end
    
    def item_html(options = {}, &block)
      content = @template.capture(&block)
      @items << [content, options]
      nil
    end
    
    def item_wrapper(content, options = {})
      classes = [] 
      html_option = options.delete(:html) || {}
      classes << html_option.delete(:class)
      classes << "first"   if @items.first[0] == content
      classes << "last"     if @items.last[0] == content
      classes << "active"   if options.delete(:current)
      html_option[:class] = classes.join(" ") unless classes.empty?
      content_tag :li, content, html_option
    end
    
    def build
      content_tag :ul, @items.collect{|t| item_wrapper(*t)}.join(@spacer).html_safe, :id => @container_id, :class => @container_class
    end
    
    alias :to_html :build
  end
	
end
