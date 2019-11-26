# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Allows to retrieve a large numbers of results from a single search request.

      #
      # @option arguments [String] :scroll_id The scroll ID
      # @option arguments [Hash] :body The scroll ID if not passed by URL or query parameter.

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-request-body.html#request-body-search-scroll
      #
      def scroll(arguments={})
        raise ArgumentError, "Required argument 'scroll_id' missing" unless arguments[:scroll_id]
        arguments = arguments.clone

        _scroll_id = arguments.delete(:scroll_id)


        method = HTTP_GET
        path   = Utils.__pathify "_search/scroll", Utils.__listify(_scroll_id)
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = arguments[:body]

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:scroll, [
        :scroll,
        :scroll_id,
        :rest_total_hits_as_int
      ].freeze)

    end
  end
end
