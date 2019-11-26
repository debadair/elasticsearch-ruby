# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Returns results matching a query.

      #
      # @option arguments [List] :index A comma-separated list of index names to search; use `_all` or empty string to perform the operation on all indices
      # @option arguments [Hash] :body The search definition using the Query DSL

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/search-search.html
      #
      def search(arguments={})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        arguments = arguments.clone

        _index = arguments.delete(:index)


        method = HTTP_GET
        path   = Utils.__pathify "_search", Utils.__listify(_index)
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = arguments[:body]

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:search, [
        :analyzer,
        :analyze_wildcard,
        :ccs_minimize_roundtrips,
        :default_operator,
        :df,
        :explain,
        :stored_fields,
        :docvalue_fields,
        :from,
        :ignore_unavailable,
        :ignore_throttled,
        :allow_no_indices,
        :expand_wildcards,
        :lenient,
        :preference,
        :q,
        :routing,
        :scroll,
        :search_type,
        :size,
        :sort,
        :_source,
        :_source_excludes,
        :_source_includes,
        :terminate_after,
        :stats,
        :suggest_field,
        :suggest_mode,
        :suggest_size,
        :suggest_text,
        :timeout,
        :track_scores,
        :track_total_hits,
        :allow_partial_search_results,
        :typed_keys,
        :version,
        :seq_no_primary_term,
        :request_cache,
        :batched_reduce_size,
        :max_concurrent_shard_requests,
        :pre_filter_shard_size,
        :rest_total_hits_as_int
      ].freeze)

    end
  end
end
