# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          module AttributeType
            class Textarea < Sequencer::Unit::Import::Kayako::ObjectAttribute::AttributeType::Base
              private

              def data_type_specific_options
                {
                  type:      'textarea',
                  maxlength: 255,
                }
              end
            end
          end
        end
      end
    end
  end
end
