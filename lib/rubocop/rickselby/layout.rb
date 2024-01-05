# frozen_string_literal: true

module Rubocop
  module RickSelby
    # Sample code to see how rubocop styles the samples
    module Layout
      # rubocop:disable Layout/RedundantLineBreak
      def block_alignment
        foo.bar.baz do
          sth
        end

        foo.bar
           .baz do
             sth
           end
      end
      # rubocop:enable Layout/RedundantLineBreak

      def first_array_element_line_break
        [
          1,
          2,
        ]
      end

      def first_hash_element_line_break
        {
          a: 1,
          b: 2,
        }
      end

      # rubocop:disable Layout/RedundantLineBreak
      def hash_alignment
        a = {
          a:  1,
          bc: 2,
        }

        b = {
          1  => 1,
          23 => 2,
        }

        a + b
      end
      # rubocop:enable Layout/RedundantLineBreak

      def multiline_array_line_breaks
        [
          1,
          2,
          3,
          4,
          5,
          6,
        ]
      end

      def multiline_assignment_layout
        foo = if expression
                2
              else
                3
              end
        foo + 1
      end

      def multiline_hash_key_line_breaks
        {
          a: 1,
          b: 2,
          c: 3,
        }
      end

      def redundant_line_break
        a = { a: 1, bc: 2 }
        foo.bar.baz { sth a }
      end
    end
  end
end
