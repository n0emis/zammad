# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

class Sequencer
  class Unit
    module Import
      module Kayako
        module ObjectAttribute
          module AttributeType
            class Type < Sequencer::Unit::Import::Kayako::ObjectAttribute::AttributeType::Select
              private

              def options
                super.merge(
                  'Question' => 'Question',
                  'Task'     => 'Task',
                  'Problem'  => 'Problem',
                  'Incident' => 'Incident',
                )
              end
            end
          end
        end
      end
    end
  end
end
