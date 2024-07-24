module SaneBudget
  module Components
    class Icon
      def initialize( **options )
        @options = {
          style: "vertical-align: top;"
        }.merge options
      end

      def render( name, **options )
        %Q(
          <iconify-icon icon="mdi:#{name}" #{to_string( compute( options ) )}>
          </iconify-icon>
        ).html_safe
      end

      private

      def to_string( options )
        %Q(
          style="#{options[:style]}"
          class="#{options[:class]}"
        )
      end

      def compute( options )
        {
          style: styles( @options, options).join('; '),
          class: classes( @options, options ).join(' ')
        }
      end

      def styles( *options )
        options.map do |opt|
          opt.fetch( :style, '' ).split(';').map(&:strip)
        end
      end

      def classes( *options )
        options.map do |opt|
          opt.fetch( :class, '' )
        end
      end
    end
  end
end
