module ApplicationHelper
	def ipfilter(ip)
		arr = ip.split(".")
		arr[2] = "xxx"
		return arr.join(".")
	end
	
  def nl2br(str)
    str.gsub("\n\r","<br>").gsub("\r", "").gsub("\n", "<br />").html_safe
  end
	
  def nl2li(str)
    str.gsub("\n\r","</li><li>").gsub("\r", "").gsub("\n", "</li><li>").html_safe
  end
	
  # Layout Helpers
  def title(page_title)
    content_for(:title, page_title.to_s)  
  end
  
  def javascript(*args)
    content_for(:javascripts) { javascript_include_tag(*args) }
  end

  def description(desc)
    content_for(:description, desc.to_s)  
  end

  def fb_image(url)
    content_for(:fb_image, FULL_URL(url))
  end

  def url_for_fb(url)
    content_for(:url_for_fb, FULL_URL(url))
  end


  # for Facebook
  def build_og_tags(obj)
    url_for_fb(obj.share_url)
    
    if obj.class.to_s == "Trip"
	    title(obj.title)
      fb_image(obj.photo_url(:fb))
    elsif obj.class.to_s == "Post"
	    title(obj.trip.title)
      fb_image(obj.photo_url(:normal))
			description(obj.body)
    end
    
  end
	
	
	
  #
  # Current Path Helpers
  #
  
  def current_path?(rhs)
    if rhs
      if rhs.is_a?(Array)
        rhs.include?(request.path)
      elsif rhs.is_a?(Regexp)
        rhs.match(request.path) != nil
      else
        rhs == request.path
      end
    else
      false
    end
  end



  def current_controller?(rhs)
    if rhs
      if rhs.is_a?(Array)
        rhs.include?(params[:controller])
      elsif rhs.is_a?(Regexp)
        rhs.match(params[:controller]) != nil
      else
        rhs == params[:controller]
      end
    else
      false
    end
  end

  def current_action?(rhs)
    if rhs
      if rhs.is_a?(Array)
        rhs.include?(params[:action])
      elsif rhs.is_a?(Regexp)
        rhs.match(params[:action]) != nil
      else
        rhs == params[:action]
      end
    else
      false
    end
  end



  #
  # Navigation Tag Helpers
  #
	
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
			company = path.sub('/?company=','')
      if options[:icon].present?
        caption = "<i class=\"#{options.delete(:icon)}#{ ' icon-white' if options[:current] }\"></i> #{caption}".html_safe
      end

      if options[:count].present?
				if company == "소니/미놀타"
					cc = Camera.where(company: "sony").count + Camera.where(company: "minolta").count					
	        caption = "#{caption} <span class=\"num_badge\">(#{cc})</span>".html_safe
				elsif company == "etc."
					cc = Camera.where(company: "leica").count + Camera.where(company: "contax").count + Camera.where(company: "sigma").count
					caption = "#{caption} <span class=\"num_badge\">(#{cc})</span>".html_safe
				else
	        caption = "#{caption} <span class=\"num_badge\">(#{Camera.where(company: company).count})</span>".html_safe
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
