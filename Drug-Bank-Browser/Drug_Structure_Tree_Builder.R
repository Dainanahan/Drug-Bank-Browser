library(data.tree)
library(networkD3)
# search for salts, international-brands
# Main node
build_drug_bank_tree <- function() {
  drug <- Node$new("Drugs")
  
  groups <- drug$AddChild("Groups")
  
  names <- drug$AddChild("Names")
  
  references <- drug$AddChild("References")
  articles <- references$AddChild("Articles")
  books <- references$AddChild("Books")
  links <- references$AddChild("Links")
  
  classification <- drug$AddChild("Classification")
  synonyms <- drug$AddChild("Synonyms")
  products <- drug$AddChild("Products")
  mixtures <- drug$AddChild("Mixtures")
  packagers <- drug$AddChild("Packagers")
  manufacturers <- drug$AddChild("Manufacturers")
  prices <- drug$AddChild("Prices")
  categories <- drug$AddChild("Categories")
  affected_organisms <- drug$AddChild("Affected Organisms")
  dosages <- drug$AddChild("Dosages")
  atc <- drug$AddChild("ATC")
  ahfs <- drug$AddChild("AHFS")
  pdb_entries <- drug$AddChild("PDB Entries")
  patents <- drug$AddChild("Patents")
  pdb_entries <- drug$AddChild("PDB Entries")
  international_brands  <- drug$AddChild("international_brands")
  salts  <- drug$AddChild("salts")
  
  interactions <- drug$AddChild("Interactions")
  food <- interactions$AddChild("Food")
  drugs <- interactions$AddChild("Drugs")
  
  sequences <- drug$AddChild("Sequences")
  experimental_properties <-
    drug$AddChild("Experimental Properties")
  external_identifiers <- drug$AddChild("External Identifiers")
  external_links <- drug$AddChild("External Links")
  
  pathways <- drug$AddChild("Pathways")
  pathway_drugs <- pathways$AddChild("Drugs")
  pathway_enzymes <- pathways$AddChild("Enzymes")
  
  reactions <- drug$AddChild("Reactions")
  reactions_enzymes <- reactions$AddChild("Reactions Enzymes")
  
  snp_effects <- drug$AddChild("SNP Effects")
  snp_adverse_drug_reactions <- drug$AddChild("SNP Adverse DRs")
  
  targets <- drug$AddChild("Targets")
  targets_actions <- targets$AddChild("Actions")
  targets_references <- targets$AddChild("References")
  targets_references_articles <-
    targets_references$AddChild("Articles")
  targets_references_books <- targets_references$AddChild("Books")
  targets_references_links <- targets_references$AddChild("Links")
  targets_polypeptides <- targets$AddChild("Polypeptides")
  targets_polypeptides_external_identifiers <-
    targets_polypeptides$AddChild("External Identifiers")
  targets_polypeptides_go_classifiers <-
    targets_polypeptides$AddChild("GO Classifiers")
  targets_polypeptides_pfams <-
    targets_polypeptides$AddChild("PFAMS")
  targets_polypeptides_synonyms <-
    targets_polypeptides$AddChild("Synonyms")
  
  enzymes <- drug$AddChild("Enzymes")
  enzymes_actions <- enzymes$AddChild("Actions")
  enzymes_references <- enzymes$AddChild("References")
  enzymes_references_articles <-
    enzymes_references$AddChild("Articles")
  enzymes_references_books <- enzymes_references$AddChild("Books")
  enzymes_references_links <- enzymes_references$AddChild("Links")
  enzymes_polypeptides <- enzymes$AddChild("Polypeptides")
  enzymes_polypeptides_external_identifiers <-
    enzymes_polypeptides$AddChild("External Identifiers")
  enzymes_polypeptides_go_classifiers <-
    enzymes_polypeptides$AddChild("GO Classifiers")
  enzymes_polypeptides_pfams <-
    enzymes_polypeptides$AddChild("PFAMS")
  enzymes_polypeptides_synonyms <-
    enzymes_polypeptides$AddChild("Synonyms")
  
  carriers <- drug$AddChild("Carriers")
  carriers_actions <- carriers$AddChild("Actions")
  carriers_references <- carriers$AddChild("References")
  carriers_references_articles <-
    carriers_references$AddChild("Articles")
  carriers_references_books <- carriers_references$AddChild("Books")
  carriers_references_links <- carriers_references$AddChild("Links")
  carriers_polypeptides <- carriers$AddChild("Polypeptides")
  carriers_polypeptides_external_identifiers <-
    carriers_polypeptides$AddChild("External Identifiers")
  carriers_polypeptides_go_classifiers <-
    carriers_polypeptides$AddChild("GO Classifiers")
  carriers_polypeptides_pfams <-
    carriers_polypeptides$AddChild("PFAMS")
  carriers_polypeptides_synonyms <-
    carriers_polypeptides$AddChild("Synonyms")
  
  transporters <- drug$AddChild("Transporters")
  transporters_actions <- transporters$AddChild("Actions")
  transporters_references <- transporters$AddChild("References")
  transporters_references_articles <-
    transporters_references$AddChild("Articles")
  transporters_references_books <-
    transporters_references$AddChild("Books")
  transporters_references_links <-
    transporters_references$AddChild("Links")
  transporters_polypeptides <- transporters$AddChild("Polypeptides")
  transporters_polypeptides_external_identifiers <-
    transporters_polypeptides$AddChild("External Identifiers")
  transporters_polypeptides_go_classifiers <-
    transporters_polypeptides$AddChild("GO Classifiers")
  transporters_polypeptides_pfams <-
    transporters_polypeptides$AddChild("PFAMS")
  transporters_polypeptides_synonyms <-
    transporters_polypeptides$AddChild("Synonyms")
  
  return(drug)
}

radialNetwork(
  ToListExplicit(build_drug_bank_tree(), unname = TRUE))
