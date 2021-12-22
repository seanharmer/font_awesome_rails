require 'font_awesome_rails/fa_icon_helper'

module FontAwesomeRails
  module IconHelper
    def fa_icon(icon)
      FontAwesomeRails::FaIconUtil.new(icon, options).tag
    end
  end
end