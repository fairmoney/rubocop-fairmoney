# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Fairmoney::NoIfInTestDescriptions do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  # TODO: Write test code
  #
  # For example
  it 'registers an offense when using "if" in a test description' do
    expect_offense(<<~RUBY)
      it 'does X if Y' do; end;
         ^^^^^^^^^^^^^ Test descriptions should not include "if", use "when" instead
    RUBY
  end

  it 'does not register an offense when using "when" in a test description' do
    expect_no_offenses(<<~RUBY)
      it 'does X when Y' do; end;
    RUBY
  end
end
