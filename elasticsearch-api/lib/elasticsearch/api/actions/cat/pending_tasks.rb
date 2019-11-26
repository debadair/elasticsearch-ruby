# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Cat
      module Actions

        # Returns a concise representation of the cluster pending tasks.

        #

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/cat-pending-tasks.html
        #
        def pending_tasks(arguments={})
          arguments = arguments.clone


          method = HTTP_GET
          path   = Utils.__pathify "_cat/pending_tasks"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:pending_tasks, [
          :format,
          :local,
          :master_timeout,
          :h,
          :help,
          :s,
          :time,
          :v
        ].freeze)

end
    end
  end
end
