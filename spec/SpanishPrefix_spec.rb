# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/SpanishPrefix.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe SpanishPrefix do
      let(:instance) { SpanishPrefix.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        context "Given a male" do
          context "Who is young" do
            it_should_behave_like "a name generator", gender: "m", times: 5, age: rand(17), rgx: /^Sr\.$/
          end
          context "Who is older" do
            it_should_behave_like "a name generator", gender: "m", times: 5, age: rand(83) + 17, rgx: /^[DS]r\.$/
          end
        end # male
        context "Given a female" do
          context "Who is young" do
            it_should_behave_like "a name generator", gender: "f", times: 5, age: rand(17), rgx: /^Srta\.$/
          end
          context "Who is older" do
            it_should_behave_like "a name generator", gender: "f", times: 5, age: rand(83)+17, rgx: /^(?:Dr|Srt?)a.$/x
          end 
        end # female

      end
    end # SpanishPrefix
  end # Names
end # RandomPerson
