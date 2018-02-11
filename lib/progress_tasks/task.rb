module ProgressTasks
  class Task
    attr_reader :goal, :notifier

    NOT_IMPLEMENTED_ERROR_MSG = "You need to define the method #%s.".freeze

    def initialize(notifier=nil)
      @notifier = notifier || ProgressTasks::NullNotifier.new
    end

    def perform!
      @notifier.set_goal(goal)

      @notifier.started!
      perform do 
        @goal.increment!
        @notifier.incremented!
      end
      @notifier.finished!
    end

    def perform(&block)
      items.each do |item|
        process_item(item)
        block.call if block_given?
      end
    end

    def goal
      @goal ||= ProgressTasks::Goal.new(completed_on)
    end

    def items
      raise NotImplementedError, format(NOT_IMPLEMENTED_ERROR_MSG, :items)
    end

    def process_item(_)
      raise NotImplementedError, format(NOT_IMPLEMENTED_ERROR_MSG, :process_item)
    end

    def completed_on
      items.count
    end

    def label
      @goal.label
    end
  end
end