require 'bundler'

Bundler.require

require 'pry'
require 'open-uri'

require_relative '../lib/gotta_read_woc_books/version'
require_relative '../lib/gotta_read_woc_books/scraper'
require_relative '../lib/gotta_read_woc_books/book'
require_relative '../lib/gotta_read_woc_books/cli'
