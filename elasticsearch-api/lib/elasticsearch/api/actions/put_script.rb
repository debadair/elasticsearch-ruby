# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Creates or updates a script.

      #
      # @option arguments [String] :id Script ID
      # @option arguments [Hash] :body The document (*Required*)

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-scripting.html
      #
      def put_script(arguments={})
        raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
        raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]
        arguments = arguments.clone

        _id = arguments.delete(:id)


        method = HTTP_PUT
        path   = Utils.__pathify "_scripts/#{_id}", Utils.__listify(_id)
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = arguments[:body]

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:put_script, [
        :timeout,
        :master_timeout,
        :context
      ].freeze)

    end
  end
end
