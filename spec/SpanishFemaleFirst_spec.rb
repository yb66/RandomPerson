# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/SpanishFemaleFirst.rb"

module RandomPerson
  module Names

    describe SpanishFemaleFirst do
      let(:instance) { SpanishFemaleFirst.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      it_should_behave_like "a name generator", times: SpanishFemaleFirst::Names.length
    end # SpanishFemaleFirst

  end # Names
end # RandomPerson
