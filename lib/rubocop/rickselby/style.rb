# frozen_string_literal: true

module Rubocop
  module RickSelby
    # Sample code to see how rubocop styles the samples
    module Style
      def collection_methods
        hash.map { |h| h + 1 }
        hash.find :foo
      end

      def date_time
        Time.now
      end

      def float_division
        1.fdiv 2
      end

      def method_call_with_args_parentheses
        a foo
        b(foo).a(foo)
        Array(1)
        a(foo) || b(foo)
        a_very_long_method_name_with_equally_long_params_so_it_doesnt_fit_on_a_single_line(
          first_very_long_parameter_name_that_needs_to_be_long,
          second_very_long_parameter_name_that_needs_to_be_long
        )
      end
    end
  end
end
