# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Cluster
      module Actions

        # Returns high-level overview of cluster statistics.

        #
        # @option arguments [List] :node_id A comma-separated list of node IDs or names to limit the returned information; use `_local` to return information from the node you're connecting to, leave empty to get information from all nodes

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cluster-stats.html
        #
        def stats(arguments={})
          raise ArgumentError, "Required argument 'node_id' missing" unless arguments[:node_id]
          arguments = arguments.clone

          _node_id = arguments.delete(:node_id)


          method = HTTP_GET
          path   = Utils.__pathify "_cluster/stats", Utils.__listify(_node_id)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:stats, [
          :flat_settings,
          :timeout
        ].freeze)

end
    end
  end
end
