# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
require "rails/test_help"

# Filter out the backtrace from minitest while preserving the one from other libraries.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

IMAGE_HTML_LOADING_BLANK = <<~HTML
  <img src="fake.jpg">
  <img src="fake.png">
  <img src="fake.webp">
  <img src="fake.svg">
  <img src="fake.gif">
HTML

IFRAME_HTML_LOADING_BLANK = <<~HTML
  <iframe src="fake.com">
  <iframe src="fake.org">
  <iframe src="fake.net">
  <iframe src="fake.dev">
  <iframe src="fake.space">
HTML

HTML_WITH_LOADING_ATTRIBUTES = <<~HTML
  <img src="fake.jpg" loading="auto">
  <img src="fake.png" loading="eager">
  <iframe src="fake.com" loading="auto">
  <iframe src="fake.org" loading="eager">
HTML
