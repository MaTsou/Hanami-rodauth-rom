module SaneBudget
  module Components
    class Icon
      def initialize
        @options = { style: "vertical-align: top;" }
      end

      def render( name, *options )
        %Q(
          <iconify-icon icon='mdi:#{name}' #{to_string( compute( *options ) )}>
          </iconify-icon>
        ).html_safe
      end

      def define( icons, **options )
        icons.merge( icons ) do |k, v|
          render( k, options, v )
        end
      end

      private

      def to_string( options )
        %Q(
          style='#{options[:style]}'
          class='#{options[:class]}'
        ).gsub("\n", "").gsub(/\s\s+/," ").strip
      end

      def compute( *options )
        {
          style: styles( @options, *options).join('; '),
          class: classes( @options, *options ).join(' ')
        }
      end

      def styles( *options )
        options.map do |opt|
          opt.fetch( :style, '' ).split(';').map(&:strip)
        end.flatten
      end

      def classes( *options )
        options.map do |opt|
          opt.fetch( :class, '' ).split(' ').map(&:strip)
        end.flatten
      end
    end
  end
end
