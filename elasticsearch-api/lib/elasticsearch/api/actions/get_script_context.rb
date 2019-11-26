# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Returns all script contexts.

      #

      #
      # @see [TODO]
      #
      def get_script_context(arguments={})
        arguments = arguments.clone


        method = HTTP_GET
        path   = Utils.__pathify "_script_context"
        params = {}
        body   = nil

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0

    end
  end
end
