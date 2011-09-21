# encoding: UTF-8

module RandomPerson
  module Spec

    module Helpers

      def all_kind_of?( collection, kind )
        collection.all? {|c| c.kind_of? kind }
      end
    end # Helpers
  end # Spec
end # RandomPerson
