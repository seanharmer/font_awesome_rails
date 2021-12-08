# frozen_string_literal: true

require_relative "font_awesome_rails/version"

module FontAwesomeRails
  class Error < StandardError
  end

  require 'font_awesome_rails/version'
  require 'font_awesome_rails/engine' if defined?(::Rails)
end
