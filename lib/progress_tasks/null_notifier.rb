module ProgressTasks
  class NullNotifier < ProgressTasks::Notifier
    def started!
    end

    def finished!
    end

    def incremented!
    end
  end
end