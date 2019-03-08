# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: import.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "proto.NameElement" do
    optional :id, :string, 1
    optional :name, :string, 2
    optional :rank, :string, 3
    optional :authorship, :string, 4
    optional :parent, :message, 5, "proto.NameElement"
  end
  add_message "proto.Name" do
    optional :id, :string, 1
    optional :parent, :message, 2, "proto.NameElement"
    optional :hierarchy, :message, 3, "proto.LinnaeanClassification"
    optional :family, :string, 4
    optional :genus, :string, 5
    optional :subgenus, :string, 6
    optional :species, :string, 7
    optional :author_string, :string, 8
  end
  add_message "proto.MetaData" do
    optional :is_extinct, :bool, 1
    optional :life_zone, :string, 2
    optional :comment, :string, 3
    optional :scrutiny_expert, :string, 4
    optional :scrutiny_date, :string, 5
    optional :url, :string, 6
    optional :taxon_guid, :string, 7
    optional :name_guid, :string, 8
  end
  add_message "proto.Taxon" do
    optional :id, :string, 1
    optional :accepted_name, :message, 2, "proto.AcceptedName"
    repeated :synonyms, :message, 3, "proto.Synonym"
    repeated :common_names, :message, 4, "proto.CommonName"
    repeated :distributions, :message, 5, "proto.Distribution"
    repeated :references, :message, 6, "proto.Reference"
    optional :metadata, :message, 7, "proto.MetaData"
  end
  add_message "proto.AcceptedName" do
    optional :name, :message, 1, "proto.Name"
    optional :is_provisional, :bool, 2
    repeated :references, :message, 3, "proto.Reference"
  end
  add_message "proto.Synonym" do
    optional :name, :message, 1, "proto.Name"
    optional :type, :enum, 2, "proto.SynonymType"
    optional :status, :enum, 3, "proto.SynonymStatus"
    optional :comments, :string, 4
    repeated :references, :message, 5, "proto.Reference"
  end
  add_message "proto.CommonName" do
    optional :id, :string, 1
    optional :common_name, :string, 2
    optional :language, :string, 3
    optional :transliteration, :string, 4
    optional :country, :string, 5
    optional :area, :string, 6
    repeated :references, :message, 7, "proto.Reference"
  end
  add_message "proto.Distribution" do
    optional :geographic_name, :string, 1
    optional :gazetteer, :string, 2
    optional :is_native, :enum, 3, "proto.IsNative"
    optional :iucn_status, :enum, 4, "proto.IUCNStatus"
    repeated :references, :message, 5, "proto.Reference"
  end
  add_message "proto.LinnaeanClassification" do
    optional :kingdom, :string, 1
    optional :phylum, :string, 2
    optional :klass, :string, 3
    optional :superorder, :string, 4
    optional :order, :string, 5
    optional :suborder, :string, 6
    optional :superfamily, :string, 7
    optional :family, :string, 8
    optional :subfamily, :string, 9
    optional :supertribe, :string, 10
    optional :tribe, :string, 11
    optional :subtribe, :string, 12
  end
  add_message "proto.Reference" do
    optional :id, :string, 1
    optional :authors, :string, 2
    optional :year, :string, 3
    optional :title, :string, 4
    optional :source, :string, 5
  end
  add_message "proto.ImportInput" do
    repeated :taxa, :message, 1, "proto.Taxon"
  end
  add_message "proto.ImportStats" do
    optional :imported_taxa, :int32, 1
  end
  add_message "proto.Void" do
  end
  add_message "proto.Version" do
    optional :value, :string, 1
    optional :build, :string, 2
  end
  add_enum "proto.SynonymType" do
    value :HOMOTYPIC, 0
    value :HETEROTYPIC, 1
  end
  add_enum "proto.SynonymStatus" do
    value :MISAPPLIED_NAME, 0
    value :AMBIGUOUS_SYNONYM, 1
  end
  add_enum "proto.IsNative" do
    value :NATIVE, 0
    value :ALIEN, 1
    value :UNCERTAIN, 2
  end
  add_enum "proto.IUCNStatus" do
    value :EX, 0
    value :EW, 1
    value :CR, 2
    value :EN, 3
    value :VU, 4
    value :NT, 5
    value :CD, 6
    value :LC, 7
    value :DD, 8
    value :NE, 9
  end
end

module Proto
  NameElement = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.NameElement").msgclass
  Name = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.Name").msgclass
  MetaData = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.MetaData").msgclass
  Taxon = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.Taxon").msgclass
  AcceptedName = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.AcceptedName").msgclass
  Synonym = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.Synonym").msgclass
  CommonName = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.CommonName").msgclass
  Distribution = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.Distribution").msgclass
  LinnaeanClassification = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.LinnaeanClassification").msgclass
  Reference = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.Reference").msgclass
  ImportInput = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.ImportInput").msgclass
  ImportStats = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.ImportStats").msgclass
  Void = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.Void").msgclass
  Version = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.Version").msgclass
  SynonymType = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.SynonymType").enummodule
  SynonymStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.SynonymStatus").enummodule
  IsNative = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.IsNative").enummodule
  IUCNStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("proto.IUCNStatus").enummodule
end
