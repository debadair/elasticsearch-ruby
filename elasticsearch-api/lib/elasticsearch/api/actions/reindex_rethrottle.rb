# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Changes the number of requests per second for a particular Reindex operation.

      #
      # @option arguments [String] :task_id The task id to rethrottle

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-reindex.html
      #
      def reindex_rethrottle(arguments={})
        raise ArgumentError, "Required argument 'task_id' missing" unless arguments[:task_id]
        arguments = arguments.clone

        _task_id = arguments.delete(:task_id)


        method = HTTP_POST
        path   = Utils.__pathify "_reindex/#{_task_id}/_rethrottle", Utils.__listify(_task_id)
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = nil

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:reindex_rethrottle, [
        :requests_per_second
      ].freeze)

    end
  end
end
