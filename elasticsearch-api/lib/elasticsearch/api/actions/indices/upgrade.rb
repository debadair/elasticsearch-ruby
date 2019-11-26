# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Indices
      module Actions

        # The _upgrade API is no longer useful and will be removed.

        #
        # @option arguments [List] :index A comma-separated list of index names; use `_all` or empty string to perform the operation on all indices

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-upgrade.html
        #
        def upgrade(arguments={})
          raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
          arguments = arguments.clone

          _index = arguments.delete(:index)


          method = HTTP_POST
          path   = Utils.__pathify "_upgrade", Utils.__listify(_index)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:upgrade, [
          :allow_no_indices,
          :expand_wildcards,
          :ignore_unavailable,
          :wait_for_completion,
          :only_ancient_segments
        ].freeze)

end
    end
  end
end
