# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

class Sequencer
  class Unit
    module Import
      module Kayako
        module Post
          module Channel
            class Twitter < Sequencer::Unit::Import::Kayako::Post::Channel::Base
              def mapping
                super.merge(
                  message_id: original_post['id'],
                  to:         to,
                  body:       original_post['contents'],
                )
              end

              private

              def article_type_name
                return 'twitter direct-message' if original_post['resource_type'] == 'twitter_message'

                'twitter status'
              end

              def identify_key
                'screen_name'
              end

              def to
                return if original_post['recipient'].nil?

                original_post['recipient'][identify_key]
              end
            end
          end
        end
      end
    end
  end
end
