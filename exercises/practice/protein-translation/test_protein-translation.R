source('./protein-translation.R')
library(testthat)

test_that("Empty RNA sequence results in no proteins", {
  expect_equal(proteins(""), NULL)
})

test_that("Methionine RNA sequence", {
  expect_equal(proteins("AUG"), 'Methionine')
})

test_that("Phenylalanine RNA sequence 1", {
  expect_equal(proteins("UUU"), 'Phenylalanine')
})

test_that("Phenylalanine RNA sequence 2", {
  expect_equal(proteins("UUC"), 'Phenylalanine')
})

test_that("Leucine RNA sequence 1", {
  expect_equal(proteins("UUA"), 'Leucine')
})

test_that("Leucine RNA sequence 2", {
  expect_equal(proteins("UUG"), 'Leucine')
})

test_that("Serine RNA sequence 1", {
  expect_equal(proteins("UCU"), 'Serine')
})

test_that("Serine RNA sequence 2", {
  expect_equal(proteins("UCC"), 'Serine')
})

test_that("Serine RNA sequence 3", {
  expect_equal(proteins("UCA"), 'Serine')
})

test_that("Serine RNA sequence 4", {
  expect_equal(proteins("UCG"), 'Serine')
})

test_that("Tyrosine RNA sequence 1", {
  expect_equal(proteins("UAU"), 'Tyrosine')
})

test_that("Tyrosine RNA sequence 2", {
  expect_equal(proteins("UAC"), 'Tyrosine')
})

test_that("Cysteine RNA sequence 1", {
  expect_equal(proteins("UGU"), 'Cysteine')
})

test_that("Cysteine RNA sequence 2", {
  expect_equal(proteins("UGC"), 'Cysteine')
})

test_that("Tryptophan RNA sequence", {
  expect_equal(proteins("UGG"), 'Tryptophan')
})

test_that("STOP codon RNA sequence 1", {
  expect_equal(proteins("UAA"), c())
})

test_that("STOP codon RNA sequence 2", {
  expect_equal(proteins("UAG"), c())
})

test_that("STOP codon RNA sequence 3", {
  expect_equal(proteins("UGA"), c())
})

test_that("Sequence of two protein codons translates into proteins", {
  expect_equal(proteins("UUUUUU"), c('Phenylalanine', 'Phenylalanine'))
})

test_that("Sequence of two different protein codons translates into proteins", {
  expect_equal(proteins("UUAUUG"), c('Leucine', 'Leucine'))
})

test_that("Translate RNA strand into correct protein list", {
  expect_equal(proteins("AUGUUUUGG"), 
               c('Methionine', 'Phenylalanine', 'Tryptophan'))
})

test_that("Translation stops if STOP codon at beginning of sequence", {
  expect_equal(proteins("UAGUGG"), c())
})

test_that("Translation stops if STOP codon at end of two-codon sequence", {
  expect_equal(proteins("UGGUAG"), c('Tryptophan'))
})

test_that("Translation stops if STOP codon at end of three-codon sequence", {
  expect_equal(proteins("AUGUUUUAA"), c('Methionine', 'Phenylalanine'))
})

test_that("Translation stops if STOP codon in middle of three-codon sequence", {
  expect_equal(proteins("UGGUAGUGG"), c('Tryptophan'))
})

test_that("Translation stops if STOP codon in middle of six-codon sequence", {
  expect_equal(proteins("UGGUGUUAUUAAUGGUUU"), 
               c('Tryptophan', 'Cysteine', 'Tyrosine'))
})

test_that("Non-existing codon can't translate", {
  expect_error(proteins("AAA"))
})

test_that("Unknown amino acids, not part of a codon, can't translate", {
  expect_error(proteins("XYZ"))
})

test_that("Incomplete RNA sequence can't translate", {
  expect_error(proteins("AUGU"))
})

test_that("Incomplete RNA sequence can translate if valid until a STOP codon", {
  expect_equal(proteins("UUCUUCUAAUGGU"), c('Phenylalanine', 'Phenylalanine'))
})

