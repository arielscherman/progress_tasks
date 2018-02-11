module ProgressTasks
  class Goal
    attr_reader   :number, :progress

    def initialize(number)
      @number    = number
      @progress  = 0

      set_status # set as completed if goal is zero.
    end

    def increment!(progress = 1)
      @progress += progress
      set_status
    end

    def completed?
      @completed
    end

    protected

    # Set the goal as completed if the objective was achieved.
    #
    def set_status
      @completed = @progress == @number
    end
  end
end