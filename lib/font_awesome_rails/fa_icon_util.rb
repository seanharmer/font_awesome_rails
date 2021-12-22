module FontAwesomeRails
  class FaIconUtil
    include ActionView::Helpers::TagHelper

    attr_reader :icon, :options, :style, :text, :attrs

    def initialize(icon, options)
      @icon = icon
      @options = options
      @style = options[:style]
      @text = options[:text]
      @attrs = options.except(:text, :type, :class, :icon, :animation, :size, :right)
    end

    def classes
      @classes ||= generate_classes
    end

    def tag
      return icon_content_tag if @text.nil?
      icon_content_tag + text_content_tag
    end

    private
      def generate_classes
        tmp = Array.new
        tmp << icon_type(@options[:type])
        tmp += arr_with_fa(@icon)
        tmp += @options[:class].split(' ') unless @options[:class].nil?
        tmp += arr_with_fa(@options[:size]) unless @options[:size].nil?
        tmp += arr_with_fa(@options[:animation]) unless @options[:animation].nil?
        tmp.uniq.join(' ').strip
      end

      def icon_content_tag
        content_tag(:i, nil, class: classes, **@attrs)
      end

      def text_content_tag
        content_tag(:span, @text, style: @style)
      end

      def icon_type(type)
        return 'fas' if type.nil?

        case type.to_sym
        when :far, :regular
          'far'
        when :fal, :light
          'fal'
        when :fab, :brand
          'fab'
        when :fad, :duotone
          'fad'
        when :fak, :uploaded
          'fak'
        else
          'fas'
        end
      end

      def prepend_fa(string)
        "fa-#{string}"
      end

      def handle_input(input)
        case input
        when Symbol
          input.to_s.dasherize
        when Array
          input.join(' ').dasherize
        else
          input.to_s
        end
      end

      def arr_with_fa(array)
        array = handle_input(array)
        array.split(' ').map { |s| prepend_fa(s) }
      end
  end
end