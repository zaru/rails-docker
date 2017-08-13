class SampleWorker
  include Sidekiq::Worker

  def perform(*args)
    p "sample worker"
  end
end
