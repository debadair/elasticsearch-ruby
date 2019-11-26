# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
    module API
  module Tasks
      module Actions

        # Cancels a task, if it can be cancelled through an API.

        #
        # @option arguments [String] :task_id Cancel the task with specified task id (node_id:task_number)

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/tasks.html
        #
        def cancel(arguments={})
          raise ArgumentError, "Required argument 'task_id' missing" unless arguments[:task_id]
          arguments = arguments.clone

          _task_id = arguments.delete(:task_id)


          method = HTTP_POST
          path   = Utils.__pathify "_tasks/_cancel", Utils.__listify(_task_id)
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end


        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:cancel, [
          :nodes,
          :actions,
          :parent_task_id
        ].freeze)

end
    end
  end
end
