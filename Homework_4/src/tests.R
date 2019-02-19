library(testthat)

source("functions.R")

test_that("standardize_street expected cases", {
  expect_equal(standardize_street("19TH Ave"), "19TH AVENUE")
  expect_equal(standardize_street("19TH ST"), "19TH STREET")
  expect_equal(standardize_street("Example Dr."), "EXAMPLE DRIVE")
  expect_equal(standardize_street("Example Pl "), "EXAMPLE PLACE")
  
})

test_that("standardize_street edge cases", {
  expect_equal(standardize_street("Ave Ave"), "AVE AVENUE")
  expect_equal(standardize_street("Ave St"), "AVE STREET")
})

test_that("standardize_street failure cases", {
  expect_error(standardize_street())
})

