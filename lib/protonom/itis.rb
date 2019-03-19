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

      data, errors = @dwc.core.read
      data.each do |d|
        next if d[5] != 'valid'
        if @name_ranks.include?(d[6])
          yield Proto::ImportInput.new(taxon: taxon_item(d))
        else
          yield Proto::ImportInput.new(name_element: name_element_item(d))
        end
      end
    end

    def taxon_item(d)
      Proto::Taxon.new(
        id: d[0],
        accepted_name: Proto::AcceptedName.new(name: name_item(d))
      )
    end

    def name_item(d)
      Proto::Name.new(
        id: d[0],
        parent_id: d[1],
        name_string: d[3]
      )
    end

    def name_element_item(d)
      Proto::NameElement.new(
        id: d[0],
        parent_id: d[1],
        name_string: d[3]
      )
    end

    def init_itis
      itis = DwcaHunter.resources.select { |r| r.new.command == 'itis' }[0]
      itis.new
    end
  end
end
