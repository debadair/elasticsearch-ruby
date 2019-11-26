# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Actions

      # Returns information and statistics about terms in the fields of a particular document.

      #
      # @option arguments [String] :index The index in which the document resides.
      # @option arguments [String] :id The id of the document, when not specified a doc param should be supplied.
      # @option arguments [Hash] :body Define parameters and or supply a document to get termvectors for. See documentation.

      #
      # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/docs-termvectors.html
      #
      def termvectors(arguments={})
        raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]
        arguments = arguments.clone

        _index = arguments.delete(:index)

        _id = arguments.delete(:id)


        method = HTTP_GET
        path   = Utils.__pathify "#{_index}/_termvectors/#{_id}", Utils.__listify(_index), Utils.__listify(_id)
        params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
        body   = arguments[:body]

        perform_request(method, path, params, body).body
      end


      # Register this action with its valid params when the module is loaded.
      #
      # @since 6.2.0
      ParamsRegistry.register(:termvectors, [
        :term_statistics,
        :field_statistics,
        :fields,
        :offsets,
        :positions,
        :payloads,
        :preference,
        :routing,
        :realtime,
        :version,
        :version_type
      ].freeze)

    end
  end
end
