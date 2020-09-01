# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/fairmoney'
require_relative 'rubocop/fairmoney/version'
require_relative 'rubocop/fairmoney/inject'

RuboCop::Fairmoney::Inject.defaults!

require_relative 'rubocop/cop/fairmoney_cops'
