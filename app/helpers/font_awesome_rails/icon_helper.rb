require 'font_awesome_rails/fa_icon_util'

module FontAwesomeRails
  module IconHelper
    def fa_icon(icon, options = {})
      FontAwesomeRails::FaIconUtil.new(icon, options).tag
    end
  end
end