# frozen_string_literal: true

module Rubocop
  module RickSelby
    # Sample code to see how rubocop styles the samples
    module Naming
      def method_parameter_name1(x, y, z)
        x + y + z
      end

      def method_parameter_name2(as, id, on)
        as + id + on
      end
    end
  end
end
