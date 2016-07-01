require 'yap/addon'
require 'yap-shell-addon-right-prompt/version'

module YapShellAddonRightPrompt
  class Addon < ::Yap::Addon::Base
    self.export_as :'right-prompt'

    def initialize_world(world)
      @world = world

      @world.subscribe(:refresh_right_prompt) do |event|
        @world.right_prompt_text = Time.now.strftime("%H:%M:%S")
      end

      @world.events.recur(
        name: "refresh_right_prompt", source: self, interval_in_ms: 1_000
      )
    end
  end
end
