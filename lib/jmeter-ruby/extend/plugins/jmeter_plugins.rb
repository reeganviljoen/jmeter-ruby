module JmeterRuby
  class ExtendedDSL < DSL
    def response_codes_per_second(params = {}, &block)
      node = JmeterRuby::Plugins::ResponseCodesPerSecond.new(params)
      attach_node(node, &block)
    end

    def response_times_distribution(params = {}, &block)
      node = JmeterRuby::Plugins::ResponseTimesDistribution.new(params)
      attach_node(node, &block)
    end

    def response_times_over_time(params = {}, &block)
      node = JmeterRuby::Plugins::ResponseTimesOverTime.new(params)
      attach_node(node, &block)
    end

    def response_times_percentiles(params = {}, &block)
      node = JmeterRuby::Plugins::ResponseTimesPercentiles.new(params)
      attach_node(node, &block)
    end

    def transactions_per_second(params = {}, &block)
      node = JmeterRuby::Plugins::TransactionsPerSecond.new(params)
      attach_node(node, &block)
    end

    def latencies_over_time(params = {}, &block)
      node = JmeterRuby::Plugins::LatenciesOverTime.new(params)
      attach_node(node, &block)
    end

    def console_status_logger(params = {}, &block)
      node = JmeterRuby::Plugins::ConsoleStatusLogger.new(params)
      attach_node(node, &block)
    end

    alias console console_status_logger

    def throughput_shaper(params = {}, &block)
      node = JmeterRuby::Plugins::ThroughputShapingTimer.new(params)
      attach_node(node, &block)
    end

    alias shaper throughput_shaper

    def dummy_sampler(params = {}, &block)
      node = JmeterRuby::Plugins::DummySampler.new(params)
      attach_node(node, &block)
    end

    alias dummy dummy_sampler

    def stepping_thread_group(params = {}, &block)
      node = JmeterRuby::Plugins::SteppingThreadGroup.new(params)
      attach_node(node, &block)
    end

    alias step stepping_thread_group

    def ultimate_thread_group(params = {}, &block)
      node = JmeterRuby::Plugins::UltimateThreadGroup.new(params)

       (params.kind_of?(Array) ? params : params[:threads]).each_with_index do |group, index|
        node.doc.at_xpath('//collectionProp') <<
          Nokogiri::XML(<<-EOS.strip_heredoc).children
            <collectionProp name="index">
              <stringProp name="#{group[:start_threads]}">#{group[:start_threads]}</stringProp>
              <stringProp name="#{group[:initial_delay]}">#{group[:initial_delay]}</stringProp>
              <stringProp name="#{group[:start_time]}">#{group[:start_time]}</stringProp>
              <stringProp name="#{group[:hold_time]}">#{group[:hold_time]}</stringProp>
              <stringProp name="#{group[:stop_time]}">#{group[:stop_time]}</stringProp>
            </collectionProp>
          EOS
      end

      attach_node(node, &block)
    end

    alias ultimate ultimate_thread_group

    def composite_graph(params = {}, &block)
      node = JmeterRuby::Plugins::CompositeGraph.new(params)
      attach_node(node, &block)
    end

    alias composite composite_graph

    def active_threads_over_time(params = {}, &block)
      node = JmeterRuby::Plugins::ActiveThreadsOverTime.new(params)
      attach_node(node, &block)
    end

    alias active_threads active_threads_over_time

    def perfmon_collector(params = {}, &block)
      node = JmeterRuby::Plugins::PerfmonCollector.new(params)
      attach_node(node, &block)
    end

    alias perfmon perfmon_collector

    def loadosophia_uploader(params = {}, &block)
      node = JmeterRuby::Plugins::LoadosophiaUploader.new(params)
      attach_node(node, &block)
    end

    alias loadosophia loadosophia_uploader

    def redis_data_set(params = {}, &block)
      node = JmeterRuby::Plugins::RedisDataSet.new(params)
      attach_node(node, &block)
    end

    def jmx_collector(params = {}, &block)
      node = JmeterRuby::Plugins::JMXCollector.new(params)
      attach_node(node, &block)
    end
  end
end
