# frozen_string_literal: true

# TODO: when finished, run `rake generate_cops_documentation` to update the docs
module RuboCop
  module Cop
    module Fairmoney
      # This cop is used to enforce the use of "when" instead of "if" in test descriptions
      # In methods, use "if" in the method name to indicate the conditional
      # In test descriptions, it's not conditional anymore so use "when" instead
      #
      # @example
      #   # bad
      #   it 'raises an error if the category is unknown'
      #
      #   # good
      #   it 'raises an error when the category is unknown'
      #
      class NoIfInTestDescriptions < Cop
        MSG = 'Test descriptions should not include "if", use "when" instead'.freeze

        def on_send(node)
          return unless %i[describe context it xit it_behaves_like].include?(node.method_name)
          node.first_argument.each_node do |child_node|
            child_node.node_parts.each do |description_line|
              next unless description_line.class == String
              parse_description(child_node, description_line)
            end
          end
        end

        def autocorrect(node)
          lambda do |corrector|
            corrector.replace(node.source_range, node.source_range.source.gsub(' if ', ' when '))
          end
        end

        private

        def parse_description(node, description_line)
          return unless description_line.include?(' if ')
          add_offense(node)
        end
      end
    end
  end
end
