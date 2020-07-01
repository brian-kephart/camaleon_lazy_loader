require "test_helper"

class CamaleonLazyLoader::Test < ActiveSupport::TestCase
  include Plugins::CamaleonLazyLoader::MainHelper

  test "loading attribute is added to images" do
    unprocessed_html = Nokogiri::HTML.parse IMAGE_HTML_LOADING_BLANK
    assert_equal 0, unprocessed_html.css('img[loading="lazy"]').size
    assert_equal 5, unprocessed_html.css('img:not([loading="lazy"])').size

    processed_html = Nokogiri::HTML.parse apply_lazy_loading(IMAGE_HTML_LOADING_BLANK)
    assert_equal 5, processed_html.css('img[loading="lazy"]').size
    assert_equal 0, processed_html.css('img:not([loading="lazy"])').size
  end

  test "loading attribute is added to iframes" do
    unprocessed_html = Nokogiri::HTML.parse IFRAME_HTML_LOADING_BLANK
    assert_equal 0, unprocessed_html.css('iframe[loading="lazy"]').size
    assert_equal 5, unprocessed_html.css('iframe:not([loading="lazy"])').size

    processed_html = Nokogiri::HTML.parse apply_lazy_loading(IFRAME_HTML_LOADING_BLANK)
    assert_equal 5, processed_html.css('iframe[loading="lazy"]').size
    assert_equal 0, processed_html.css('iframe:not([loading="lazy"])').size
  end

  test "loading attribute is not overwritten" do
    unprocessed_html = Nokogiri::HTML.parse HTML_WITH_LOADING_ATTRIBUTES
    processed_html = Nokogiri::HTML.parse apply_lazy_loading(HTML_WITH_LOADING_ATTRIBUTES)
    assert_equal 0, unprocessed_html.css('img[loading="lazy"]').size
    assert_equal 2, unprocessed_html.css('img:not([loading="lazy"])').size
    assert_equal 0, processed_html.css('img[loading="lazy"]').size
    assert_equal 2, processed_html.css('img:not([loading="lazy"])').size

    assert_equal 0, unprocessed_html.css('iframe[loading="lazy"]').size
    assert_equal 2, unprocessed_html.css('iframe:not([loading="lazy"])').size
    assert_equal 0, processed_html.css('iframe[loading="lazy"]').size
    assert_equal 2, processed_html.css('iframe:not([loading="lazy"])').size
  end
end
