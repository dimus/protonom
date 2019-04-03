# namespace module for importing data to protonom
module Protonom
  # Imports ITIS data to protonom
  class Itis
    def initialize(renew = false)
      @renew = renew
      @itis_file = File.join(Dir.tmpdir,
                             'dwca_hunter',
                             'itis',
                             'dwca.tar.gz')
      @data_provider = init_data_provider
      if @renew || !File.exist?(@itis_file)
        @itis = init_itis
        DwcaHunter.process(@itis)
      end
      @dwc = DarwinCore.new(@itis_file)
      @name_ranks = %w[Species Subspecies Variety Form Subvariety Subform]
      @taxon_id = 0
    end

    def process
      items = nil
      Client.new.import(self).each { |count| items = count }
      items.imported_taxa
    end

    def each_item
      return enum_for(:each_item) unless block_given?

      yield Proto::ImportInput.new(data_provider: @data_provider)
      data, errors = @dwc.core.read
      data.each do |d|
        next if d[5] == 'invalid'

        if ['valid', 'accepted'].include?(d[5])
          if @name_ranks.include?(d[6])
            yield Proto::ImportInput.new(taxon: taxon_item(d))
          else
            yield Proto::ImportInput.new(name_element: name_element_item(d))
          end
        else
          yield Proto::ImportInput.new(synonym: synonym_item(d))
        end
      end
    end

    def taxon_item(d)
      Proto::Taxon.new(
        id: d[0],
        data_provider_id: @data_provider.id,
        accepted_name: Proto::AcceptedName.new(name: name_item(d))
      )
    end

    def synonym_item(d)
      Proto::Synonym.new(
        id: d[0],
        accepted_name_id: d[2],
        name: d[3],
        comments: [d[5], d[6]].join(", ")
      )
    end

    def name_item(d)
      Proto::Name.new(
        id: d[0],
        parent_id: d[1],
        name_string: d[3],
        rank: d[6]
      )
    end

    def name_element_item(d)
      Proto::NameElement.new(
        id: d[0],
        parent_id: d[1],
        name_string: d[3],
        rank: d[6]
      )
    end

    def init_itis
      itis = DwcaHunter.resources.select { |r| r.new.command == 'itis' }[0]
      itis.new
    end

    def init_data_provider
      Proto::DataProvider.new(
        id: "cefbf4b6-ed2d-41b1-85ac-7a5758e86d57",
        title: "Integrated Taxonomic Information System (ITIS)",
        alias: "itis"
      )
    end
  end
end
