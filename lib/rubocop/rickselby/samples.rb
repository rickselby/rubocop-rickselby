# frozen_string_literal: true

module Rubocop
  # Sample code to see how rubocop styles the samples
  module Rickselby
    def block_alignment
      foo.bar.baz do
        sth
      end

      foo.bar
         .baz do
           sth
         end
    end
  end
end
