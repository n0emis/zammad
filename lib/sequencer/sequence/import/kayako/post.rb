# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

class Sequencer
  class Sequence
    module Import
      module Kayako
        class Post < Sequencer::Sequence::Base
          def self.sequence
            [
              'Common::ModelClass::Ticket::Article',
              'Import::Kayako::Common::CreatedById',
              'Import::Kayako::Common::ArticleSenderId',
              'Import::Kayako::Common::ArticleSourceChannel',
              'Import::Kayako::Post::Mapping',
              'Import::Kayako::Post::InlineImages',
              'Import::Kayako::Mapping::Timestamps',
              'Import::Kayako::Post::UnsetInstance',
              'Import::Common::Model::FindBy::MessageId',
              'Import::Common::Model::Update',
              'Import::Common::Model::Create',
              'Import::Common::Model::Save',
              'Import::Kayako::MapId',
              'Import::Kayako::Post::Attachments',
            ]
          end
        end
      end
    end
  end
end
