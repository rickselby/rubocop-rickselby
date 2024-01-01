# frozen_string_literal: true

module Rubocop
  # Sample code to see if rubocop does the right thing
  module Rickselby
    def begin_end_block
      a = begin
        foo = bar
        foo + baz
      end
      a + 1
    end

    def block_alignment
      foo.bar.baz do
        sth
      end

      foo.bar
         .baz do
           sth
         end
    end

    def case_statement_assignment
      a = case foo
          when 1 then bar
          else baz
          end
      a + 1
    end
  end
end
