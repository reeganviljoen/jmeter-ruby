module JmeterRuby
  class DSL
    def bsf_postprocessor(params={}, &block)
      node = JmeterRuby::BsfPostprocessor.new(params)
      attach_node(node, &block)
    end
  end

  class BsfPostprocessor
    attr_accessor :doc
    include Helper

    def initialize(params={})
      testname = params.kind_of?(Array) ? 'BsfPostprocessor' : (params[:name] || 'BsfPostprocessor')
      @doc = Nokogiri::XML(<<-EOS.strip_heredoc)
<BSFPostProcessor guiclass="TestBeanGUI" testclass="BSFPostProcessor" testname="#{testname}" enabled="true">
  <stringProp name="filename"/>
  <stringProp name="parameters"/>
  <stringProp name="script"/>
  <stringProp name="scriptLanguage"/>
</BSFPostProcessor>)
      EOS
      update params
      update_at_xpath params if params.is_a?(Hash) && params[:update_at_xpath]
    end
  end

end
