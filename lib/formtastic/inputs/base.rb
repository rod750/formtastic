module Formtastic
  module Inputs
    module Base
      
      attr_accessor :builder, :template, :object, :object_name, :method, :options
      
      def initialize(builder, template, object, object_name, method, options)
        @builder = builder
        @template = template
        @object = object
        @object_name = object_name
        @method = method
        @options = options.dup
        
        warn_deprecated_option!(:value, ":input_html => { :value => '...'}")
        warn_deprecated_option!(:hint_class, "default_hint_class configuration")
        warn_deprecated_option!(:error_class, "default_error_class configuration")
        warn_deprecated_option!(:group_by, ":collection option with a HTML string generated by Rails' grouped_options_for_select()")
        warn_deprecated_option!(:group_label, ":collection option with a HTML string generated by Rails' grouped_options_for_select()")
        warn_deprecated_option!(:find_options, "YourModel.find(...)")
      end
      
      # Usefull for deprecating options.
      def warn_and_correct_option!(old_option_name, new_option_name)
        if options.key?(old_option_name)
          ::ActiveSupport::Deprecation.warn("The :#{old_option_name} option is deprecated in favour of :#{new_option_name} and will be removed from Formtastic in the next version")
          options[new_option_name] = options.delete(old_option_name)
        end
      end
      
      # Usefull for deprecating options.
      def warn_deprecated_option!(old_option_name, instructions)
        if options.key?(old_option_name)
          ::ActiveSupport::Deprecation.warn("The :#{old_option_name} option is deprecated in favour of `#{instructions}` and will be removed in the next version")
        end
      end
      
      # Usefull for raising an error on previously supported option.
      def removed_option!(old_option_name)
        raise ArgumentError, ":#{old_option_name} is no longer available" if options.key?(old_option_name)
      end
      
      extend ActiveSupport::Autoload
      
      autoload :Associations
      autoload :Collections
      autoload :Choices
      autoload :Database
      autoload :Errors
      autoload :Fileish
      autoload :GroupedCollections
      autoload :Hints
      autoload :Html
      autoload :Labelling
      autoload :Naming
      autoload :Numeric
      autoload :Options
      autoload :Placeholder
      autoload :Stringish
      autoload :Timeish
      autoload :Validations
      autoload :Wrapping
      
      include Html
      include Options
      include Database
      include Errors
      include Hints
      include Naming
      include Validations
      include Fileish
      include Associations
      include Labelling
      include Wrapping
      
    end
  end
end
  