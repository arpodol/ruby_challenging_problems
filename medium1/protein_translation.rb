class InvalidCodonError < StandardError ;end

class Translation
  RNA_HASH = {'Methionine' =>['AUG'],
              'Phenylalanine' => ['UUU', 'UUC'],
              'Leucine' => ['UUA', 'UUG'],
              'Serine' => ['UCU', 'UCC', 'UCA','UCG'],
              'Tyrosine' => ['UAU', 'UAC'],
              'Cysteine' => ['UGU', 'UGC'],
              'Tryptophan' => ['UGG'],
              'STOP' => ['UAA', 'UAG', 'UGA']
  }
  def self.of_codon(codon)
    RNA_HASH.select{|k,v| v.include?(codon)}.keys[0]
  end

  def self.of_rna(rna)
    codon_array = []
    rna.scan(/.../).each do |codon|
      rna_name = of_codon(codon)
      break if rna_name == 'STOP'
      codon_array << rna_name
    end
    raise InvalidCodonError if codon_array[0].nil?
    codon_array
  end

end
