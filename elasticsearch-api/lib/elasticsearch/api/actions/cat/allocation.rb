# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Cat
      module Actions

        # Provides a snapshot of how many shards are allocated to each data node and how much disk space they are using.

        #
        # @option arguments [List] :node_id A comma-separated list of node IDs or names to limit the returned information

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-allocation.html
        #
        def allocation(arguments={})
          raise ArgumentError, "Required argument 'node_id' missing" unless arguments[:node_id]
          arguments = arguments.clone

          _node_id = arguments.delete(:node_id)


          method = HTTP_GET
          path   = Utils.__pathify "_cat/allocation", Utils.__listify(_node_id)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:allocation, [
          :format,
          :bytes,
          :local,
          :master_timeout,
          :h,
          :help,
          :s,
          :v
        ].freeze)

end
    end
  end
end
