# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Allows to execute several search template operations in one request.

      #
      # @option arguments [List] :index A comma-separated list of index names to use as default
      # @option arguments [Hash] :body The request definitions (metadata-search request definition pairs), separated by newlines (*Required*)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/search-multi-search.html
      #
      def msearch_template(arguments={})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        arguments = arguments.clone

        _index = arguments.delete(:index)


        method = HTTP_GET
        path   = Utils.__pathify "_msearch/template", Utils.__listify(_index)
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = arguments[:body]

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:msearch_template, [
        :search_type,
        :typed_keys,
        :max_concurrent_searches,
        :rest_total_hits_as_int
      ].freeze)

    end
  end
end
