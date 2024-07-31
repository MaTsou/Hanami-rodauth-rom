module SaneBudget
  module Components
    # Icon class dedicated to render icon components inside templates
    # Choice is made to provide default .icon css class together with the name 
    # of the icon.
    # Using a Ruby class is smoother than a partial template because of the 
    # possibility to map icon_names to iconify-icon_names and icon stuff is 
    # totally encapsulated in the class..
    class Icon
      NAME_MAPPER = {
        add: 'circle-outlined',
        #trash: 'alternative-trash-icon'
      }

      def initialize
        @template = Tilt::HamlTemplate.new {
          <<~HAML
          %iconify-icon.icon{ class: name, icon: ico }
          HAML
        }
      end

      def render( name )
        @template.render(
          self,
          name: name,
          ico: "mdi:#{NAME_MAPPER.fetch( name, name )}"
        ).html_safe
      end

    end
  end
end
