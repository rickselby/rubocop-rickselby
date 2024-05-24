# frozen_string_literal: true

module Rubocop
  module RickSelby
    # Sample code to see how rubocop styles the samples
    module Style
      # Sample class with class methods
      class ClassMethodsDefinitions
        class << self
          def class_method = foo
        end

        def object_method = foo
      end

      def auto_resource_cleanup
        File.open "file" do |f|
          f.write "sth"
        end
      end

      def case_like_if
        case foo
        when :bar then :baz
        when :foo then :faz
        end
      end

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

      def string_literals_in_interpolation
        "This #{foo ? "thing" : "whatsit"}"
      end

      def symbol_array
        %i[foo]
      end

      def ternary_parentheses
        (a && b) ? c : d
      end

      def trailing_comma_in_arguments
        a = a 1, 2, 3
        b = b(
          1,
          2,
        )

        a + b
      end

      def trailing_comma_in_array_literal
        a = [1, 2, 3]
        b = [
          1,
          2,
        ]

        a + b
      end

      def trailing_comma_in_hash_literal
        a = { a: 1, b: 2, c: 3 }
        b = {
          a: 1,
          b: 2,
        }

        a + b
      end

      def unless_logical_operators
        return unless a || b

        c
      end

      def word_array
        %w[foo]
      end
    end
  end
end
