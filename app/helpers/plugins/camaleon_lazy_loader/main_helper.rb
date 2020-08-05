module Plugins::CamaleonLazyLoader::MainHelper
  def self.included(klass)
  end

  def clear_front_cache(_plugin)
    front_cache_clean
  end

  def apply_lazy_loading(html)
    doc = Nokogiri::HTML.parse html
    nodes = doc.css "img, iframe"
    nodes.each { |node| node["loading"] ||= "lazy" }
    doc.to_html
  end

  def camaleon_lazy_loader_front_after_load
    return if @skip_lazy_loader || @_plugin_do_cache
    response.body = apply_lazy_loading response.body
  end

  def camaleon_lazy_loader_front_cache_writing_cache(args)
    args[:data] = apply_lazy_loading args[:data] # Save processed HTML to cache.
    response.body = apply_lazy_loading response.body
  end

  def camaleon_lazy_loader_skip_lazy_loader(_args)
    @skip_lazy_loader = true
  end
end
