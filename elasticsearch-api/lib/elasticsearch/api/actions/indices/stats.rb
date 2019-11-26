# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Indices
      module Actions

        # Provides statistics on operations happening in an index.

        #
        # @option arguments [List] :metric Limit the information returned the specific metrics. (options: _all,completion,docs,fielddata,query_cache,flush,get,indexing,merge,request_cache,refresh,search,segments,store,warmer,suggest)

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-stats.html
        #
        def stats(arguments={})
          arguments = arguments.clone

          _metric = arguments.delete(:metric)


          method = HTTP_GET
          path   = Utils.__pathify "_stats", Utils.__listify(_metric)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:stats, [
          :completion_fields,
          :fielddata_fields,
          :fields,
          :groups,
          :level,
          :types,
          :include_segment_file_sizes,
          :include_unloaded_segments,
          :expand_wildcards,
          :forbid_closed_indices
        ].freeze)

end
    end
  end
end
