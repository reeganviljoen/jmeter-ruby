module JmeterRuby
  class ExtendedDSL < DSL
    def exists(variable, &block)
      params ||= {}
      params[:condition] = "\"${#{variable}}\" != \"\\${#{variable}}\""
      params[:useExpression] = false
      params[:name] = "if ${#{variable}}"
      node = JmeterRuby::IfController.new(params)

      attach_node(node, &block)
    end
  end
end
