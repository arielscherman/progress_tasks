module ProgressTasks
  class Notifier
    attr_reader :goal
    
    NOT_IMPLEMENTED_ERROR_MSG = "You need to define the method #%s.".freeze

    def set_goal(goal)
      @goal = goal
    end

    def started!
      raise NotImplementedError, format(NOT_IMPLEMENTED_ERROR_MSG, :started!)
    end

    def finished!
      raise NotImplementedError, format(NOT_IMPLEMENTED_ERROR_MSG, :finished!)
    end

    def incremented!
      raise NotImplementedError, format(NOT_IMPLEMENTED_ERROR_MSG, :incremented!)
    end
  end
end