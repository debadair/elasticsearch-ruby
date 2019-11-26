# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Performs an update on every document in the index without changing the source,
      # for example to pick up a mapping change.

      #
      # @option arguments [List] :index A comma-separated list of index names to search; use `_all` or empty string to perform the operation on all indices
      # @option arguments [Hash] :body The search definition using the Query DSL

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-update-by-query.html
      #
      def update_by_query(arguments={})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        arguments = arguments.clone

        _index = arguments.delete(:index)


        method = HTTP_POST
        path   = Utils.__pathify "#{_index}/_update_by_query", Utils.__listify(_index)
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = arguments[:body]

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:update_by_query, [
        :analyzer,
        :analyze_wildcard,
        :default_operator,
        :df,
        :from,
        :ignore_unavailable,
        :allow_no_indices,
        :conflicts,
        :expand_wildcards,
        :lenient,
        :pipeline,
        :preference,
        :q,
        :routing,
        :scroll,
        :search_type,
        :search_timeout,
        :size,
        :max_docs,
        :sort,
        :_source,
        :_source_excludes,
        :_source_includes,
        :terminate_after,
        :stats,
        :version,
        :version_type,
        :request_cache,
        :refresh,
        :timeout,
        :wait_for_active_shards,
        :scroll_size,
        :wait_for_completion,
        :requests_per_second,
        :slices
      ].freeze)

    end
  end
end
