# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Allows to perform multiple index/update/delete operations in a single request.

      #
      # @option arguments [String] :index Default index for items which don't provide one
      # @option arguments [Hash] :body The operation definition and data (action-data pairs), separated by newlines (*Required*)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-bulk.html
      #
      def bulk(arguments={})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        arguments = arguments.clone

        _index = arguments.delete(:index)


        method = HTTP_POST
        path   = Utils.__pathify "_bulk", Utils.__listify(_index)
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = arguments[:body]

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:bulk, [
        :wait_for_active_shards,
        :refresh,
        :routing,
        :timeout,
        :type,
        :_source,
        :_source_excludes,
        :_source_includes,
        :pipeline
      ].freeze)

    end
  end
end
