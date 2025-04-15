module JmeterRuby
  class ExtendedDSL < DSL
    def extract(params, &block)
      node = if params[:regex]
        params[:refname] = params[:name]
        params[:regex] = params[:regex] #CGI.escapeHTML
        params[:template] = params[:template] || "$1$"
        JmeterRuby::RegularExpressionExtractor.new(params)
      elsif params[:xpath]
        params[:refname] = params[:name]
        params[:xpathQuery] = params[:xpath]
        JmeterRuby::XpathExtractor.new(params)
      elsif params[:json]
        params[:VAR] = params[:name]
        params[:JSONPATH] = params[:json]
        JmeterRuby::Plugins::JsonPathExtractor.new(params)
      elsif params[:css]
        params[:refname] = params[:name]
        params[:expr] = params[:css]
        JmeterRuby::CssjqueryExtractor.new(params)
      end

      attach_node(node, &block)
    end

    alias web_reg_save_param extract
  end
end
