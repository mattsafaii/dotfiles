require 'irb/completion'

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

class Object
  # List methods that aren't inherited from superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end

# Copy last IRB result to clipboard
def cop
  last_value = IRB.CurrentContext.last_value
  %x[echo '#{last_value}' | pbcopy]
  "copied `#{last_value}' to clipboard"
end
