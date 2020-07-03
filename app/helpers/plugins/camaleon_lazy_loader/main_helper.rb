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
    return if @_plugin_do_cache # Do not process when reading from cache.
    response.body = apply_lazy_loading response.body
  end

  def camaleon_lazy_loader_front_cache_writing_cache(args)
    args[:data] = apply_lazy_loading args[:data] # Save processed HTML to cache.
    response.body = apply_lazy_loading response.body
  end
end
